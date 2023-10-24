<template>
    <div class="layout">

        <!-- 搜索框和按钮 -->
        <div class="headerGroup">
            <el-button class="leftButton" v-perms="['sys:role:add']" :icon="Plus" type="primary" @click="openAddDialog">
                新增
            </el-button>
            <el-input v-model="searchData" size="large" class="searchInput" placeholder="请输入所要查询的角色信息"
                @keyup.enter="searchTableData">
                <template #append>
                    <el-button :icon="Search" @click="searchTableData" />
                </template>
            </el-input>
            <el-button v-show="returnAll" class="rightButton" type="danger" @click="returnAllData">返回全部
            </el-button>
        </div>

        <!-- 表格 -->
        <el-table class="tableGroup" stripe :data="firstTableData" style="width: 98%;height: 79%;" :border="true"
            highlight-current-row>
            <el-table-column property="name" align="center" label="角色名称" />
            <el-table-column property="remark" align="center" label="角色备注" />
            <el-table-column align="center" label="操作" width="300" fixed="right">
                <template #default="scope">
                    <el-button v-perms="['sys:role:update']" :icon="Edit" size="default" type="primary"
                        @click="openUpdateDialog(scope.row)">
                        修改
                    </el-button>
                    <el-button v-perms="['sys:role:author']" :icon="InfoFilled" size="default" type="success"
                        @click="openAuthorDialog(scope.row.id)">
                        授权
                    </el-button>
                    <el-button v-perms="['sys:role:delete']" :icon="Delete" size="default" type="danger"
                        @click="openDeleteDialog(scope.row.id)" :disabled="getDeleteDisabledFlag(scope.row)">
                        <el-tooltip effect="dark" :content="scope.row.tips" placement="top-start"
                            :disabled="!(scope.row.userExistFlag == 1 ? true : false)">
                            删除
                        </el-tooltip>
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 分页器 -->
        <div class="paginationGroup">
            <el-pagination v-model:currentPage="currentPage" v-model:page-size="pageSize" :hide-on-single-page="false"
                :page-sizes="[5, 10, 20, 50, 100]" :background="background" layout="total, sizes, prev, pager, next, jumper"
                :total="total" @size-change="searchData == null || searchData == '' ? getTableData() : searchTableData()"
                @current-change="searchData == null || searchData == '' ? getTableData() : searchTableData()" />
        </div>

        <!-- 新增窗口 -->
        <el-dialog v-model="addDialogFlag" title="新增角色" width="40%" draggable center :before-close="closeAddDialog">
            <ul ref="addDialogTop" style="overflow: auto;height:118px;padding: 0;">
                <el-form ref="firstFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="NewRoleData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色名称" prop="name">
                                <el-input v-model="NewRoleData.name" size="large"
                                    :suffix-icon="roleNameSameFlag ? 'CloseBold' : 'Select'" @input="checkRoleName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色备注" prop="remark">
                                <el-input v-model="NewRoleData.remark" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" @click="sendAddRole(firstFormRef)">
                        确定
                    </el-button>
                    <el-button @click="closeAddDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 更新窗口 -->
        <el-dialog v-model="updateDialogFlag" title="更新角色信息" width="40%" draggable center :before-close="closeUpdateDialog">
            <ul ref="updateDialogTop" style="overflow: auto;height:118px;padding: 0;">
                <el-form ref="secondFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="UpdateRoleData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色名称" prop="name">
                                <el-input v-model="UpdateRoleData.name" size="large"
                                    :suffix-icon="roleNameSameFlag ? 'CloseBold' : 'Select'" @input="checkRoleName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色备注" prop="remark">
                                <el-input v-model="UpdateRoleData.remark" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" @click="sendUpdateUser(secondFormRef)">
                        确定
                    </el-button>
                    <el-button @click="closeUpdateDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 授权窗口 -->
        <el-dialog v-model="authorDialogFlag" title="分配权限" width="30%" draggable center :before-close="closeAuthorDialog">
            <ul ref="updateDialogTop" style="overflow: auto;height:398px;padding: 0;">
                <el-tree ref="treeRef" node-key="id" :data="allMenuList" show-checkbox :props="defaultProps"
                    :highlight-current="true" />
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" @click="sendUpdateAuthor">
                        确定
                    </el-button>
                    <el-button @click="closeAuthorDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script setup lang="ts">
