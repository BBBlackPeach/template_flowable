import { defineStore } from 'pinia'
import type { StorageLike } from 'pinia-plugin-persistedstate'
import { secureSessionStorage } from '@/utils/storageSecure'

const useLoadingSt: StorageLike = {
    setItem(key: string, value: string) {
        secureSessionStorage.setItem(key, value)
    },
    getItem(key: string): string | null {
        return secureSessionStorage.getItem(key)
    }
}


const useLoadingStore = defineStore('useLoadingStore', () => {
    const loadingTF = ref(false)

    const setLoadingT = () => {
        loadingTF.value = true;
    }

    const setLoadingF = () => {
        loadingTF.value = false;
    }

    return {
        loadingTF,
        setLoadingT,
        setLoadingF
    }
},
    // 默认存储在localStorage中
    // key为第一个参数
    // {
    //     persist:true
    // }, 
    {
        persist: {
            key: 'loadingInfo',
            storage: useLoadingSt
        }
    }
)

export default useLoadingStore