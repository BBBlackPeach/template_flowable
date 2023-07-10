import { defineStore } from 'pinia'
import type { StorageLike } from 'pinia-plugin-persistedstate'
import { secureSessionStorage } from '@/utils/storageSecure'

const useRouterSt: StorageLike = {
    setItem(key: string, value: string) {
        secureSessionStorage.setItem(key, value)
    },
    getItem(key: string): string | null {
        return secureSessionStorage.getItem(key)
    }
}

const useRouterStore = defineStore('useRouterStore', () => {
    // 用户的动态菜单(路由信息)
    const routerList = ref();

    const indexMenuList = ref();

    // 设置用户动态菜单
    const setRouterList = (newRouterList: any) => {
        routerList.value = newRouterList;
    }

    const setIndexMenuList = (newIndexMenuList: any) => {
        indexMenuList.value = newIndexMenuList;
    }

    // 清空菜单
    const setRouterNull = () => {
        routerList.value = null;
        indexMenuList.value = null;
    }

    return {
        routerList,
        indexMenuList,
        setRouterList,
        setIndexMenuList,
        setRouterNull
    }
}, {
    persist: {
        key: 'routerInfo',
        storage: useRouterSt
    }
}
)

export default useRouterStore