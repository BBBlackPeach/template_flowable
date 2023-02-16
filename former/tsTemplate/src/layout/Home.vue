<template>
    <el-container v-loading="loadingTF" element-loading-text="加载中..." :element-loading-spinner="svg"
        element-loading-svg-view-box="-10, -10, 50, 50">
        <!-- element-loading-svg-view-box="-10, -10, 50, 50" element-loading-background="rgba(122, 122, 122, 0.8)"> -->
        <el-aside style="width: auto !important">
            <Aside></Aside>
        </el-aside>
        <el-container>
            <el-header>
                <Header></Header>
            </el-header>
            <Tabs></Tabs>
            <el-main>
                <router-view v-slot="{ Component }">
                    <transition :duration="{ enter: 500, leave: 80 }" mode="out-in" name="el-fade-in-linear">
                        <keep-alive>
                            <component :is="Component" />
                        </keep-alive>
                    </transition>
                </router-view>
                <Footer></Footer>
            </el-main>
        </el-container>
    </el-container>
</template>

<script setup lang="ts">
import Aside from '@/layout/Aside.vue';
import Header from '@/layout/Header.vue';
import Tabs from '@/layout/Tabs.vue';
import Footer from '@/layout/Footer.vue';
import useLoadingStore from '@/store/loading';
import { storeToRefs } from 'pinia';
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
.el-header {
    background-color: #ffffff;
    // background-color: #80f1e4;
    color: #333;
    padding: 0 10px;
    line-height: 60px;
}

.el-aside {
    background-color: #191a23;
    color: #333;
    line-height: 200px;
}

.el-main {
    background-color: #e9eef3;
    // background-color: #ffffff;
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
