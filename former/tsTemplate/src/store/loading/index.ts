import { defineStore } from 'pinia'

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
            key: 'userInfo',
            storage: sessionStorage
        }
    }
)

export default useLoadingStore