<template>
    <div class="layout">

        <!-- 搜索框和按钮 -->
        <div class="headerGroup">
            <el-button v-perms="['sys:user:add']" class="leftButton" :icon="Plus" type="primary" @click="openAddDialog">
                新增
            </el-button>
            <el-input v-model="searchData" size="large" class="searchInput" placeholder="请输入所要查询的用户信息"
                @keyup.enter="searchTableData">
                <template #append>
                    <el-button :icon="Search" @click="searchTableData" />
                </template>
            </el-input>
            <el-button v-perms="['sys:user:export']" class="rightButton" :icon="Download" type="success"
                @click="exportExcel">导出
            </el-button>
            <el-button v-show="returnAll" class="rightButton" type="danger" @click="returnAllData">返回全部
            </el-button>
        </div>

        <!-- 表格 -->
        <el-table class="tableGroup" stripe :data="firstTableData" style="width: 98%;height: 79%;"
            highlight-current-row>
            <el-table-column property="nickName" align="center" label="姓名" width="100" v-if="columnShowOptions[0].isShow==true"/>
            <el-table-column property="name" align="center" label="用户名" width="100" v-if="columnShowOptions[1].isShow==true"/>
            <el-table-column property="sex" align="center" label="性别" width="80" v-if="columnShowOptions[2].isShow==true"/>
            <el-table-column property="age" align="center" label="年龄" width="80" v-if="columnShowOptions[3].isShow==true"/>
            <el-table-column property="mobile" align="center" label="手机号" width="150" v-if="columnShowOptions[4].isShow==true"/>
            <el-table-column property="identity" align="center" label="身份证号" width="210" v-if="columnShowOptions[5].isShow==true"/>
            <el-table-column property="homeAddress" align="center" label="家庭住址" v-if="columnShowOptions[6].isShow==true"/>
            <el-table-column align="center" label="头像" v-if="columnShowOptions[7].isShow==true">
                <template #default="scope">
                    <el-image style="width: 9.2vh; height: 9.2vh"
                        :src="scope.row.avatar == '' || scope.row.avatar == null ? null : scope.row.avatar"
                        :preview-src-list="scope.row.avatarArray" fit="cover" :preview-teleported="true">
                        <template #placeholder>
                            <div class="imagePlaceholderSlot">{{ scope.row.avatar == '' || scope.row.avatar == null ? "无" :
                                "Loading..." }}</div>
                        </template>
                    </el-image>
                </template>
            </el-table-column>
            <el-table-column property="createTime" :formatter="conversionDateTime" sortable align="center" label="创建时间"
                width="90" v-if="columnShowOptions[8].isShow==true"/>
            <el-table-column property="createBy" align="center" label="创建者" v-if="columnShowOptions[9].isShow==true"/>
            <el-table-column align="center" width="200" fixed="right">
                <template #header>
                    <el-popover placement="bottom" popper-class="column-popover" :width="200" trigger="hover">
                        <template #reference>
                            <span>
                                操作
                                <el-icon>
                                    <ArrowDownBold />
                                </el-icon>
                            </span>
                        </template>
                        <el-checkbox class="column-checkgroup-item" v-model="showAllColumnFlag" :indeterminate="isIndeterminate"
                            @change="handleCheckAllChange">全选</el-checkbox>
                        <el-divider />
                        <el-checkbox class="column-checkgroup-item" v-for="(item) in columnShowOptions"
                            v-model="item.isShow" :label="item.title" :key="item.title" />
                    </el-popover>
                </template>
                <template #default="scope">
                    <el-button v-perms="['sys:user:update']" :icon="Edit" size="default" type="primary"
                        @click="openUpdateDialog(scope.row)">
                        修改
                    </el-button>
                    <el-button v-perms="['sys:user:delete']" :icon="Delete" size="default" type="danger"
                        @click="openDeleteDialog(scope.row.id)">
                        删除</el-button>
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

        <!-- 头像查看 -->
        <el-dialog v-model="previewImageFlag">
            <div class="centerCommon">
                <el-image w-full="false" :src="dialogImageUrl" alt="Preview Image" :preview-teleported="true" />
            </div>
        </el-dialog>

        <!-- 新增窗口 -->
        <el-dialog v-model="addDialogFlag" title="新增用户" width="40%" draggable center :before-close="closeAddDialog">
            <ul ref="addDialogTop" style="overflow: auto;height:398px;padding: 0;">
                <el-form ref="firstFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="NewUserData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="姓名" prop="nickName">
                                <el-input v-model="NewUserData.nickName" size="large" placeholder="请输入真实姓名" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="用户名" prop="name">
                                <el-input v-model="NewUserData.name" size="large" placeholder="用于账号登录"
                                    :suffix-icon="userNameSameFlag ? 'CloseBold' : 'Select'" @input="checkUserName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色" prop="roleId">
                                <el-select v-model="NewUserData.roleId" multiple placeholder="请选择角色" size="large">
                                    <el-option v-for="item in roleSelect" :key="item.value" :label="item.label"
                                        :value="item.value" />
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="身份证号" prop="identity">
                                <el-input type="number" v-model="NewUserData.identity" size="large"
                                    @change="inputIdentity" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="性别" prop="sex">
                                <el-radio-group disabled v-model="NewUserData.sex">
                                    <el-radio label="男" />
                                    <el-radio label="女" />
                                </el-radio-group>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="出生年月" prop="birthday">
                                <el-input disabled v-model="NewUserData.birthday" size="large" placeholder="根据身份证号自动填写" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="手机号码" prop="mobile">
                                <el-input type="number" v-model="NewUserData.mobile" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="家庭住址" prop="homeAddress">
                                <el-input v-model="NewUserData.homeAddress" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="头像">
                                <el-upload v-model:file-list="addAvatarModel" :limit="1"
                                    :action="`${baseURL}/photo/addPhoto`" list-type="picture-card"
                                    :on-preview="handlePictureCardPreview" :on-remove="addHandleRemove"
                                    :on-success="addHandlePhotoSuccess">
                                    <el-icon>
                                        <Plus />
                                    </el-icon>
                                </el-upload>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
            </ul>
            <template #footer>
                <span class="dialog-footer">
                    <el-button type="primary" @click="sendAddUser(firstFormRef)">
                        确定
                    </el-button>
                    <el-button @click="closeAddDialog">取消</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 更新窗口 -->
        <el-dialog v-model="updateDialogFlag" title="更新用户信息" width="40%" draggable center :before-close="closeUpdateDialog">
            <ul ref="updateDialogTop" style="overflow: auto;height:398px;padding: 0;">
                <el-form ref="secondFormRef" :rules="firstRules" label-position="right" label-width="80px"
                    :model="UpdateUserData" style="max-width: 100%">
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="姓名" prop="nickName">
                                <el-input v-model="UpdateUserData.nickName" size="large" placeholder="请填写真实姓名" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="用户名" prop="name">
                                <el-input v-model="UpdateUserData.name" size="large" placeholder="用于账号登录"
                                    :suffix-icon="userNameSameFlag ? 'CloseBold' : 'Select'" @input="checkUserName" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="角色" prop="roleId">
                                <el-select v-model="UpdateUserData.roleId" multiple placeholder="请选择角色" size="large">
                                    <el-option v-for="item in roleSelect" :key="item.value" :label="item.label"
                                        :value="item.value" />
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="身份证号" prop="identity">
                                <el-input type="number" v-model="UpdateUserData.identity" size="large"
                                    @change="inputIdentity" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="性别" prop="sex">
                                <el-radio-group disabled v-model="UpdateUserData.sex">
                                    <el-radio label="男" />
                                    <el-radio label="女" />
                                </el-radio-group>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="出生年月" prop="birthday">
                                <el-input disabled v-model="UpdateUserData.birthday" size="large"
                                    placeholder="根据身份证号自动填写" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="手机号码" prop="mobile">
                                <el-input type="number" v-model="UpdateUserData.mobile" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="家庭住址" prop="homeAddress">
                                <el-input v-model="UpdateUserData.homeAddress" size="large" />
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row justify="center">
                        <el-col :span="16">
                            <el-form-item label="头像">
                                <el-upload v-model:file-list="updateAvatarModel" :limit="1"
                                    :action="`${baseURL}/photo/addPhoto`" list-type="picture-card"
                                    :on-preview="handlePictureCardPreview" :on-remove="updateHandleRemove"
                                    :on-success="updateHandlePhotoSuccess">
                                    <el-icon>
                                        <Plus />
                                    </el-icon>
                                </el-upload>
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

        <!-- 详情窗口 -->
        <!-- <el-dialog v-model="detailDialogFlag" title="用户详情" width="55%" draggable center
            :before-close="closeDetailDialog">
        </el-dialog> -->
    </div>
