<template>
    <div class="layout">

        <!-- 搜索框和按钮 -->
        <div class="headerGroup">
            <el-button class="leftButton" v-perms="['sys:log:delete']" icon="Delete" type="danger"
                @click="openSevenDeleteDialog">
                删除7天前的日志
            </el-button>
        </div>

        <!-- 表格 -->
        <el-table class="tableGroup" :data="firstTableData" style="width: 98%;height: 80%;" :border="true" stripe
            highlight-current-row>
            <el-table-column property="userName" align="center" label="操作人" width="100" />
            <el-table-column property="method" align="center" label="请求方法" width="450" />
            <el-table-column property="params" align="center" label="请求参数" show-overflow-tooltip />
            <el-table-column property="time" align="center" label="执行时间（毫秒）" width="130" />
            <el-table-column property="ip" align="center" label="IP地址" width="130" />
            <el-table-column property="createTime" :formatter="conversionDateTime" sortable align="center" label="操作时间"
                width="160" />
            <el-table-column align="center" label="操作" width="100" fixed="right">
                <template #default="scope">
                    <el-button v-perms="['sys:log:delete']" icon="Delete" size="default" type="danger"
                        @click="openDeleteDialog(scope.row.id)">
                        删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 分页器 -->
        <div class="paginationGroup">
            <el-pagination v-model:currentPage="currentPage" v-model:page-size="pageSize" :hide-on-single-page="false"
                :page-sizes="[20, 30, 50, 100]" :background="background" layout="total, sizes, prev, pager, next, jumper"
                :total="total" @size-change="getTableData" @current-change="getTableData" />
        </div>
    </div>
</template>

<script setup lang="ts">
import useLoadingStore from "@/store/loading";
import { ElTable, ElMessage, ElMessageBox } from 'element-plus';
import { getLogListApi, deleteLogApi, sevenDayDeleteApi } from "@/api/log";
import { conversionDateTime } from "@/utils/timeFormat"


const loadingStore = useLoadingStore()
const firstTableData = ref([])
const chooseLogNo = ref()
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(20)
const background = ref(true)

onMounted(() => {
    getTableData();
})


// 获取数据
const getTableData = () => {
    loadingStore.setLoadingT();
    getLogListApi(currentPage.value, pageSize.value).then(res => {
        total.value = res.data.total;//总记录
        firstTableData.value = res.data.records;
        loadingStore.setLoadingF();
    });
}


// 打开删除窗口
const openDeleteDialog = (id: any) => {
    ElMessageBox.confirm(
        '您确定要删除该日志吗?',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            title: '系统提示',
            draggable: true,
        }
    ).then(() => {
        chooseLogNo.value = id;
        sendDeleteLog()
    });
}


// 发送删除请求
const sendDeleteLog = () => {
    loadingStore.setLoadingT();
    deleteLogApi(chooseLogNo.value).then(res => {
        loadingStore.setLoadingF();
        if (res.data == 1) {
            ElMessage({
                message: '删除日志成功！',
                type: 'success',
            })
            getTableData();
        }
        else {
            ElMessage({
                message: '删除日志失败！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


const openSevenDeleteDialog = (id: any) => {
    ElMessageBox.confirm(
        '您确定要删除7天前的日志吗?',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            title: '系统提示',
            draggable: true,
        }
    ).then(() => {
        sendSevenDeleteLog()
    });
}


const sendSevenDeleteLog = () => {
    loadingStore.setLoadingT();
    sevenDayDeleteApi().then(res => {
        loadingStore.setLoadingF();
        if (res.data = 0) {
            ElMessage({
                message: '删除日志失败！',
                type: 'error',
                duration: 4000
            })
        }
        else {
            ElMessage({
                message: res.msg,
                type: 'success',
            })
        }
    })
}

</script>

<style lang="scss" scoped>
.headerGroup {
    justify-content: left;
    display: flex;
    width: 100%;
    padding: 1.5% 0;
}

.leftButton {
    align-self: left;
    float: left;
    margin-left: 1%;
}

.tableGroup {
    margin: auto;
}
</style>