import useLoadingStore from "@/store/loading";
import { Plus, Delete, Search, Edit, InfoFilled } from "@element-plus/icons-vue";
import { ElTable, ElMessage, ElMessageBox, ElTree, FormInstance, FormRules } from 'element-plus';
import {
    getRoleListApi, searchRoleApi, addRoleApi, updateRoleApi, deleteRoleApi,
    checkRoleNameApi, getRoleAuthorApi, updateAuthorApi
} from "@/api/role";
import { getAllMenuApi } from "@/api/menu";


const loadingStore = useLoadingStore()
const searchData = ref("")
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)
const background = ref(true)
const firstTableData = ref([])
const returnAll = ref(false)
const addDialogFlag = ref(false)
const updateDialogFlag = ref(false)
const authorDialogFlag = ref(false)
const firstFormRef = ref<FormInstance>()
const secondFormRef = ref<FormInstance>()
const addDialogTop = ref<any>()
const updateDialogTop = ref<any>()
const roleNameSameFlag = ref(true)
const chooseRoleNo = ref()
const tempRoleName = ref()
const allMenuList = ref()
const roleAuthorList = ref()
const treeRef = ref<InstanceType<typeof ElTree>>()
// const treeStrict = ref(true)
const defaultProps = {
    label: "name",
    children: "children"
}


// 新增
const NewRoleData = reactive({
    name: '',
    remark: '',
})

// 修改
const UpdateRoleData = reactive({
    id: '',
    name: '',
    remark: '',
})

// 授权
const roleAuthorParm = reactive({
    id: '',
    list: [],
})

//表单校验规则
const firstRules = reactive<FormRules>({
    name: [
        { required: true, message: '请输入角色名称', trigger: ['change'] }
    ],
})


// 获取所有目录，菜单，按钮
const getAllMenu = () => {
    loadingStore.setLoadingT();
    getAllMenuApi().then(res => {
        loadingStore.setLoadingF();
        allMenuList.value = res.data[0].children;
    })
}


onMounted(() => {
    initialize();
})

const initialize = () => {
    getTableData();
    getAllMenu();
}


// 获取数据
const getTableData = () => {
    loadingStore.setLoadingT();
    getRoleListApi(currentPage.value, pageSize.value).then(res => {
        total.value = res.data.total;//总记录
        firstTableData.value = res.data.records;
        loadingStore.setLoadingF();
    });
}


// 搜索数据
const searchTableData = () => {
    if (searchData.value == null || searchData.value == '') {
        ElMessage({
            message: '请输入关键词再进行搜索！',
            type: 'warning',
            duration: 4000
        })
    } else {
        loadingStore.setLoadingT();
        searchRoleApi(currentPage.value, pageSize.value, searchData.value).then(res => {
            total.value = res.data.total;//总记录
            firstTableData.value = res.data.records;
            returnAll.value = true;
            loadingStore.setLoadingF();
        })
    }
}


// 搜索后，回到全部数据
const returnAllData = () => {
    initialize();
    searchData.value = ""
    returnAll.value = false
}


// 打开新增窗口
const openAddDialog = () => {
    addDialogFlag.value = true
}


