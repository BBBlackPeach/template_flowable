
<template>
    <el-popover trigger="focus" :width="256">
        <template #reference>
            <el-button :icon="iconValue">{{ iconValue }}</el-button>
        </template>
        <div class="el-icon-picker">
            <component v-for="icon in Object.keys(ElementPlusIconsVue)" :key="icon"
                :class="[icon, 'icon', { 'icon-active': icon == iconValue }]" :is="icon" @click="updateIcon(icon)">
            </component>
        </div>
    </el-popover>
</template>

<script setup lang="ts">
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
const props = defineProps({
    iconValue: {
        type: String,
        default: () => {
            return ""
        },
    }
})
const emits = defineEmits(["updateIcon"]);

const updateIcon = (icon: any) => {
    emits('updateIcon', icon)
}

</script>

<style scoped lang="scss">
.el-icon-picker {
    height: 256px;
    overflow-y: scroll;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.icon {
    display: inline-block;
    width: 26px;
    height: 26px;
    color: var(--el-text-color-regular);
    font-size: 20px;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    line-height: 60px;
    margin: 5px;
}

.icon:hover {
    color: var(--el-color-primary);
}

.icon-active {
    color: var(--el-color-primary);
}
</style>