import { createRouter, createWebHashHistory, RouteRecordRaw } from "vue-router"
import useRouterStore from '@/store/router';
import { storeToRefs } from 'pinia';

const Layout = () => import('@/layout/Home.vue')
const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        redirect: '/login'
    },
    {
        path: '/login',
        component: () => import('@/views/login/Login.vue')
    },
]

const router = createRouter({
    history: createWebHashHistory(),
    scrollBehavior: () => {
        history.pushState(null, null, document.URL)
    },
    routes: routes
})


//动态生成菜单
export const setRoutes = (userMenuList) => {
    if (userMenuList) {
        let modules = import.meta.glob('../views/**/*.vue');
        const indexMenuList = [];
        userMenuList.forEach(menu => {
            //当是顶级菜单时
            if (menu.parentId == 0) {
                // 该顶级菜单有二级菜单
                if (menu.type == 0 || menu.children.length != 0) {
                    // 首先添加一级自己
                    let firstMenu = {
                        path: menu.url,
                        name: menu.name,
                        component: Layout,
                        meta: {
                            name: menu.name,
                            icon: menu.icon
                        },
                        children: []
                    }
                    // 再循环添加二级菜单
                    menu.children.forEach(item => {
                        if (item.url) {
                            let itemMenu = {
                                path: item.url,
                                name: item.name,
                                component: modules[`../views${item.filePath}.vue`],
                                // 用于配合tabs
                                meta: {
                                    name: item.name,
                                    icon: menu.icon
                                }
                            }
                            firstMenu.children.push(itemMenu);

                            // 前面是路由，现在添加首页菜单
                            let indexMenuItem = {
                                name: item.name,
                                icon: item.icon,
                                color: item.color
                            }

                            indexMenuList.push(indexMenuItem);
                        }
                    });
                    router.addRoute(firstMenu)
                } else {
                    // 无二级菜单
                    let firstMenu = {
                        path: menu.url,
                        component: Layout,
                        redirect: menu.url,
                        name: menu.name,
                        children: [{
                            path: menu.url,
                            name: menu.name,
                            component: modules[`../views${menu.filePath}.vue`],
                            meta: {
                                name: menu.name,
                                icon: menu.icon
                            },
                        }]
                    }

                    // 前面是路由，现在添加首页菜单
                    if (menu.name != "首页") {
                        // 把首页排除掉
                        let indexMenuItem = {
                            name: menu.name,
                            icon: menu.icon,
                            color: menu.color
                        }
                        indexMenuList.push(indexMenuItem);
                    }

                    router.addRoute(firstMenu)
                }
            }
        });
        const routerStore = useRouterStore();
        routerStore.setIndexMenuList(indexMenuList);
    }
    // }
}

// 移除动态添加的路由
export const removeRoutes = () => {
    const routerStore = useRouterStore();
    const { routerList } = storeToRefs(routerStore);
    if (routerList.value != null) {
        console.log(routerList);
        routerList.value.map((e) => {
            router.removeRoute(e.name);
        })
    }
}

//前置路由守卫
router.beforeEach((to, from, next) => {
    //如果访问的是登录界面或者注册界面直接放行
    if (to.path == '/' || to.path == '/login') {
        next();
    }
    else if (from.name == null) {
        if (router.getRoutes().length <= 2) {
            const routerStore = useRouterStore();
            const { routerList } = storeToRefs(routerStore);
            setRoutes(routerList.value);
            // 如果 addRoute 并未完成，路由守卫会一层一层的执行执行，直到 addRoute 完成，找到对应的路由
            next({ path: to.path, replace: true });
        } else {
            next();
        }
    }
    else {
        next()
    }
})

// 后置路由守卫
router.afterEach((to, from) => {
    history.pushState(null, null, location.protocol + '//' + location.host + '/#' + to.path)
})

export default router