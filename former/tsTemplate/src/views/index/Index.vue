<template>
    <div class="layout">
        <el-card class="box-card">
            <el-row class="card">
                <el-col :xs="24" :lg="16" :md="16" :span="16">
                    <div class="car-left">
                        <el-row>
                            <div>
                                <el-col :xs="4" :md="4" :lg="4">
                                    <span class="card-img">
                                        <el-image
                                            :src="userInfo.avatar == '' || userInfo.avatar == null ? null : userInfo.avatar"
                                            style="width: 68px; height: 68px; border-radius: 50%" />
                                    </span>
                                </el-col>
                                <el-col :xs="20" :md="20" :lg="20">
                                    <div class="text">
                                        <h4>
                                            您好，{{ userInfo.nickName }}，请开始您一天的工作吧！
                                        </h4>
                                    </div>
                                </el-col>
                            </div>
                        </el-row>
                    </div>
                </el-col>
                <!-- <el-col :xs="24" :lg="8" :md="8" :span="8">
                    <div class="car-right">
                        <el-row>
                            <el-col :span="8">
                                <div class="car-item">
                                    <span class="flow"><i class="el-icon-s-grid" /></span>
                                    <span>在线人数 </span>
                                    <b>13260</b>
                                </div>
                            </el-col>
                            <el-col :span="8">
                                <div class="car-item">
                                    <span class="user-number">
                                        <i class="el-icon-s-custom" />
                                    </span>
                                    <span>总用户 </span>
                                    <b>48286</b>
                                </div>
                            </el-col>
                            <el-col :span="8">
                                <div class="car-item">
                                    <span class="feedback">
                                        <i class="el-icon-star-on" />
                                    </span>
                                    <span>通过率 </span>
                                    <b>98%</b>
                                </div>
                            </el-col>
                        </el-row>
                    </div>
                </el-col> -->
            </el-row>
        </el-card>
        <el-card style="margin: 20px 0">
            <div class="shadow">
                <el-row :gutter="20">
                    <el-col v-for="(menuItem, key) in indexMenuList" :key="key" :span="4" :xs="8"
                        @click="toTarget(menuItem.name)">
                        <el-card shadow="hover" class="grid-content">
                            <el-icon :color="menuItem.color">
                                <component :is="menuItem.icon"></component>
                            </el-icon>
                            <p>{{ menuItem.name }}</p>
                        </el-card>
                    </el-col>
                </el-row>
            </div>
        </el-card>
    </div>
</template>

<script setup lang="ts">
import useUserStore from '@/store/user';
import useRouterStore from '@/store/router';
import useMenuStore from '@/store/menu';
import { storeToRefs } from 'pinia';

const router = useRouter();
const userInfoStore = useUserStore();
const routerStore = useRouterStore();
const menuStore = useMenuStore();
const { userInfo } = storeToRefs(userInfoStore);

// const userInfo = computed(() => {
//     const { userInfo } = storeToRefs(userInfoStore);
//     return userInfo.value;
// });

const indexMenuList = computed(() => {
    const { indexMenuList } = storeToRefs(routerStore);
    return indexMenuList.value;
});

const toTarget = (name) => {
    menuStore.addTabs(name);
    menuStore.setCurrentTab(name);
    router.push({ name: name });
};

</script>

<style lang="scss" scoped>
@import "@/style/common.scss";

.layout {
    .card {
        overflow: hidden;

        .car-left {
            height: 68px;
        }

        .car-right {
            height: 68px;

            .flow,
            .user-number,
            .feedback {
                width: 24px;
                height: 24px;
                display: inline-block;
                border-radius: 50%;
                line-height: 24px;
                text-align: center;
                font-size: 13px;
                margin-right: 5px;
            }

            .flow {
                background-color: #fff7e8;
                border-color: #feefd0;
                color: #faad14;
            }

            .user-number {
                background-color: #ecf5ff;
                border-color: #d9ecff;
                color: #409eff;
            }

            .feedback {
                background-color: #eef9e8;
                border-color: #dcf3d1;
                color: #52c41a;
            }

            .car-item {
                text-align: right;

                b {
                    display: block;
                }
            }
        }

        .card-img {
            width: 68px;
            height: 68px;
            float: left;
            overflow: hidden;
        }

        .text {
            height: 68px;
            margin-left: 80px;

            h4 {
                font-size: 20px;
                color: #262626;
                font-weight: 500;
                white-space: nowrap;
                word-break: break-all;
                text-overflow: ellipsis;
                margin: 10px;
            }

            .tips-text {
                color: #8c8c8c;
                margin-top: 10px;
            }
        }
    }

    .shadow {
        margin: 4px 0;

        .grid-content {
            text-align: center;
            padding: 10px 0;
            cursor: pointer;

            .el-icon {
                width: 36px;
                height: 36px;
                font-size: 36px;
                margin-bottom: 8px;
            }
        }
    }
}
</style>
