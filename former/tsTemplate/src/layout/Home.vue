<template>
    <!-- 全屏背景图 -->
    <div class="backgroundSetting"
        :style="{ backgroundImage: 'url(' + (styleStore.backgroundImageFlag ? styleStore.globalBackgroundImageUrl : '') + ')' }">
        <el-container :class="(styleStore.backgroundImageFlag ? 'opacitySetting' : '')" v-loading="loadingTF"
            element-loading-text="加载中..." :element-loading-spinner="svg" element-loading-svg-view-box="-10, -10, 50, 50">
            <el-aside style="width: auto !important">
                <Aside></Aside>
            </el-aside>
            <el-container>
                <el-header :style="`background-color: ${styleStore.headerBackgroundColor}`">
                    <Header></Header>
                </el-header>
                <Tabs></Tabs>
                <el-main id="myFullScreenContainer" :style="`background-color: ${styleStore.mainBackgroundColor}`">
                    <router-view v-slot="{ Component }">
                        <transition :duration="{ enter: 500, leave: 80 }" mode="out-in" name="el-fade-in-linear">
                            <!-- 保持存活，缺点为有缓存，因此有时不为最新数据 -->
                            <!-- <keep-alive> -->
                            <component :is="Component" />
                            <!-- </keep-alive> -->
                        </transition>
                    </router-view>
                    <Footer></Footer>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script setup lang="ts">
import Aside from '@/layout/Aside.vue';
import Header from '@/layout/Header.vue';
import Tabs from '@/layout/Tabs.vue';
import Footer from '@/layout/Footer.vue';
import useStyleStore from '@/store/style';
import useLoadingStore from '@/store/loading';
import { storeToRefs } from 'pinia';
const styleStore = useStyleStore();
const loadingStore = useLoadingStore();
const { loadingTF } = storeToRefs(loadingStore);

const svg = `
        <path class="path" d="
          M 30 15
          L 28 17
          M 25.61 25.61
          A 15 15, 0, 0, 1, 15 30
          A 15 15, 0, 1, 1, 27.99 7.5
          L 15 15
        " style="stroke-width: 4px; fill: rgba(0, 0, 0, 0)"/>
      `

</script>

<style lang="scss" scoped>
.backgroundSetting {
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

.opacitySetting {
    // filter: alpha(Opacity=80);
    // -moz-opacity: 0.80;
    // opacity: 0.80;
    filter: alpha(Opacity=85);
    -moz-opacity: 0.85;
    opacity: 0.85;
}

.el-header {
    // background-color: #ffffff;
    color: #333;
    padding: 0 10px;
    line-height: 60px;
}

.el-aside {
    color: #333;
    line-height: 200px;
}

.el-main {
    // background-color: #e9eef3;
    color: #333;
    padding: 0;
}

.el-container {
    height: 100vh;
}

.el-footer {
    color: #333;
    text-align: center;
    line-height: 30px;
    height: 30px;
}
</style>
