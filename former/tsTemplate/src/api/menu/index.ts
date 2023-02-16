import request from "@/utils/request";

//查询用户菜单树
export const getMenuTreeApi = (userName: string) => {
    return request.get(`/menu/getMenuTree/${userName}`);
}

//查询菜单列表
export const getMenuListApi = () => {
    return request.get("/menu/getMenuList")
}

//添加菜单
export const addMenuApi = (NewMenuData: any) => {
    return request.post("/menu/addMenu", NewMenuData)
}

//更新用户信息
export const updateMenuApi = (UpdateMenuData: any) => {
    return request.post("/menu/updateMenu",
        UpdateMenuData)
}

// 删除用户
export const deleteMenuApi = (id: number) => {
    return request.delete(`/menu/deleteMenu/${id}`)
}

//验证菜单名称
export const checkMenuNameApi = (menuName: string) => {
    return request.get("/menu/checkMenuName", {
        name: menuName,
    })
}

//验证菜单URL
export const checkMenuUrlApi = (menuUrl: string) => {
    return request.get("/menu/checkMenuUrl", {
        url: menuUrl,
    })
}

//验证菜单文件地址
export const checkFilePathApi = (filePath: string) => {
    return request.get("/menu/checkFilePath", {
        filePath: filePath,
    })
}

//验证权限字段
export const checkMenuPermsApi = (menuPerms: string) => {
    return request.get("/menu/checkMenuPerms", {
        menuPerms: menuPerms,
    })
}

//获取所有目录(类型为0)
export const getCatalogueDataApi = () => {
    return request.get("/menu/getCatalogueData")
}

//获取所有菜单(类型为1)
export const getMenuDataApi = () => {
    return request.get("/menu/getMenuData")
}

//查询所有目录，菜单，包括按钮
export const getAllMenuApi = () => {
    return request.get("/menu/getAllMenu")
}