<template>
    <div class="layout">

        <!-- 搜索框和按钮 -->
        <div class="headerGroup">
            <el-button class="leftButton" v-perms="['sys:menu:add']" :icon="Plus" type="primary" @click="openAddDialog">
                新增
            </el-button>
        </div>

        <!-- 表格 -->
        <el-table class="tableGroup" row-key="id" :data="firstTableData" style="width: 98%;height: 86%;" :border="true"
            :tree-props="{ children: 'children', hasChildren: 'hasChildren' }" stripe highlight-current-row>
            <el-table-column property="name" align="center" label="菜单名称" />
            <el-table-column align="center" label="类型" width="80">
                <template #default="scope">
                    <el-tag v-if="scope.row.type == '0'" size="default">目录</el-tag>
                    <el-tag v-if="scope.row.type == '1'" type="warning" size="default">菜单</el-tag>
                    <el-tag v-if="scope.row.type == '2'" type="danger" size="default">按钮</el-tag>
                </template>
            </el-table-column>
            <el-table-column property="parentName" align="center" label="父菜单名称" width="110" />
            <el-table-column property="orderNum" align="center" label="排序位置" width="100" />
            <el-table-column align="center" label="图标" width="80">
                <template #default="scope">
                    <el-icon v-if="scope.row.icon != null">
                        <!-- 通过动态自建的方式显示图标 -->
                        <component :is="scope.row.icon"></component>
                    </el-icon>
                </template>
            </el-table-column>
            <el-table-column prop="color" align="center" label="首页图标颜色" width="120">
                <template #default="scope">
                    <div class="centerCommon" v-if="scope.row.color != null">
                        <div :style="`width: 30px; height: 30px;background-color:${scope.row.color}`">
                        </div>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="url" align="center" label="路由地址"></el-table-column>
            <el-table-column prop="filePath" align="center" label="文件路径"></el-table-column>
            <el-table-column prop="perms" align="center" label="权限字段"></el-table-column>
            <el-table-column align="center" label="操作" width="200" fixed="right">
                <template #default="scope">
                    <el-button v-perms="['sys:menu:update']" :icon="Edit" size="default" type="primary"
                        @click="openUpdateDialog(scope.row)">
                        修改
                    </el-button>
                    <el-button v-perms="['sys:menu:delete']" :icon="Delete" size="default" type="danger"
                        :disabled="scope.row.children.length != 0" @click="openDeleteDialog(scope.row.id)">
                        删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 新增窗口 -->
        <el-dialog v-model="addDialogFlag" title="新增菜单" width="40%" draggable center :before-close="closeAddDialog">
            <ul ref="addDialogTop" style="overflow: auto;height:398px;padding: 0;">
                <!-- 282 -->
                <el-form ref="firstFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="NewMenuData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="14">
                            <el-form-item prop="type">
                                <el-radio-group v-model="NewMenuData.type">
                                    <el-radio-button label="0">目录</el-radio-button>
                                    <el-radio-button label="1">菜单</el-radio-button>
                                    <el-radio-button label="2">按钮</el-radio-button>
                                </el-radio-group>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="名称" prop="name">
                                <el-input v-model="NewMenuData.name" size="large"
                                    :suffix-icon="menuNameSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type != '0'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="父菜单名" prop="parentId">
                                <el-select v-model="NewMenuData.parentId" placeholder="下拉选择" size="large">
                                    <el-option v-show="NewMenuData.type == '1'" v-for="item in catalogueData"
                                        :key="item.value" :label="item.label" :value="item.value" />
                                    <el-option v-show="NewMenuData.type == '2'" v-for="item in menuData" :key="item.value"
                                        :label="item.label" :value="item.value" />
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="排序位置" prop="orderNum">
                                <el-input type="number" v-model="NewMenuData.orderNum" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="URL地址" prop="url">
                                <el-input v-model="NewMenuData.url" size="large"
                                    :suffix-icon="menuUrlSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuUrl" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type == '1'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="文件路径" prop="filePath">
                                <el-input v-model="NewMenuData.filePath" size="large"
                                    :suffix-icon="filePathSameFlag ? 'CloseBold' : 'Select'" @input="checkFilePath" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="图标" prop="icon">
                                <ELIconPicker :icon-value="NewMenuData.icon" @updateIcon="addDialogUpdateIcon">
                                </ELIconPicker>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type == '1'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="图标颜色" prop="color">
                                <el-color-picker v-model="NewMenuData.color" size="large" />
                                <!-- <el-input v-model="NewMenuData.color" size="large" /> -->
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="NewMenuData.type == '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="权限字段" prop="perms">
                                <el-input v-model="NewMenuData.perms" size="large"
                                    :suffix-icon="menuPermsSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuPerms" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" :disabled="getAddSubmit()" @click="sendAddMenu(firstFormRef)">
                        <el-tooltip effect="dark" :content="addSubmitTips" placement="top-start"
                            :disabled="tooltipDisabled">
                            确定
                        </el-tooltip>
                    </el-button>
                    <el-button @click="closeAddDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 更新窗口 -->
        <el-dialog v-model="updateDialogFlag" title="修改菜单" width="40%" draggable center :before-close="closeUpdateDialog">
            <ul ref="updateDialogTop" style="overflow: auto;height:398px;padding: 0;">
                <!-- 282 -->
                <el-form ref="secondFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="UpdateMenuData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="14">
                            <el-form-item prop="type">
                                <el-radio-group v-model="UpdateMenuData.type">
                                    <el-radio-button v-show="UpdateMenuData.type == '0'" label="0">目录</el-radio-button>
                                    <el-radio-button v-show="UpdateMenuData.type == '1'" label="1">菜单</el-radio-button>
                                    <el-radio-button v-show="UpdateMenuData.type == '2'" label="2">按钮</el-radio-button>
                                </el-radio-group>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="名称" prop="name">
                                <el-input v-model="UpdateMenuData.name" size="large"
                                    :suffix-icon="menuNameSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type != '0'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="父菜单名" prop="parentId">
                                <el-select v-model="UpdateMenuData.parentId" placeholder="下拉选择" size="large">
                                    <el-option v-show="UpdateMenuData.type == '1'" v-for="item in catalogueData"
                                        :key="item.value" :label="item.label" :value="item.value" />
                                    <el-option v-show="UpdateMenuData.type == '2'" v-for="item in menuData"
                                        :key="item.value" :label="item.label" :value="item.value" />
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="排序位置" prop="orderNum">
                                <el-input type="number" v-model="UpdateMenuData.orderNum" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="URL地址" prop="url">
                                <el-input v-model="UpdateMenuData.url" size="large"
                                    :suffix-icon="menuUrlSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuUrl" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type == '1'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="文件路径" prop="filePath">
                                <el-input v-model="UpdateMenuData.filePath" size="large"
                                    :suffix-icon="filePathSameFlag ? 'CloseBold' : 'Select'" @input="checkFilePath" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type != '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="图标" prop="icon">
                                <ELIconPicker :icon-value="UpdateMenuData.icon" @updateIcon="updateDialogUpdateIcon">
                                </ELIconPicker>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type == '1'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="图标颜色" prop="color">
                                <el-color-picker v-model="UpdateMenuData.color" size="large" />
                                <!-- <el-input v-model="NewMenuData.color" size="large" /> -->
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row v-show="UpdateMenuData.type == '2'" justify="center">
                        <el-col :span="16">
                            <el-form-item label="权限字段" prop="perms">
                                <el-input v-model="UpdateMenuData.perms" size="large"
                                    :suffix-icon="menuPermsSameFlag ? 'CloseBold' : 'Select'" @input="checkMenuPerms" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" :disabled="getUpdateSubmit()" @click="sendUpdateMenu(secondFormRef)">
                        <el-tooltip effect="dark" :content="addSubmitTips" placement="top-start"
                            :disabled="tooltipDisabled">
                            确定
                        </el-tooltip>
                    </el-button>
                    <el-button @click="closeUpdateDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 授权窗口 -->
        <!-- <el-dialog v-model="detailDialogFlag" title="分配权限" width="40%" draggable center
            :before-close="closeDetailDialog">
        </el-dialog> -->
    </div>
