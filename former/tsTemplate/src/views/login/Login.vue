<template>
    <div class="login-container flx-center" v-loading="loadingTF">
        <div class="login-box">
            <div class="login-left">
                <div class="title">后台管理系统开发模板</div>
                <div class="sub">北京某某信息科技有限公司</div>
                <img src="../../assets/login.png" alt="" />
            </div>

            <div class="login-form">
                <!-- <div class="login-logo">
                    <img class="login-icon" src="../../assets/logo.png" alt="" />
                </div> -->
                <div class="login-logo">
                    <p class="logo-text">欢迎登录</p>
                </div>
                <el-form ref="loginFormRef" :model="loginForm" :rules="loginRules" size="large">
                    <el-form-item prop="username">
                        <el-input :prefix-icon="User" v-model="loginForm.username" placeholder="用户名">
                        </el-input>
                    </el-form-item>
                    <el-form-item prop="password">
                        <el-input :prefix-icon="Lock" type="password" show-password v-model="loginForm.password"
                            placeholder="密码">
                        </el-input>
                    </el-form-item>
                    <el-form-item prop="verifyStatus">
                        <SlidingVerify ref="slidingVerify" :status="loginForm.verifyStatus" :successFun="onVerifySuccess"
                            :errorFun="onVerifyError"></SlidingVerify>
                    </el-form-item>
                    <el-row class="flx-row">
                        <el-col :span="20">
                            <el-checkbox style="flex: 1" v-model="loginForm.checked" label="记住密码" size="large" />
                        </el-col>
                        <el-col class="flx-col" :span="4" @click="openForgetDialog">
                            忘记密码?
                        </el-col>
                    </el-row>
                    <!-- <el-checkbox style="flex: 1" v-model="loginForm.checked" label="记住密码" size="large" />
                      <span>忘记密码？</span> -->
                </el-form>

                <div class="login-btn">
                    <el-button :icon="UserFilled" round @click="login(loginFormRef)" size="large" type="primary">
                        登录
                    </el-button>
                    <el-button :icon="CircleClose" round @click="resetForm(loginFormRef)" size="large">重置</el-button>
                </div>
            </div>
        </div>
    </div>
    <!-- 忘记密码窗口 -->
    <el-dialog v-model="forgetDialogFlag" title="找回密码" width="40%" draggable center :before-close="closeForgetDialog">
        <ul ref="addDialogTop" style="overflow: auto;height:228px;padding: 0;">
            <el-steps :active="activeStep" finish-status="success" align-center style="margin-bottom: 35px;">
                <el-step title="步骤 1" description="输入用户名" />
                <el-step title="步骤 2" description="验证账号信息" />
                <el-step title="步骤 3" description="修改密码" />
            </el-steps>
            <el-form label-position="right" label-width="180px" :model="ForgetFormData" style="max-width: 100%">
                <el-row v-show="activeStep == 1">
                    <el-col :span="18">
                        <el-form-item label="用户名" prop="userName" :rules="[
                            { required: true, message: '请输入用户名', trigger: ['change'] }]">
                            <el-input v-model="ForgetFormData.userName" size="large" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-show="activeStep == 2">
                    <el-col :span="18">
                        <el-form-item label="姓名" prop="nickName" :rules="[
                            { required: true, message: '请输入姓名', trigger: ['change'] }]">
                            <el-input v-model="ForgetFormData.nickName" size="large" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-show="activeStep == 2">
                    <el-col :span="18">
                        <el-form-item label="身份证号" prop="identity" :rules="[
                            { required: true, message: '请输入身份证号', trigger: ['change'] }]">
                            <el-input type="number" v-model="ForgetFormData.identity" size="large" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-show="activeStep == 3">
                    <el-col :span="18">
                        <el-form-item label="新密码" prop="firstPassword" :rules="[
                            { required: true, message: '请输入新密码', trigger: ['change'] }]">
                            <el-input v-model="ForgetFormData.firstPassword" size="large" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row v-show="activeStep == 3">
                    <el-col :span="18">
                        <el-form-item label="再次输入密码" prop="secondPassword" :rules="[
                            { required: true, message: '请再次输入密码', trigger: ['change'] }]">
                            <el-input v-model="ForgetFormData.secondPassword" size="large" />
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
        </ul>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="goBack" v-if="activeStep != 1">上一步</el-button>
                <el-button type="primary" @click="toNext">
                    下一步
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<script setup lang="ts">
import { Base64 } from 'js-base64'
import { UserFilled, Lock, User, CircleClose } from '@element-plus/icons-vue'
import { ElMessage, FormInstance, FormRules } from 'element-plus';
import useUserStore from '@/store/user';
import useRouterStore from '@/store/router';
import { loginApi, checkUserNameApi, checkUserInfoApi, updatePasswordApi } from '@/api/login'
import { getMenuTreeApi } from '@/api/menu'
import { getUserByNickApi, getPermissions } from '@/api/user'
import { setRoutes } from '@/router';
const userStore = useUserStore()
const routerStore = useRouterStore()
const router = useRouter()

