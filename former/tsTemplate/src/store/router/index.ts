import { defineStore } from 'pinia'

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
        storage: sessionStorage
    }
}
)

export default useRouterStore