</template>

<script setup lang="ts">
import useLoadingStore from "@/store/loading";
import { Plus, Delete, Search, Download, Edit } from "@element-plus/icons-vue";
import { ElTable, ElMessage, ElMessageBox, UploadProps, UploadUserFile, FormInstance, FormRules } from 'element-plus';
import { conversionDateTime, dateConversion } from "@/utils/timeFormat";
import { getUserSex, getUserBirthday } from "@/utils/identity";
import {
    getUserListApi, getRoleSelectApi, getUserRolesApi, searchUserApi, addUserApi, updateUserApi,
    deleteUserApi, checkUserNameApi, sendExportParmApi
} from "@/api/user";
import { deletePhotoApi } from '@/api/photo';
import { baseURL } from '@/utils/url';


const loadingStore = useLoadingStore()
const searchData = ref("")
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(5)
const background = ref(true)
const firstTableData = ref([])
const returnAll = ref(false)
const addDialogFlag = ref(false)
const updateDialogFlag = ref(false)
// const detailDialogFlag = ref(false)
const firstFormRef = ref<FormInstance>()
const secondFormRef = ref<FormInstance>()
const addDialogTop = ref<any>()
const updateDialogTop = ref<any>()
const userNameSameFlag = ref(true)
const chooseUserNo = ref()
const dialogImageUrl = ref('')
const previewImageFlag = ref(false)
const addAvatarModel = ref<UploadUserFile[]>([])
const updateAvatarModel = ref<UploadUserFile[]>([])
const preDeletePhoto = ref()
const roleSelect = ref()
const tempUserName = ref()