const loginFormRef = ref<FormInstance>()
const loadingTF = ref(false)
const slidingVerify = ref()
const loginForm = reactive({
    username: '',
    password: '',
    verifyStatus: null,
    checked: true,
})


const forgetDialogFlag = ref(false)
const activeStep = ref(1)
const ForgetFormData = reactive({
    userName: '',
    nickName: '',
    identity: '',
    firstPassword: '',
    secondPassword: ''
})

const loginRules = reactive<FormRules>({
    username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
    password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
    verifyStatus: [{ required: true, message: '请拖动滑块验证', trigger: 'blur' }]
})

onMounted(() => {
    getCookie()
})

const login = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate(async (valid, fields) => {
        if (valid) {
            setLoadingT()
            loginApi(loginForm).then(async res => {
                if (res && res.code == 200 && res.data != 0) {
                    if (loginForm.checked) {
                        let password = Base64.encode(loginForm.password) // base64加密
                        setCookie(loginForm.username, password, 7)
                    } else {
                        setCookie('', '', -1)
                    }
                    // 存储token
                    userStore.setToken(res.data.token)

                    // 再次发请求，但是发请求之前，要带上token
                    let navTree = await getMenuTreeApi(loginForm.username);
                    setRoutes(navTree.data);
                    routerStore.setRouterList(navTree.data);
                    console.log("用户菜单", navTree.data);

                    let perms = await getPermissions(loginForm.username)
                    console.log("用户权限", perms.data)
                    userStore.setPermissions(perms.data)

                    //获取登录人的信息 登陆成功通过username返回user信息
                    let user = await getUserByNickApi(loginForm.username)
                    console.log("获取用户信息", user.data)
                    const userInfo = {
                        userId: user.data.id,
                        name: user.data.name,
                        nickName: user.data.nickName,
                        avatar: user.data.avatar,
                        roleNames: user.data.roleNames,
                    }
                    userStore.setUserInfo(userInfo)
                    setLoadingF();
                    router.push('/index');
                } else {
                    setLoadingF();
                    ElMessage.error(res.msg);
                    slidingVerify.value.onRefresh();
                    router.push('/');
                }
            }, err => {
                setLoadingF();
                ElMessage({
                    message: '服务器出错，请联系管理员！',
                    type: 'error',
                    duration: 4000
                })
            })
        } else {
            ElMessage({
                message: '请根据提示操作！',
                type: 'error',
                duration: 4000
            })
        }
    })
}

const onVerifySuccess = (e) => {
    loginForm.verifyStatus = e;
}

const onVerifyError = (e) => {
    loginForm.verifyStatus = e;
}

const resetForm = (formEl1: FormInstance | undefined) => {
    slidingVerify.value.onRefresh();
    if (!formEl1) return
    formEl1.resetFields()
}

const setCookie = (userId: string, password: string, days: any) => {
    let date = new Date() // 获取时间
    date.setTime(date.getTime() + 24 * 60 * 60 * 1000 * days) // 保存的天数
    // 字符串拼接cookie
    window.document.cookie =
        'userId' + '=' + userId + ';path=/;expires=' + date
    window.document.cookie =
        'password' + '=' + password + ';path=/;expires=' + date
}

// 读取cookie 将用户名和密码回显到input框中
const getCookie = () => {
    if (document.cookie.length > 0) {
        let arr = document.cookie.split('; ') //分割成一个个独立的“key=value”的形式
        for (let i = 0; i < arr.length; i++) {
            let arr2 = arr[i].split('=') // 再次切割，arr2[0]为key值，arr2[1]为对应的value
            if (arr2[0] === 'userId') {
                loginForm.username = arr2[1]
            } else if (arr2[0] === 'password') {
                loginForm.password = Base64.decode(arr2[1]) // base64解密
                loginForm.checked = true
            }
        }
    }
}

const setLoadingT = () => {
    loadingTF.value = true;
}

const setLoadingF = () => {
    loadingTF.value = false;
}

// 打开找回密码窗口
const openForgetDialog = () => {
    forgetDialogFlag.value = true;
}

// 返回上一步
const goBack = () => {
    if (activeStep.value == 2) {
        activeStep.value = 1;
        ForgetFormData.nickName = "";
        ForgetFormData.identity = "";
    } else if (activeStep.value == 3) {
        activeStep.value = 2;
        ForgetFormData.firstPassword = "";
        ForgetFormData.secondPassword = "";
    }
}