// 发送新增请求
const sendAddRole = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            if (roleNameSameFlag.value == false) {
                loadingStore.setLoadingT();
                console.log(NewRoleData);
                addRoleApi(NewRoleData).then(res => {
                    loadingStore.setLoadingF();
                    if (res.data == 1) {
                        ElMessage({
                            message: '新增角色成功！',
                            type: 'success',
                        })
                        initialize();
                        closeAddDialog();
                    }
                    else {
                        ElMessage({
                            message: '新增角色失败！',
                            type: 'error',
                            duration: 4000
                        })
                    }
                })
            } else {
                ElMessage({
                    message: '该角色名称已重复，请修改！',
                    type: 'error',
                    duration: 4000
                })
            }
        } else {
            ElMessage({
                message: '表单验证未通过，请检查！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


// 验证角色名是否重复
const checkRoleName = (e: any) => {
    checkRoleNameApi(e).then(res => {
        roleNameSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该角色名称已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: '角色名验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 关闭新增窗口
const closeAddDialog = () => {
    roleNameSameFlag.value = true;
    addDialogFlag.value = false;
    AddReturnTop();
    firstFormRef.value?.resetFields();
}


// 打开更新窗口
const openUpdateDialog = async (row: any) => {
    updateDialogFlag.value = true;
    nextTick(() => {
        UpdateRoleData.id = row.id;
        UpdateRoleData.name = row.name;
        tempRoleName.value = row.name;
        UpdateRoleData.remark = row.remark;
    })
}


// 发送更新请求
const sendUpdateUser = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            if (roleNameSameFlag.value == false || tempRoleName.value == UpdateRoleData.name) {
                loadingStore.setLoadingT();
                console.log(UpdateRoleData);
                updateRoleApi(UpdateRoleData).then(res => {
                    loadingStore.setLoadingF();
                    if (res.data == 1) {
                        ElMessage({
                            message: '修改角色信息成功！',
                            type: 'success',
                        })
                        initialize();
                        closeUpdateDialog();
                    }
                    else {
                        ElMessage({
                            message: '修改角色信息失败！',
                            type: 'error',
                            duration: 4000
                        })
                    }
                })
            } else {
                ElMessage({
                    message: '该角色名称已重复，请修改!',
                    type: 'error',
                    duration: 4000
                })
            }
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
    roleNameSameFlag.value = true;
    updateDialogFlag.value = false;
    UpdateReturnTop();
    secondFormRef.value?.resetFields();
}


// 打开授权窗口
const openAuthorDialog = (roleId: any) => {
    authorDialogFlag.value = true
    treeRef.value?.setCheckedKeys([]);
    roleAuthorParm.id = roleId;
    getRoleAuthorApi(roleId).then(res => {
        console.log(res.data);
        // 处理le-tree回显bug的写法
        // bug在于 存在父节点id，虽其子节点未全选，但却显示全选
        roleAuthorList.value = res.data;
        nextTick(() => {
            roleAuthorList.value.forEach((index) => {
                const node = treeRef.value.getNode(index);
                if (node.isLeaf) {
                    treeRef.value.setChecked(node, true, false);
                }
            })
        })
    })
}


// 发送授权请求
const sendUpdateAuthor = () => {
    loadingStore.setLoadingT();
    //获取选择的菜单数据id
    let checkIds = treeRef.value?.getCheckedKeys() as string[];
    let hlfIds = treeRef.value?.getHalfCheckedKeys() as string[];
    //menu数组
    let list = checkIds?.concat(hlfIds);
    if (list.length == 0) {
        ElMessage.warning("请勾选权限信息!");
        return;
    }
    roleAuthorParm.list = list;
    updateAuthorApi(roleAuthorParm).then(res => {
        loadingStore.setLoadingF();
        if (res.data >= 1) {
            ElMessage({
                message: '修改角色权限成功！',
                type: 'success',
            })
            initialize();
            closeAuthorDialog();
        }
        else {
            ElMessage({
                message: '修改角色权限失败！',
                type: 'error',
                duration: 4000
            })
        }
    })
}


// 关闭授权窗口
const closeAuthorDialog = () => {
    authorDialogFlag.value = false;
}


// 删除提示
const getDeleteDisabledFlag = (row: any) => {
    if (row.userExistFlag == 1) {
        row.tips = "目前有用户为该角色，不允许删除！"
        return true;
    } else {
        return false;
    }
}


// 打开删除窗口
const openDeleteDialog = (id: any) => {
    ElMessageBox.confirm(
        '您确定要删除该角色吗?',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            title: '系统提示',
            draggable: true,
        }
    ).then(() => {
        chooseRoleNo.value = id;
        sendDeleteRole()
    });
}


// 发送删除请求
const sendDeleteRole = () => {
    loadingStore.setLoadingT();
    deleteRoleApi(chooseRoleNo.value).then(res => {
        loadingStore.setLoadingF();
        if (res.data == 1) {
            ElMessage({
                message: '删除角色成功！',
                type: 'success',
            })
            initialize();
        }
        else {
            ElMessage({
                message: '删除角色失败！',
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

<style lang="scss" scoped></style>