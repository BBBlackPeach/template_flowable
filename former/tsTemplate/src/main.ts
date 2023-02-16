import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
//引入国际化
import zhCn from 'element-plus/es/locale/lang/zh-cn'
//引入element plus
import ElementPlus from 'element-plus'
import * as ELIcons from '@element-plus/icons-vue'
import 'element-plus/dist/index.css'
//引入pinia
import { createPinia } from 'pinia'
// 持久化存储pinia
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import { permission } from '@/directives/permission'

const app = createApp(App)

//ELIcons作为全局变量使用
for (const name in ELIcons) {
    app.component(name, (ELIcons as any)[name])
}
app.use(ElementPlus, {
    locale: zhCn,
})
app.use(createPinia().use(piniaPluginPersistedstate))

// 自定义指令实现按钮权限封装
app.directive("perms", permission)

app.use(router).mount('#app')

// 禁止回退
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL)
})