</template>

<script setup lang="ts">
import useLoadingStore from "@/store/loading";
import { Plus, Delete, Edit } from "@element-plus/icons-vue";
import { ElTable, ElMessage, ElMessageBox, FormInstance, FormRules } from 'element-plus';
import {
    getMenuListApi, checkMenuNameApi, checkMenuUrlApi, checkFilePathApi, checkMenuPermsApi,
    getCatalogueDataApi, getMenuDataApi, addMenuApi, updateMenuApi, deleteMenuApi
} from "@/api/menu";


const loadingStore = useLoadingStore()
const firstTableData = ref([])
const addDialogFlag = ref(false)
const updateDialogFlag = ref(false)
const firstFormRef = ref<FormInstance>()
const secondFormRef = ref<FormInstance>()
const addDialogTop = ref<any>()
const updateDialogTop = ref<any>()
const menuNameSameFlag = ref(false)
const menuUrlSameFlag = ref(false)
const filePathSameFlag = ref(false)
const menuPermsSameFlag = ref(false)
const chooseMenuNo = ref()
const addSubmitTips = ref()
const tooltipDisabled = ref()
const tempMenuName = ref()
const tempMenuUrl = ref()
const tempFilePath = ref()
const tempMenuPerms = ref()

//定义目录列表数据
const catalogueData = ref()

