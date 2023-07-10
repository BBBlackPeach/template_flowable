import { defineStore } from 'pinia'
import type { StorageLike } from 'pinia-plugin-persistedstate'
import { secureSessionStorage } from '@/utils/storageSecure'

//会话缓存加密
const useUserSt: StorageLike = {
    setItem(key: string, value: string) {
        secureSessionStorage.setItem(key, value)
    },
    getItem(key: string): string | null {
        return secureSessionStorage.getItem(key)
    }
}

const useUserStore = defineStore('useUserStore', () => {

    const userInfo = ref({
        userId: "",
        name: "",
        nickName: "",
        avatar: "",
        roleNames: null,
    })

    const token = ref()

    const permissions = ref()

    const setUserInfo = (newUserInfo: any) => {
        userInfo.value.userId = newUserInfo.userId;
        userInfo.value.name = newUserInfo.name;
        userInfo.value.nickName = newUserInfo.nickName;
        userInfo.value.avatar = newUserInfo.avatar;
        userInfo.value.roleNames = newUserInfo.roleNames;
    }

    const setName = (newName: any) => {
        userInfo.value.name = newName;
    }

    const setNickName = (newNickName: any) => {
        userInfo.value.nickName = newNickName;
    }

    const setAvatar = (newAvatar: any) => {
        userInfo.value.avatar = newAvatar;
    }

    const setRoleNames = (newRoleNames: any) => {
        userInfo.value.roleNames = newRoleNames;
    }

    const setToken = (newToken: string) => {
        token.value = newToken;
    }

    const setPermissions = (newPermissions: any) => {
        permissions.value = newPermissions;
    }

    const setUserInfoNull = () => {
        userInfo.value.userId = "";
        userInfo.value.name = "";
        userInfo.value.nickName = "";
        userInfo.value.avatar = "";
        userInfo.value.roleNames = "";
        token.value = "";
        permissions.value = "";
    }

    return {
        userInfo,
        token,
        permissions,
        setUserInfo,
        setName,
        setNickName,
        setAvatar,
        setRoleNames,
        setToken,
        setPermissions,
        setUserInfoNull
    }
},
    // 默认存储在localStorage中
    // key为第一个参数
    // {
    //     persist:true
    // }, 
    {
        persist: {
            key: 'userInfo',
            storage: useUserSt
        }
    }
)

export default useUserStore
