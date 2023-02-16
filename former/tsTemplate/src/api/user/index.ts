import request from "@/utils/request";

//根据用户名获取按钮权限
export const getPermissions = (name: string) => {
    return request.get("/user/getPermissions", { name })
}

//根据用户名获取用户信息
export const getUserByNickApi = (name: string) => {
    return request.get(`/user/nickName/${name}`)
}

//分页获取用户信息
export const getUserListApi = (currentPage: number, pageSize: number) => {
    return request.get("/user/getUserList", {
        current: currentPage,
        page: pageSize,
    })
}

// 分页查询用户信息
export const searchUserApi = (currentPage: number, pageSize: number, searchWord: string) => {
    return request.get("/user/searchUser", {
        current: currentPage,
        page: pageSize,
        searchWord: searchWord,
    })
}

//新增用户
export const addUserApi = (NewUserData: any) => {
    return request.post("/user/addUser",
        NewUserData)
}

//更新用户信息
export const updateUserApi = (UpdateUserData: any) => {
    return request.post("/user/updateUser",
        UpdateUserData)
}

// 删除用户
export const deleteUserApi = (id: number) => {
    return request.delete(`/user/deleteUser/${id}`)
}

//验证用户名
export const checkUserNameApi = (userName: string) => {
    return request.get("/user/checkUserName", {
        name: userName,
    })
}

//获取所有角色，以便给用户分配 Select配套
export const getRoleSelectApi = () => {
    return request.get("/user/getRoleSelect")
}

//获取用户角色
export const getUserRolesApi = (userId: any) => {
    return request.get("/user/getUserRoles", { userId: userId })
}

//导出excel传递参数
export const sendExportParmApi = (sysUserExportParamsModel: any) => {
    return request.post("/user/sendExportParm", sysUserExportParamsModel)
}

//更新个人信息
export const updateOwnInfoApi = (UpdateUserData: any) => {
    return request.post("/user/updateOwnInfo",
        UpdateUserData)
}

//验证个人原密码
export const checkOldPasswordApi = (UpdatePasswordParm: any) => {
    return request.post("/user/checkOldPassword",
        UpdatePasswordParm)
}

//验证个人信息
export const checkUserInfoApi = (UpdatePasswordParm: any) => {
    return request.post("/user/checkUserInfo",
        UpdatePasswordParm)
}

//修改登录密码
export const updatePasswordApi = (UpdatePasswordParm: any) => {
    return request.post("/user/updatePassword",
        UpdatePasswordParm)
}