//定义菜单列表数据
const menuData = ref()

// 新增
const NewMenuData = reactive({
    type: '0',
    name: '',
    parentId: '',
    orderNum: '',
    url: '',
    filePath: '',
    icon: '',
    color: '',
    perms: '',
})

// 修改
const UpdateMenuData = reactive({
    id: '',
    type: '',
    name: '',
    parentId: '',
    orderNum: '',
    url: '',
    filePath: '',
    icon: '',
    color: '',
    perms: '',
})


//表单校验规则
const firstRules = reactive<FormRules>({
    name: [
        { required: true, message: '请输入名称', trigger: ['change'] }
    ],
})


const getCatalogueData = () => {
    loadingStore.setLoadingT();
    getCatalogueDataApi().then(res => {
        catalogueData.value = res.data;
        loadingStore.setLoadingF();
    })
}


const getMenuData = () => {
    loadingStore.setLoadingT();
    getMenuDataApi().then(res => {
        menuData.value = res.data;
        loadingStore.setLoadingF();
    })
}


onMounted(() => {
    initialize();
});


const initialize = () => {
    getTableData();
    getCatalogueData();
    getMenuData();
}


// 获取数据
const getTableData = () => {
    loadingStore.setLoadingT();
    getMenuListApi().then(res => {
        firstTableData.value = res.data;
        loadingStore.setLoadingF();
    });
}


// 打开新增窗口
const openAddDialog = () => {
    addDialogFlag.value = true
}

// 新增窗口选择图标
const addDialogUpdateIcon = (v: any) => {
    console.log(v);
    NewMenuData.icon = v;
}

