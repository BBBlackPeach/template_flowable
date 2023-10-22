import { defineStore } from 'pinia'
import type { StorageLike } from 'pinia-plugin-persistedstate'
import { secureSessionStorage } from '@/utils/storageSecure'

const useStyleSt: StorageLike = {
    setItem(key: string, value: string) {
        secureSessionStorage.setItem(key, value)
    },
    getItem(key: string): string | null {
        return secureSessionStorage.getItem(key)
    }
}

/**
 * 1、菜单栏背景颜色
 * 2、菜单栏字体颜色
 * 3、菜单栏选中字体颜色
 * 4、头部背景颜色
 * 5、头部字体颜色
 * 6、标签页被选中颜色
 * 7、内容页背景颜色
 */
const defaultAsideBackgroundColor = "#3c5de3"
const defaultAsideTextColor = "#ffffff"
const defaultAsideActiveTextColor = "#FFE14D"
const defaultHeaderBackgroundColor = "#ffffff"
const defaultHeaderTextColor = "#000000"
const defaultTabActiveTextColor = "#1890ff"
const defaultMainBackgroundColor = "#e9eef3"
const defaultBackgroundImageFlag = false
// const defaultGlobalBackgroundImageUrl = "ht/231016/223346-16974668265cf4.jpg"
const defaultGlobalBackgroundImageUrl = "https://pic.netbian.com/uploads/allimg/231016/223346-16974668265cf4.jpg"

const useStyleStore = defineStore('useStyleStore', () => {

    const asideBackgroundColor = ref(defaultAsideBackgroundColor);
    const asideTextColor = ref(defaultAsideTextColor);
    const asideActiveTextColor = ref(defaultAsideActiveTextColor);
    const headerBackgroundColor = ref(defaultHeaderBackgroundColor);
    const headerTextColor = ref(defaultHeaderTextColor);
    const tabActiveTextColor = ref(defaultTabActiveTextColor);
    const mainBackgroundColor = ref(defaultMainBackgroundColor);
    const backgroundImageFlag = ref(defaultBackgroundImageFlag);
    const globalBackgroundImageUrl = ref(defaultGlobalBackgroundImageUrl);

    const setDefaultStyle = () => {
        asideBackgroundColor.value = defaultAsideBackgroundColor;
        asideTextColor.value = defaultAsideTextColor;
        asideActiveTextColor.value = defaultAsideActiveTextColor;
        headerBackgroundColor.value = defaultHeaderBackgroundColor;
        headerTextColor.value = defaultHeaderTextColor;
        tabActiveTextColor.value = defaultTabActiveTextColor;
        mainBackgroundColor.value = defaultMainBackgroundColor;
        backgroundImageFlag.value = defaultBackgroundImageFlag;
        globalBackgroundImageUrl.value = defaultGlobalBackgroundImageUrl;
    }

    const setNewStyle = (newStyle: any) => {
        asideBackgroundColor.value = newStyle.asideBackgroundColor;
        asideTextColor.value = newStyle.asideTextColor;
        asideActiveTextColor.value = newStyle.asideActiveTextColor;
        headerBackgroundColor.value = newStyle.headerBackgroundColor;
        headerTextColor.value = newStyle.headerTextColor;
        tabActiveTextColor.value = newStyle.tabActiveTextColor;
        mainBackgroundColor.value = newStyle.mainBackgroundColor;
        backgroundImageFlag.value = newStyle.backgroundImageFlag;
        globalBackgroundImageUrl.value = newStyle.globalBackgroundImageUrl;
    }

    const setAsideBackgroundColor = (newAsideBackgroundColor: any) => {
        asideBackgroundColor.value = newAsideBackgroundColor;
    }

    const setAsideTextColor = (newAsideTextColor: string) => {
        asideTextColor.value = newAsideTextColor;
    }

    const setAsideActiveTextColor = (newAsideActiveTextColor: string) => {
        asideActiveTextColor.value = newAsideActiveTextColor;
    }

    const setHeaderBackgroundColor = (newHeaderBackgroundColor: string) => {
        headerBackgroundColor.value = newHeaderBackgroundColor;
    }

    const setHeaderTextColor = (newHeaderTextColor: string) => {
        headerTextColor.value = newHeaderTextColor;
    }

    const setTabActiveTextColor = (newTabActiveTextColor: string) => {
        tabActiveTextColor.value = newTabActiveTextColor;
    }

    const setMainBackgroundColor = (newMainBackgroundColor: string) => {
        mainBackgroundColor.value = newMainBackgroundColor;
    }

    const setBackgroundImageFlag = (newBackgroundImageFlag: any) => {
        backgroundImageFlag.value = newBackgroundImageFlag;
    }

    const setGlobalBackgroundImageUrl = (newGlobalBackgroundImageUrl: string) => {
        globalBackgroundImageUrl.value = newGlobalBackgroundImageUrl;
    }

    return {
        asideBackgroundColor,
        asideTextColor,
        asideActiveTextColor,
        headerBackgroundColor,
        headerTextColor,
        tabActiveTextColor,
        mainBackgroundColor,
        backgroundImageFlag,
        globalBackgroundImageUrl,
        setDefaultStyle,
        setNewStyle,
        setAsideBackgroundColor,
        setAsideTextColor,
        setAsideActiveTextColor,
        setHeaderBackgroundColor,
        setHeaderTextColor,
        setTabActiveTextColor,
        setMainBackgroundColor,
        setBackgroundImageFlag,
        setGlobalBackgroundImageUrl
    }
},
    // 默认存储在localStorage中
    // key为第一个参数
    // {
    //     persist:true
    // }, 
    {
        persist: {
            key: 'styleInfo',
            storage: useStyleSt
        }
    }
)

export default useStyleStore