// 进入下一步
const toNext = () => {
    if (activeStep.value == 1) {
        if (ForgetFormData.userName != null && ForgetFormData.userName != "") {
            setLoadingT();
            checkUserNameApi(ForgetFormData).then(res => {
                setLoadingF();
                if (res.data == true) {
                    activeStep.value = 2;
                    ElMessage({
                        message: '用户名验证成功！',
                        type: 'success',
                    })
                } else {
                    ElMessage({
                        message: '不存在该用户名，请检查！',
                        type: 'error',
                        duration: 4000
                    })
                }
            })
        } else {
            ElMessage({
                message: '用户名不能为空！',
                type: 'error',
                duration: 4000
            })
        }
    } else if (activeStep.value == 2) {
        if (ForgetFormData.nickName != null && ForgetFormData.nickName != ""
            && ForgetFormData.identity != null && ForgetFormData.identity != "") {
            setLoadingT();
            checkUserInfoApi(ForgetFormData).then(res => {
                setLoadingF();
                if (res.data == true) {
                    activeStep.value = 3;
                    ElMessage({
                        message: '账号信息验证成功！',
                        type: 'success',
                    })
                } else {
                    ElMessage({
                        message: res.msg,
                        type: 'error',
                        duration: 4000
                    })
                }
            })
        } else {
            ElMessage({
                message: '姓名或身份证号不能为空！',
                type: 'error',
                duration: 4000
            })
        }
    } else if (activeStep.value == 3) {
        if (ForgetFormData.firstPassword != null && ForgetFormData.firstPassword != ""
            && ForgetFormData.secondPassword != null && ForgetFormData.secondPassword != "") {
            if (ForgetFormData.firstPassword == ForgetFormData.secondPassword) {
                setLoadingT();
                updatePasswordApi(ForgetFormData).then(res => {
                    setLoadingF();
                    if (res.data == 1) {
                        ElMessage({
                            message: '密码修改成功！',
                            type: 'success',
                        });
                        closeForgetDialog();
                    } else {
                        ElMessage({
                            message: '密码修改失败',
                            type: 'error',
                            duration: 4000
                        })
                    }
                })
            } else {
                ElMessage({
                    message: '两次输入的密码不一致，请检查！',
                    type: 'error',
                    duration: 4000
                })
            }
        } else {
            ElMessage({
                message: '密码不能为空！',
                type: 'error',
                duration: 4000
            })
        }
    }
}

// 关闭找回密码窗口
const closeForgetDialog = () => {
    forgetDialogFlag.value = false;
    ForgetFormData.userName = "";
    ForgetFormData.nickName = "";
    ForgetFormData.identity = "";
    ForgetFormData.firstPassword = "";
    ForgetFormData.secondPassword = "";
}

</script>

<style scoped lang="scss">
.login-container {
    width: 100vw;
    height: 100vh;
    background-image: url('../../assets/login-bg.svg');
    background-size: 100% 100%;
    display: flex;
    align-items: center;
    justify-content: center;

    .login-box {
        width: 94%;
        height: 92%;
        background-color: hsla(0, 0%, 100%, 0.85);
        border-radius: 10px;
        padding: 0 8% 0 50px;
        box-sizing: border-box;
        display: flex;
        align-items: center;
        justify-content: space-around;

        .login-left {
            width: 800px;
            color: #6E736FFF;

            .title {
                font-size: 48px;
                font-weight: 400;
                letter-spacing: 0px;
                color: rgba(47, 57, 78, 1);
                text-align: left;
            }

            img {
                width: 735px;
                height: 465px;
            }
        }

        .login-form {
            width: 400px;
            height: 500px;
            padding: 10px 40px 35px 40px;
            border-radius: 10px;
            -webkit-box-shadow: 2px 3px 7px rgb(0 0 0 / 20%);
            box-shadow: 2px 3px 7px rgb(0 0 0 / 20%);

            .login-logo {
                display: flex;
                align-items: center;
                justify-content: center;
                // margin-bottom: 45px;

                .login-icon {
                    margin-top: 10px;
                    width: 200px;
                    // height: 52px;
                }

                .logo-text {
                    font-weight: bold;
                    font-size: 32px;
                    padding-left: 5px;
                    margin-top: 80px;
                    // margin-top: 10px;
                    margin-bottom: 20px;
                    white-space: nowrap;
                    color: #2d51e6;
                }
            }

            .flx-row {
                font-size: 14px;
                // color: #3c5de3;
                color: #2d51e6;

                .flx-col {
                    display: flex;
                    align-items: center;
                    cursor: pointer;
                }
            }

            .login-btn {
                margin-top: 15px;
                padding-bottom: 20px;
                display: flex;
                justify-content: space-between;
                width: 100%;
                white-space: nowrap;

                .el-button {
                    width: 185px;
                }
            }
        }
    }
}
</style>