// 新增
const NewUserData = reactive({
    name: '',
    nickName: '',
    roleId: [],
    sex: '',
    birthday: '',
    mobile: '',
    identity: '',
    homeAddress: '',
    avatar: '',
})

// 修改
const UpdateUserData = reactive({
    id: '',
    name: '',
    nickName: '',
    roleId: [],
    sex: '',
    birthday: '',
    mobile: '',
    identity: '',
    homeAddress: '',
    avatar: '',
    avatarArray: []
})

// 详情
// const UserDetail = reactive({
//     name: '',
//     nickName: '',
//     sex: '',
//     birthday: '',
//     mobile: '',
//     identity: '',
//     homeAddress: '',
//     avatar: '',
//     createTime: '',
//     createBy: '',
// })
const showAllColumnFlag = ref(true)
const columnShowOptions = ref([
    { title: "姓名", isShow: true },
    { title: "用户名", isShow: true },
    { title: "性别", isShow: true },
    { title: "年龄", isShow: true },
    { title: "手机号", isShow: true },
    { title: "身份证号", isShow: true },
    { title: "家庭住址", isShow: true },
    { title: "头像", isShow: true },
    { title: "创建时间", isShow: true },
    { title: "创建者", isShow: true },
])
// 选中与半选的状态控制, 条件就是 当前选中的数据个数大于0 且 小于所有列的总数
const isIndeterminate = computed<boolean>(() => {
    const showColumnArray = columnShowOptions.value.filter((item) => {
        return item.isShow == true
    });
    return showColumnArray.length > 0 && showColumnArray.length < columnShowOptions.value.length
})
// 全选与否的事件控制器
const handleCheckAllChange = (boolean: any) => {
    if (boolean) { // 全选 
        for (let i = 0; i < columnShowOptions.value.length; i++) {
            columnShowOptions.value[i].isShow = true;
        }
    } else { // 全不选
        for (let i = 0; i < columnShowOptions.value.length; i++) {
            columnShowOptions.value[i].isShow = false;
        }
    }
}

//表单校验规则
const firstRules = reactive<FormRules>({
    name: [
        { required: true, message: '请输入姓名', trigger: ['change'] }
    ],
    nickName: [
        { required: true, message: '请输入用户名', trigger: ['change'] }
    ],
    roleId: [
        { required: true, message: '请选择角色', trigger: ['change'] }
    ],
    sex: [
        { required: true, message: '请选择性别', trigger: ['change'] }
    ],
    birthday: [
        { required: true, message: '请输入出生日期', trigger: ['blur'] }
    ],
    mobile: [
        { required: true, message: '请输入手机号码', trigger: ['blur'] },
        { min: 11, max: 11, message: '手机号码必须在为11位', trigger: ['blur'] }
    ],
    identity: [
        { required: true, message: '请输入身份证号', trigger: ['blur'] },
        { min: 15, max: 18, message: '身份证号必须为15或18位', trigger: ['blur'] }
    ],
    homeAddress: [
        { required: true, message: '请输入家庭住址', trigger: ['change'] }
    ],
})


const getRoleSelect = () => {
    loadingStore.setLoadingT();
    getRoleSelectApi().then(res => {
        roleSelect.value = res.data;
        loadingStore.setLoadingF();
    })
}


onMounted(() => {
    initialize();
})


const initialize = () => {
    getTableData();
    getRoleSelect();
}


