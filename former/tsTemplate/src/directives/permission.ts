// permission.ts

// 引入vue中定义的指令对应的类型定义
import { Directive } from 'vue'

export const permission: Directive = {
    // 这是指令的一个生命周期
    mounted(el, binding) {
        // 获取用户使用自定义指令绑定的内容
        const { value } = binding;
        // 获取用户所有的权限
        const permissions = [];
        const userInfoStorage = JSON.parse(sessionStorage.getItem('userInfo'));
        if (userInfoStorage) {
            const uesrPermissions = userInfoStorage.permissions;
            if (uesrPermissions && uesrPermissions != "") {
                uesrPermissions.forEach(perm => {
                    permissions.push(perm)
                })
            }
        }
        // JSON.parse(sessionStorage.getItem('userInfoStorage')).forEach(perm => {
        //     permissions.push(perm)
        // })
        // 判断用户使用自定义指令，是否使用正确了
        if (value && value instanceof Array && value.length > 0) {
            // 判断传递进来的按钮权限，用户是否拥有
            const hasPermission = permissions.some((per) => {
                return value.includes(per)
            })
            if (!hasPermission) {
                // 当用户没有这个按钮权限时，隐藏这个按钮
                // el.style.display = 'none'
                // 禁用 （需要自己设置样式）
                el.disabled = true
                el.style.cursor = 'not-allowed'
                el.style.backgroundImage = 'none'
                el.style.backgroundImage = 'none'
                el.style.backgroundColor = '#fab6b6'
                el.style.borderColor = '#fab6b6'

                // ps：可用
                // el.style.cursor = 'pointer'
            }
        } else {
            throw new Error("按钮权限指令示例： v-perms='['organization:add']'")
        }
    }
}


// 注意，我们这里写的自定义指令，传递内容是一个数组，也就说，按钮权限可能是由
// 多个因素决定的，如果你的业务场景只由一个因素决定，自定义指令也可以不传递一个数组，
// 只传递一个字符串就可以了
// 但当前使用必须传递一个数组 例如：v-perms="['sys:log:delete']"