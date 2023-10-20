<template>
  <div>
    <el-scrollbar>
      <el-menu :uniqueOpened="true" :default-active="currentTab" :collapse="collapseTF" class="el-menu-vertical"
        :background-color="styleStore.asideBackgroundColor" :text-color="styleStore.asideTextColor"
        :active-text-color="styleStore.asideActiveTextColor" router>
        <!-- background-color="#191A23" text-color="#fff" active-text-color="#1890FF" router> -->
        <!-- background-color="#1F6761" text-color="#fff" active-text-color="#1890FF" router> -->
        <template v-for="(menu, index) in routerList" :key="index">
          <el-menu-item v-if="menu.children.length == 0" :index="menu.name" :route="menu.url"
            @click="clickMenu(menu.name)">
            <el-icon>
              <component :is="menu.icon"></component>
            </el-icon>
            <span>{{ menu.name }}</span>
          </el-menu-item>
          <el-sub-menu v-else :index="menu.name" :route="menu.url">
            <template #title>
              <el-icon>
                <component :is="menu.icon"></component>
              </el-icon>
              <span>{{ menu.name }}</span>
            </template>
            <div v-for="(item, index) in menu.children" :key="index">
              <el-menu-item :index="item.name" :route="item.url" @click="clickMenu(item.name)">
                <el-icon>
                  <component :is="item.icon"></component>
                </el-icon>
                <span>{{ item.name }}</span>
              </el-menu-item>
            </div>
          </el-sub-menu>
        </template>
      </el-menu>
    </el-scrollbar>
  </div>
</template>

<script setup lang="ts">
import useMenuStore from '@/store/menu';
import useRouterStore from '@/store/router';
import useStyleStore from '@/store/style';
import { storeToRefs } from 'pinia';
const menuStore = useMenuStore();
const routerStore = useRouterStore();
const styleStore = useStyleStore();

const { currentTab } = storeToRefs(menuStore);
const { collapseTF } = storeToRefs(menuStore);

const routerList = computed(() => {
  const { routerList } = storeToRefs(routerStore);
  return routerList.value;
});

const clickMenu = (name: string) => {
  if (menuStore.addTabs(name)) {
    menuStore.setCurrentTab(name);
  }
};

</script>

<style lang="scss" scoped>
.el-menu {
  height: 100vh;
  border: none;
}

.el-menu-vertical {
  &:not(.el-menu--collapse) {
    width: 12.5rem;
  }

  .el-menu--collapse {
    width: 4rem;

    li {

      .el-tooltip,
      .el-submenu__title {
        padding: 0 1rem !important;
      }
    }
  }
}
</style>
