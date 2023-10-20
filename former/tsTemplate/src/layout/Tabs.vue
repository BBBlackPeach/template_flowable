<template>
  <div class="router-history" :style="`background-color: ${styleStore.headerBackgroundColor}`">
    <el-tabs v-model="currentTab" type="card" closable @tab-remove="removeTab" @tab-click="clickTab">
      <el-tab-pane v-for="(item, index) in tabs" :key="index" :label="item.name" :name="item.name">
        <template #label>
          <span :style="{
            color: currentTab == item.name ? styleStore.tabActiveTextColor : styleStore.headerTextColor,
          }"><i class="point" :style="{
  backgroundColor:
    currentTab == item.name ? styleStore.tabActiveTextColor : '#ddd',
}" />
            {{ item.name }}</span>
        </template>
        <!-- <template #label>
          <span :style="{
            color: currentTab == item.name ? '#1890ff' : '#333',
          }"><i class="point" :style="{
  backgroundColor:
    currentTab == item.name ? '#1890ff' : '#ddd',
}" />
            {{ item.name }}</span>
        </template> -->
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup lang="ts">
import useMenuStore from '@/store/menu';
import useStyleStore from '@/store/style';
import { storeToRefs } from 'pinia';
const router = useRouter();
const menuStore = useMenuStore();
const styleStore = useStyleStore();

// 在状态管理中对象因此取值不同于下面
const tabs = menuStore.tabs;
const { currentTab } = storeToRefs(menuStore);

const removeTab = (targetName) => {
  if (currentTab.value == targetName) {
    if (tabs.length == 1) {
      return;
    } else {
      tabs.forEach((tab, index) => {
        if (tab.name == targetName) {
          let nextTab = tabs[index + 1] || tabs[index - 1];
          if (nextTab) {
            menuStore.removeTabs(targetName);
            menuStore.setCurrentTab(nextTab.name);
            router.push({ name: currentTab.value });
          }
        }
      });
    }
  } else {
    menuStore.removeTabs(targetName);
  }
};

const clickTab = (target) => {
  menuStore.setCurrentTab(target.props.name);
  router.push({ name: target.props.name });
};

// 此处仍有问题，若是回退，无法转化，暂无解决办法，只好限制回退
onMounted(() => {
  if (menuStore.tabs.length == 0 && menuStore.currentTab == undefined) {
    menuStore.addTabs("首页");
    menuStore.setCurrentTab("首页");
  }
});

</script>

<style lang="scss">
.router-history {
  // box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
  // background: #ffffff;
  padding: 0;
  border-top: 1px solid #f4f4f4;
  height: 40px;
  font-size: $DefaultFontSize;

  .el-tabs__header .el-tabs__item {
    border: none;
  }

  .el-tabs__header .el-tabs__nav {
    border: none;
  }

  .el-tabs__header .el-tabs__item.is-active {
    background-color: rgba(64, 158, 255, 0.08);
  }

  .el-tabs__item .point {
    content: "";
    width: 9px;
    height: 9px;
    margin-right: 8px;
    display: inline-block;
    border-radius: 50%;
    transition: background-color 0.2s;
  }
}
</style>
