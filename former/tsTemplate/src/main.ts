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
import MyPD from '@/views/process/Process/index.js';

//防止localStorage被篡改
window.addEventListener('storage', (e: any) => {
    localStorage.setItem(e.key, e.oldValue)
})

//防止sessionStorage被篡改
window.addEventListener('storage', (e: any) => {
    sessionStorage.setItem(e.key, e.oldValue)
})

// 禁止回退
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL)
})

//禁用F12
// window.onkeydown = window.onkeyup = window.onkeypress = function (event) {
//     // 判断是否按下F12，F12键码为123
//     if (event.keyCode = 123) {
//         event.preventDefault() // 阻止默认事件行为
//         window.event.returnValue = false
//     }
// }

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

app.use(MyPD)

app.use(router).mount('#app')

// 禁止回退
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL)
})