import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from "axios";
import { baseURL } from "@/utils/url";
import { ElMessage } from 'element-plus';
import useUserStore from '@/store/user';
import { storeToRefs } from 'pinia';
import router from '@/router';
// 以下router的引用方法是错的，以下引用方法只能在set up中使用
// import { useRouter } from 'vue-router';
// const router = useRouter()


//axios配置
const config = {
    baseURL: baseURL,
    headers: {
        'Content-Type': 'application/json;charset=UTF-8'
    },
    timeout: 50000,  // 指定请求超时的毫秒数
    withCredentials: false,  // 表示跨域请求时是否需要使用凭证
}

//定义返回值类型
export interface Result<T = any> {
    code: number,
    msg: string,
    data: T
}

class Request {
    //定义axios的实例
    private instance: AxiosInstance;

    //构造函数：初始化
    constructor(config: AxiosRequestConfig) {
        //创建axios实例
        this.instance = axios.create(config)
        //定义拦截器
        this.interceptors()
    }

    //拦截器:处理请求发送和请求返回的数据
    private interceptors() {
        // 前置拦截器
        //请求发送之前的处理，通常用来携带token到请求的头部
        this.instance.interceptors.request.use((config) => {
            //在请求的头部添加token 
            // 未从状态管理中拿，因为页面刷新后pinia会重置，因此需要从sessionStorage中获取
            // const userStore = useUserStore();
            // const { token } = storeToRefs(userStore);  //可以在cookies、sessionStorage里面获取

            const userInfoStorage = JSON.parse(sessionStorage.getItem('userInfo'));  //可以在cookies、sessionStorage里面获取
            if (userInfoStorage) {
                const token = userInfoStorage.token;
                if (token && token != "") {
                    //设置token到头部
                    config.headers!['token'] = token
                }
            }
            return config;
        }, (error: any) => {
            error.data = {}
            error.data.msg = '服务器异常，请联系管理员!'
            return error;
        })

        // 后置拦截器
        //请求返回之后的拦截器：可以根据后端返回的状态码，做想要的提示
        this.instance.interceptors.response.use((res: AxiosResponse) => {
            if (res.data.code != 200) {
                return res.data
                // ElMessage.error(res.data.msg || '服务器出错!')
                // return Promise.reject(res.data.msg || '服务器出错')
            } else {
                return res.data
            }
        }, (error: any) => {
            console.log(error);
            if (error.request.status) {
                switch (error.request.status) {
                    // 401: 未登录
                    // 未登录则跳转登录页面            
                    case 401:
                        router.replace({
                            path: '/login',
                        });
                        break;
                    // 403 没有权限 或者 token过期
                    // 登录过期对用户进行提示
                    // 清除本地token和清空pinia中token对象
                    // 跳转登录页面                
                    case 403:
                        ElMessage({
                            message: '登录过期，请重新登录',
                            duration: 1000,
                            type: 'warning',
                        });
                        // 清除token
                        // localStorage.removeItem('token');
                        // store.commit('loginSuccess', null);
                        // 跳转登录页面，并将要浏览的页面Path传过去，登录成功后跳转需要访问的页面 
                        setTimeout(() => {
                            router.replace({
                                path: '/login',
                            });
                        }, 1000);
                        break;
                    // 404请求不存在
                    case 404:
                        ElMessage({
                            message: '网络请求不存在',
                            duration: 1500,
                            type: 'error',
                        });
                        break;
                }
                return Promise.reject(error.res);
            }
        })
    }


    //api封装
    //GET请求
    get<T = Result>(url: string, params?: any): Promise<T> {
        return this.instance.get(url, { params })
    }

    //POST请求
    post<T = Result>(url: string, data?: any): Promise<T> {
        return this.instance.post(url, data)
    }

    //PUT请求
    put<T = Result>(url: string, data?: any): Promise<T> {
        return this.instance.put(url, data)
    }

    //DELETE请求
    delete<T = Result>(url: string): Promise<T> {
        return this.instance.delete(url)
    }
}

//导出工具类
export default new Request(config)