// 获取数据
const getTableData = () => {
    loadingStore.setLoadingT();
    getUserListApi(currentPage.value, pageSize.value).then(res => {
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
        searchUserApi(currentPage.value, pageSize.value, searchData.value).then(res => {
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


//导出表格
const exportExcel = () => {
    const sysUserExportParamsModel = {
        searchWord: searchData.value
    }
    sendExportParmApi(sysUserExportParamsModel).then(res => {
        if (res.code == 200) {
            const abtn = document.createElement("a");
            abtn.href = baseURL + "/user/exportExcel"
            abtn.click();
        }
    })
}

// 根据身份证号码获取性别、出生日期
const inputIdentity = () => {
    if (addDialogFlag.value) {
        NewUserData.sex = getUserSex(NewUserData.identity);
        NewUserData.birthday = getUserBirthday(NewUserData.identity);
    } else if (updateDialogFlag.value) {
        UpdateUserData.sex = getUserSex(UpdateUserData.identity);
        UpdateUserData.birthday = getUserBirthday(UpdateUserData.identity);
    }
}

// 打开新增窗口
const openAddDialog = () => {
    addDialogFlag.value = true
}


// 发送新增请求
const sendAddUser = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            if (NewUserData.identity.length == 15 || NewUserData.identity.length == 18) {
                if (userNameSameFlag.value == false) {
                    loadingStore.setLoadingT();
                    console.log(NewUserData);
                    addUserApi(NewUserData).then(res => {
                        loadingStore.setLoadingF();
                        if (res.data == 1) {
                            ElMessage({
                                message: '新增用户成功！用户密码默认为对应身份证号',
                                type: 'success',
                            })
                            initialize();
                            closeAddDialog();
                        }
                        else {
                            ElMessage({
                                message: '新增用户失败！',
                                type: 'error',
                                duration: 4000
                            })
                        }
                    })
                } else {
                    ElMessage({
                        message: '该用户名已重复，请修改！',
                        type: 'error',
                        duration: 4000
                    })
                }
            } else {
                ElMessage({
                    message: '身份证号填写有误，请检查！',
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


// 验证用户名是否重复
const checkUserName = (e: any) => {
    checkUserNameApi(e).then(res => {
        userNameSameFlag.value = res.data
        if (res.data == true) {
            ElMessage({
                message: '该用户名已重复，请修改！',
                type: 'error',
                grouping: true,
                duration: 4000
            })
        } else {
            ElMessage({
                message: '用户名验证合法！',
                type: 'success',
                grouping: true,
            })
        }
    })
}


// 关闭新增窗口
const closeAddDialog = () => {
    addAvatarModel.value = [];
    userNameSameFlag.value = true;
    addDialogFlag.value = false;
    AddReturnTop();
    firstFormRef.value?.resetFields();
    NewUserData.avatar = "";
}


// 打开更新窗口
const openUpdateDialog = async (row: any) => {
    updateDialogFlag.value = true;
    let roleIds = [];
    getUserRolesApi(row.id).then(res => {
        res.data.map((e) => {
            roleIds.push(e.roleId.toString());
        });
        // 若要置空的话，赋值必须要在窗口显示后，否则会被认定为初始值
        nextTick(() => {
            UpdateUserData.id = row.id;
            UpdateUserData.name = row.name;
            userNameSameFlag.value = false;
            tempUserName.value = row.name;
            UpdateUserData.nickName = row.nickName;
            UpdateUserData.roleId = roleIds;
            UpdateUserData.sex = row.sex;
            UpdateUserData.birthday = dateConversion(row.birthday);
            UpdateUserData.mobile = row.mobile;
            UpdateUserData.identity = row.identity;
            UpdateUserData.homeAddress = row.homeAddress;
            UpdateUserData.avatar = row.avatar;
            UpdateUserData.avatarArray.push(row.avatar);
            if (row.avatar != "" && row.avatar != null) {
                updateAvatarModel.value.push({
                    name: 'avatar',
                    url: row.avatar,
                });
            }
        })
    })
}


// 发送更新请求
const sendUpdateUser = async (formEl1: FormInstance | undefined) => {
    if (!formEl1) return
    await formEl1.validate((valid, fields) => {
        if (valid) {
            if (UpdateUserData.identity.length == 15 || UpdateUserData.identity.length == 18) {
                if (userNameSameFlag.value == false || tempUserName.value == UpdateUserData.name) {
                    loadingStore.setLoadingT();
                    console.log(UpdateUserData);
                    updateUserApi(UpdateUserData).then(res => {
                        loadingStore.setLoadingF();
                        if (res.data == 1) {
                            ElMessage({
                                message: '修改用户信息成功！',
                                type: 'success',
                            })
                            initialize();
                            closeUpdateDialog();
                            if (preDeletePhoto.value != null) {
                                // 删除修改的照片
                                deletePhotoApi(preDeletePhoto.value).then(() => {
                                    preDeletePhoto.value = null;
                                });
                            }
                        }
                        else {
                            ElMessage({
                                message: '修改用户信息失败！',
                                type: 'error',
                                duration: 4000
                            })
                        }
                    })
                } else {
                    ElMessage({
                        message: '该用户名已重复，请修改!',
                        type: 'error',
                        duration: 4000
                    })
                }
            } else {
                ElMessage({
                    message: '身份证号填写有误，请检查！',
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
    updateAvatarModel.value = [];
    UpdateUserData.avatarArray.length = 0;
    userNameSameFlag.value = true;
    preDeletePhoto.value = null;
    updateDialogFlag.value = false;
    UpdateReturnTop();
    secondFormRef.value?.resetFields();
}


// 预览上传的照片
const handlePictureCardPreview: UploadProps['onPreview'] = (uploadFile) => {
    dialogImageUrl.value = uploadFile.url!
    previewImageFlag.value = true
}


// 新增窗口：上传照片成功后赋值
const addHandlePhotoSuccess: UploadProps['onSuccess'] = (response, uploadFile) => {
    if (response.code == 200) {
        NewUserData.avatar = response.data;
    }
}


// 新增窗口：照片移除后发送请求后台删除照片
const addHandleRemove: UploadProps['onRemove'] = (uploadFile: any, uploadFiles) => {
    console.log(uploadFile, uploadFiles);
    NewUserData.avatar = "";
    deletePhotoApi(uploadFile.response.data);
    console.log("删除已上传照片");
}


// 更新窗口：上传照片成功后赋值
const updateHandlePhotoSuccess: UploadProps['onSuccess'] = (response, uploadFile) => {
    console.log(response.data);
    if (response.code == 200) {
        // 此处使用是因为要判别照片是否是新上传的
        // 在修改窗口新上传的照片都加到照片组里
        UpdateUserData.avatarArray = [];
        UpdateUserData.avatarArray.push(response.data);
        console.log(UpdateUserData.avatarArray);
        console.log(response.data);
        console.log("加入照片数据组");
    }
}


// 更新窗口：照片移除后发送请求后台删除照片
const updateHandleRemove: UploadProps['onRemove'] = (uploadFile: any, uploadFiles) => {
    console.log(uploadFile, uploadFiles);
    if (UpdateUserData.avatar != uploadFile.url) {
        // 已经新上传了，所以和照片中的地址不相等
        // 由于是新上传的，当移除时可以直接删掉
        UpdateUserData.avatarArray.splice(UpdateUserData.avatarArray.indexOf(uploadFile.response.data), 1);
        deletePhotoApi(uploadFile.response.data);
        console.log("删除已上传照片");
    } else {
        // 暂不移除，等用户点击确定了再移除
        preDeletePhoto.value = uploadFile.url;
        console.log("设为预删除照片");
    }
}


// 打开详情窗口
// const openDetailDialog = async (row: any) => {
//     UserDetail.name = row.name;
//     UserDetail.nickName = row.nickName;
//     UserDetail.sex = row.sex;
//     UserDetail.age = row.age;
//     UserDetail.mobile = row.mobile;
//     UserDetail.identity = row.identity;
//     UserDetail.homeAddress = row.homeAddress;
//     UserDetail.avatar = row.avatar;
//     UserDetail.createTime = dateTimeConversion(row.createTime);
//     UserDetail.createBy = row.createBy;
//     detailDialogFlag.value = true
// }


// 关闭详情窗口
// const closeDetailDialog = () => {
//     detailDialogFlag.value = false;
// }


// 打开删除窗口
const openDeleteDialog = (id: any) => {
    ElMessageBox.confirm(
        '您确定要删除该用户吗?',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            title: '系统提示',
            draggable: true,
        }
    ).then(() => {
        chooseUserNo.value = id;
        sendDeleteUser()
    });
}


// 发送删除请求
const sendDeleteUser = () => {
    loadingStore.setLoadingT();
    deleteUserApi(chooseUserNo.value).then(res => {
        loadingStore.setLoadingF();
        if (res.data == 1) {
            ElMessage({
                message: '删除用户成功！',
                type: 'success',
            })
            initialize();
        }
        else {
            ElMessage({
                message: '删除用户失败！',
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
.column-popover {
    max-height: 330px;
    overflow-y: auto;

    .el-divider--horizontal {
        margin: 10px 0;
    }

    .column-checkgroup-item {
        width: 100%;
    }
}
</style>

