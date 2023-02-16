import request from "@/utils/request";

//分页获取用户信息
export const getRoleListApi = (currentPage: number, pageSize: number) => {
    return request.get("/role/getRoleList", {
        current: currentPage,
        page: pageSize,
    })
}

// 分页查询用户信息
export const searchRoleApi = (currentPage: number, pageSize: number, searchWord: string) => {
    return request.get("/role/searchRole", {
        current: currentPage,
        page: pageSize,
        searchWord: searchWord,
    })
}

//新增用户
export const addRoleApi = (NewRoleData: any) => {
    return request.post("/role/addRole",
        NewRoleData)
}

//更新用户信息
export const updateRoleApi = (UpdateRoleData: any) => {
    return request.post("/role/updateRole",
        UpdateRoleData)
}

// 删除用户
export const deleteRoleApi = (id: number) => {
    return request.delete(`/role/deleteRole/${id}`)
}

//验证用户名
export const checkRoleNameApi = (roleName: string) => {
    return request.get("/role/checkRoleName", {
        name: roleName,
    })
}

//通过角色查询该角色当前权限
export const getRoleAuthorApi = (roleId: string) => {
    return request.get(`/role/getRoleAuthor/${roleId}`)
}

//保存权限
export const updateAuthorApi = (parm: any) => {
    return request.post('/role/updateAuthor', parm)
}