// 新增窗口：提交状态验证
const getAddSubmit = () => {
    if (NewMenuData.type == '0') {
        if (menuNameSameFlag.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuUrlSameFlag.value) {
            addSubmitTips.value = "URL地址已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    } else if (NewMenuData.type == '1') {
        if (menuNameSameFlag.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuUrlSameFlag.value) {
            addSubmitTips.value = "URL地址已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (filePathSameFlag.value) {
            addSubmitTips.value = "文件路径已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    } else if (NewMenuData.type == '2') {
        if (menuNameSameFlag.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuPermsSameFlag.value) {
            addSubmitTips.value = "权限字段已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    }
}


// 发送新增请求
const sendAddMenu = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            loadingStore.setLoadingT();
            console.log(NewMenuData);
            addMenuApi(NewMenuData).then(res => {
                loadingStore.setLoadingF();
                if (res.data == 1) {
                    ElMessage({
                        message: '新增菜单成功！',
                        type: 'success',
                    })
                    initialize();
                    closeAddDialog();
                }
                else {
                    ElMessage({
                        message: '新增菜单失败！',
                        type: 'error',
                        duration: 4000
                    })
                }
            })
        } else {
            ElMessage({
                message: '表单验证未通过，请检查！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


// 验证菜单名称是否重复
const checkMenuName = (e: any) => {
    checkMenuNameApi(e).then(res => {
        menuNameSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该名称已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: '名称验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 验证菜单URL是否重复
const checkMenuUrl = (e: any) => {
    checkMenuUrlApi(e).then(res => {
        menuUrlSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该URL地址已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: 'URL地址验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 验证菜单文件路径是否重复
const checkFilePath = (e: any) => {
    checkFilePathApi(e).then(res => {
        filePathSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该文件路径已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: '文件路径验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 验证按钮权限是否重复
const checkMenuPerms = (e: any) => {
    checkMenuPermsApi(e).then(res => {
        menuPermsSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该权限字段已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: '权限字段验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 关闭新增窗口
const closeAddDialog = () => {
    menuNameSameFlag.value = false;
    menuUrlSameFlag.value = false;
    filePathSameFlag.value = false;
    menuPermsSameFlag.value = false;
    addDialogFlag.value = false;
    AddReturnTop();
    firstFormRef.value?.resetFields();
}


// 打开更新窗口
const openUpdateDialog = async (row: any) => {
    updateDialogFlag.value = true;
    nextTick(() => {
        UpdateMenuData.id = row.id;
        UpdateMenuData.type = row.type;
        UpdateMenuData.name = row.name;
        tempMenuName.value = row.name;
        // 不加toString会导致类型不一致，使得即使相等，也显示不等，即显示数字
        UpdateMenuData.parentId = row.parentId.toString();
        UpdateMenuData.orderNum = row.orderNum;
        UpdateMenuData.url = row.url;
        tempMenuUrl.value = row.url;
        UpdateMenuData.filePath = row.filePath;
        tempFilePath.value = row.filePath;
        UpdateMenuData.icon = row.icon;
        UpdateMenuData.color = row.color;
        UpdateMenuData.perms = row.perms;
        tempMenuPerms.value = row.perms;
    })
}

// 更新窗口选择图标
const updateDialogUpdateIcon = (v: any) => {
    console.log(v);
    UpdateMenuData.icon = v;
}

// 更新窗口：提交状态验证
const getUpdateSubmit = () => {
    if (UpdateMenuData.type == '0') {
        if (menuNameSameFlag.value && UpdateMenuData.name != tempMenuName.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuUrlSameFlag.value && UpdateMenuData.url != tempMenuUrl.value) {
            addSubmitTips.value = "URL地址已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    } else if (UpdateMenuData.type == '1') {
        if (menuNameSameFlag.value && UpdateMenuData.name != tempMenuName.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuUrlSameFlag.value && UpdateMenuData.url != tempMenuUrl.value) {
            addSubmitTips.value = "URL地址已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (filePathSameFlag.value && UpdateMenuData.filePath != tempFilePath.value) {
            addSubmitTips.value = "文件路径已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    } else if (UpdateMenuData.type == '2') {
        if (menuNameSameFlag.value && UpdateMenuData.name != tempMenuName.value) {
            addSubmitTips.value = "名称已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else if (menuPermsSameFlag.value && UpdateMenuData.perms != tempMenuPerms.value) {
            addSubmitTips.value = "权限字段已重复，无法提交";
            tooltipDisabled.value = false;
            return true;
        } else {
            tooltipDisabled.value = true;
            return false;
        }
    }
}


// 发送更新请求
const sendUpdateMenu = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            loadingStore.setLoadingT();
            console.log(UpdateMenuData);
            updateMenuApi(UpdateMenuData).then(res => {
                loadingStore.setLoadingF();
                if (res.data == 1) {
                    ElMessage({
                        message: '修改菜单信息成功！',
                        type: 'success',
                    })
                    initialize();
                    closeUpdateDialog();
                }
                else {
                    ElMessage({
                        message: '修改菜单信息失败！',
                        type: 'error',
                        duration: 4000
                    })
                }
            })
        } else {
            ElMessage({
                message: '表单验证未通过，请检查！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


// 关闭更新窗口
const closeUpdateDialog = () => {
    updateDialogFlag.value = false;
    UpdateReturnTop();
    secondFormRef.value?.resetFields();
}


// 打开删除窗口
const openDeleteDialog = (id: any) => {
    ElMessageBox.confirm(
        '您确定要删除该菜单吗?',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            title: '系统提示',
            draggable: true,
        }
    ).then(() => {
        chooseMenuNo.value = id;
        sendDeleteMenu()
    });
}


// 发送删除请求
const sendDeleteMenu = () => {
    loadingStore.setLoadingT();
    deleteMenuApi(chooseMenuNo.value).then(res => {
        loadingStore.setLoadingF();
        if (res.data == 1) {
            ElMessage({
                message: '删除菜单成功！',
                type: 'success',
            })
            initialize();
        }
        else {
            ElMessage({
                message: '删除菜单失败！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


// 新增窗口滑动回最顶端
const AddReturnTop = () => {
    addDialogTop.value.scrollTop = 0;
}


// 更新窗口滑动回最顶端
const UpdateReturnTop = () => {
    updateDialogTop.value.scrollTop = 0;
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
