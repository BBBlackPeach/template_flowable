import { defineStore } from 'pinia'
import type { StorageLike } from 'pinia-plugin-persistedstate'
import { secureSessionStorage } from '@/utils/storageSecure'

const useMenuSt: StorageLike = {
    setItem(key: string, value: string) {
        secureSessionStorage.setItem(key, value)
    },
    getItem(key: string): string | null {
        return secureSessionStorage.getItem(key)
    }
}

const useMenuStore = defineStore('useMenuStore', () => {
    // 是否水平折叠收起菜单
    const collapseTF = ref(false);
    // 当前tab
    const currentTab = ref();
    // tab数组
    // 此处使用reactive会有bug
    // pinia持久化存储无法实时更新reactive类型
    const tabs = ref([]);

    // 修改菜单折叠状态
    const changeCollapse = () => {
        collapseTF.value = !collapseTF.value;
    }

    // 设置折叠状态（刷新时用）
    const setCollapse = (newValue: boolean) => {
        collapseTF.value = newValue;
    }

    // 修改当前tab
    const setCurrentTab = (newValue: string) => {
        currentTab.value = newValue;
    }

    // 添加tabs的元素
    const addTabs = (tabName: string
    ) => {
        // 第一种比较写法
        const index = tabs.value.findIndex((e) => e.name == tabName);
        if (index == -1) {
            tabs.value.push({
                name: tabName
            });
            return true;
        }
        currentTab.value = tabName;
        return false;
    }

    // 删除tabs的元素
    const removeTabs = (tabName: string
    ) => {
        // 第二种比较写法
        const index = tabs.value.findIndex((e) => e.name == tabName);
        // const index = tabs.indexOf(tabName);
        if (index != -1) {
            tabs.value.splice(index, 1);
            return true;
        }
        return false;
    }

    const setMenuNull = () => {
        collapseTF.value = false;
        currentTab.value = null;
        tabs.value = [];
    }

    return {
        collapseTF,
        currentTab,
        tabs,
        changeCollapse,
        setCollapse,
        setCurrentTab,
        addTabs,
        removeTabs,
        setMenuNull
    }
}, {
    persist: {
        key: 'menuInfo',
        storage: useMenuSt
    }
}
)

export default useMenuStore
