import request from "@/utils/request";

// 删除照片
export const deletePhotoApi = (photoURL: string) => {
    return request.get("/photo/deletePhoto", { photoURL: photoURL });
}