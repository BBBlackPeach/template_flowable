import request from "@/utils/request";

//登录
export const loginApi = (parm: any) => {
    return request.post("/login/login", parm)
}

// 验证用户名
export const checkUserNameApi = (parm: any) => {
    return request.post("/login/forgetPassword/checkUserName", parm)
}

// 验证姓名、身份证号
export const checkUserInfoApi = (parm: any) => {
    return request.post("/login/forgetPassword/checkUserInfo", parm)
}

// 修改用户密码
export const updatePasswordApi = (parm: any) => {
    return request.post("/login/forgetPassword/updatePassword", parm)
}