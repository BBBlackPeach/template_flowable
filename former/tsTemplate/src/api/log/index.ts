import request from "@/utils/request";

//查询日志列表
export const getLogListApi = (currentPage: number, pageSize: number) => {
    return request.get("/log/getLogList", {
        current: currentPage,
        page: pageSize,
    })
}

// 删除日志
export const deleteLogApi = (id: number) => {
    return request.delete(`/log/deleteLog/${id}`)
}

// 删除7天前的日志
export const sevenDayDeleteApi = () => {
    return request.delete("/log/sevenDayDelete")
}