<template>
  <div class="header-layout" :style="`color: ${styleStore.headerTextColor}`">
    <div class="justifyCenterGroup" @click="clickCollapse">
      <div class="header-layout-icon-group">
        <el-icon v-if="collapseTF" size="26">
          <Expand />
        </el-icon>
        <el-icon v-else size="26">
          <Fold />
        </el-icon>
      </div>
      <div class="header-layout-breadcrumb">
        <el-breadcrumb :separator-icon="ArrowRight">
          <el-breadcrumb-item class="header-layout-breadcrumb-item" v-for="item in breadcrumbPath">
            <span :style="`color: ${styleStore.headerTextColor}`">
              {{
                item
              }}
            </span>
          </el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </div>
    <div>
      <div class="header-layout-title">后台管理系统开发模板</div>
    </div>
    <div class="avatar-group">
      <div class="header-layout-icon-group" style="margin-right: 0.8rem;">
        <el-icon class="header-layout-icon" size="26" @click="openStyleDialog">
          <Brush />
        </el-icon>
        <el-icon class="header-layout-icon" v-if="fullScreenTF" size="26" @click="changeFullScreen">
          <TopRight />
        </el-icon>
        <el-icon class="header-layout-icon" v-else size="26" @click="changeFullScreen">
          <FullScreen />
        </el-icon>
      </div>
      <span v-for="role, index in userInfo.roleNames">
        <span v-if="index != 1">{{
          role
        }}</span>
        <span v-else>•{{ role }}</span>
      </span>
      <el-avatar class="avatar" :src="userInfo.avatar" size="large"></el-avatar>
      <el-dropdown>
        <span :style="`color: ${styleStore.headerTextColor}`">
          {{ userInfo.nickName }}
          <el-icon>
            <ArrowDownBold />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="openUserDrawer">个人信息</el-dropdown-item>
            <el-dropdown-item @click="openPasswordDialog">修改密码</el-dropdown-item>
            <el-dropdown-item @click="loginOut">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>


  <!-- 抽屉 -->
  <el-drawer v-model="drawerFlag" :with-header="false" :before-close="closeUserDrawer">
    <div class="centerCommon">
      <h2>个人中心</h2>
    </div>
    <div class="centerCommon">
      <!-- 由于当没有头像时，无法触发点击事件，因此只能外嵌一个div -->
      <div @click="openAvatarDialog">
        <el-image :src="userInfo.avatar == '' || userInfo.avatar == null ? null : userInfo.avatar"
          style="width: 16vh; height: 16vh; border-radius: 50%" />
      </div>
    </div>
    <div class="centerCommon" style="line-height: 6vh;">
      <span class="userNameClass">用户名：</span>{{ userInfo.name }}
    </div>
    <el-divider border-style="double" style="height: 0.3vh;background-color: #2d51e6;">
      <el-icon color="#2d51e6" size="30">
        <StarFilled />
      </el-icon>
    </el-divider>
    <div class="centerCommon">
      <span class="labelGroup">姓名：</span><span class="valueGroup">{{ userInfo.nickName }}</span>
    </div>
    <div class="centerCommon">
      <span class="labelGroup">性别：</span><span class="valueGroup">{{ userInfoData.sex }}</span>
    </div>
    <div class="centerCommon">
      <span class="labelGroup">年龄：</span><span class="valueGroup">{{ userInfoData.age }}</span>
    </div>
    <div class="centerCommon">
      <span class="labelGroup">身份证号码:</span>
    </div>
    <div class="centerCommon">
      <div v-show="!identityFlag" class="hiddenGroup" @click="identityFlag = true">
        <div class="justifyCenterGroup">
          <span>
            点击查看&nbsp;
          </span>
          <el-icon size="22">
            <View />
          </el-icon>
        </div>
      </div>
      <div v-show="identityFlag" class="showGroup" @click="identityFlag = false">
        <div class="justifyCenterGroup">
          <span class="valueGroup">{{ userInfoData.identity }}&nbsp;</span>
          <el-icon size="22">
            <Hide />
          </el-icon>
        </div>
      </div>
    </div>
    <div class="centerCommon">
      <span class="labelGroup">家庭住址:</span>
    </div>
    <div class="centerCommon">
      <div v-show="!homeAddressFlag" class="hiddenGroup" @click="homeAddressFlag = true">
        <div class="justifyCenterGroup">
          <span>
            点击查看&nbsp;
          </span>
          <el-icon size="22">
            <View />
          </el-icon>
        </div>
      </div>
      <div v-show="homeAddressFlag" class="showGroup" @click="homeAddressFlag = false">
        <div class="justifyCenterGroup">
          <span class="valueGroup">{{ userInfoData.homeAddress }}&nbsp;</span>
          <el-icon size="22">
            <Hide />
          </el-icon>
        </div>
      </div>
    </div>
    <div class="drawerButtonGroup">
      <el-button :icon="Edit" type="primary" size="large" @click="openInfoDialog">
        修改
      </el-button>
    </div>
  </el-drawer>

  <!-- 自定义主题窗口 -->
  <el-dialog v-model="styleDialogFlag" title="自定义主题颜色" width="40%" :modal="false" draggable center
    :before-close="closeStyleDialog">
    <el-form label-position="right" label-width="150px" style="max-width: 100%">
      <el-row justify="center">
        <el-col :span="10">
          <el-form-item label="菜单栏背景颜色">
            <el-color-picker v-model="NewStyleData.asideBackgroundColor" size="large"
              :change="styleStore.setAsideBackgroundColor(NewStyleData.asideBackgroundColor)" />
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="头部背景颜色">
            <el-color-picker v-model="NewStyleData.headerBackgroundColor" size="large"
              :change="styleStore.setHeaderBackgroundColor(NewStyleData.headerBackgroundColor)" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row justify="center">
        <el-col :span="10">
          <el-form-item label="菜单栏字体颜色">
            <el-color-picker v-model="NewStyleData.asideTextColor" size="large"
              :change="styleStore.setAsideTextColor(NewStyleData.asideTextColor)" />
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="头部字体颜色">
            <el-color-picker v-model="NewStyleData.headerTextColor" size="large"
              :change="styleStore.setHeaderTextColor(NewStyleData.headerTextColor)" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row justify="center">
        <el-col :span="10">
          <el-form-item label="菜单栏选中字体颜色">
            <el-color-picker v-model="NewStyleData.asideActiveTextColor" size="large"
              :change="styleStore.setAsideActiveTextColor(NewStyleData.asideActiveTextColor)" />
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="标签页被选中颜色">
            <el-color-picker v-model="NewStyleData.tabActiveTextColor" size="large"
              :change="styleStore.setTabActiveTextColor(NewStyleData.tabActiveTextColor)" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row justify="center">
        <el-col :span="20">
          <el-form-item label="内容页背景颜色">
            <el-color-picker v-model="NewStyleData.mainBackgroundColor" size="large"
              :change="styleStore.setMainBackgroundColor(NewStyleData.mainBackgroundColor)" />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button type="primary" @click="styleStore.setDefaultStyle">
          默认主题
        </el-button>
      </span>
    </template>
  </el-dialog>

  <!-- 更换头像窗口 -->
  <el-dialog v-model="avatarDialogFlag" title="头像预览" width="32%" draggable center :before-close="closeAvatarDialog">
    <ul ref="updateDialogTop" style="overflow: auto;height:32vh;padding: 0;">
      <div class="centerCommon">
        <el-upload ref="uploadAvatarRef" :limit="1" :action="`${baseURL}/photo/addPhoto`" :on-remove="updateHandleRemove"
          :on-success="updateHandlePhotoSuccess" style="line-height: 2.1vh;">
          <div class="centerCommon">
            <el-image :src="previewPhoto == '' || previewPhoto == null ? null : previewPhoto"
              style="width: 23vh; height: 23vh; border-radius: 50%" />
          </div>
        </el-upload>
      </div>
      <div class="centerCommon">
        <span class="labelGroup" style="font-size: 1.7vh;">
          点击头像进行上传
        </span>
      </div>
    </ul>
    <template #footer>
      <span class="dialog-footer">
        <el-button type="primary" @click="sendUpdateAvatar">
          确定
        </el-button>
        <el-button @click="closeAvatarDialog">取消</el-button>
      </span>
    </template>
  </el-dialog>

  <!-- 修改资料窗口 -->
  <el-dialog v-model="infoDialogFlag" title="修改个人信息" width="40%" draggable center :before-close="closeInfoDialog">
    <ul ref="updateDialogTop" style="overflow: auto;height:398px;padding: 0;">
      <el-form ref="firstFormRef" :rules="firstRules" label-position="right" label-width="80px" :model="UpdateUserData"
        style="max-width: 100%">
        <el-row justify="center">
          <el-col :span="16">
            <el-form-item label="姓名" prop="nickName">
              <el-input v-model="UpdateUserData.nickName" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row justify="center">
          <el-col :span="16">
            <el-form-item label="用户名" prop="name">
              <el-input v-model="UpdateUserData.name" size="large"
                :suffix-icon="userNameSameFlag ? 'CloseBold' : 'Select'" @input="checkUserName" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row justify="center">
          <el-col :span="16">
            <el-form-item label="身份证号" prop="identity">
              <el-input type="number" v-model="UpdateUserData.identity" size="large" @change="inputIdentity" />
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
              <el-input disabled v-model="UpdateUserData.birthday" size="large" placeholder="根据身份证号自动填写" />
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
      </el-form>
    </ul>
    <template #footer>
      <span class="dialog-footer">
        <el-button type="primary" @click="sendUpdateUser(firstFormRef)">
          确定
        </el-button>
        <el-button @click="closeInfoDialog">取消</el-button>
      </span>
    </template>
  </el-dialog>

  <!-- 修改密码窗口 -->
  <el-dialog v-model="passwordDialogFlag" title="修改密码" width="40%" draggable center :before-close="closePasswordDialog">
    <ul ref="addDialogTop" style="overflow: auto;height:135px;padding: 0;margin: 0;">
      <el-form label-position="right" label-width="180px" :model="UpdateUserPassword" style="max-width: 100%">
        <el-row v-show="activeStep == 1 && switchWayFlag == 1">
          <el-col :span="18">
            <el-form-item label="原密码" prop="oldPassword" :rules="[
              { required: true, message: '请输入原密码', trigger: ['change'] }]">
              <el-input v-model="UpdateUserPassword.oldPassword" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="activeStep == 1 && switchWayFlag == 2">
          <el-col :span="18">
            <el-form-item label="姓名" prop="nickName" :rules="[
              { required: true, message: '请输入姓名', trigger: ['change'] }]">
              <el-input v-model="UpdateUserPassword.nickName" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="activeStep == 1 && switchWayFlag == 2">
          <el-col :span="18">
            <el-form-item label="身份证号" prop="identity" :rules="[
              { required: true, message: '请输入身份证号', trigger: ['change'] }]">
              <el-input type="number" v-model="UpdateUserPassword.identity" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
        <div v-show="activeStep == 1" class="centerCommon" style="line-height: 1.7vh;color: #40a6fa;" @click="switchWay">
          点击切换验证方式
        </div>
        <el-row v-show="activeStep == 2">
          <el-col :span="18">
            <el-form-item label="新密码" prop="firstPassword" :rules="[
              { required: true, message: '请输入新密码', trigger: ['change'] }]">
              <el-input v-model="UpdateUserPassword.firstPassword" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-show="activeStep == 2">
          <el-col :span="18">
            <el-form-item label="再次输入密码" prop="secondPassword" :rules="[
              { required: true, message: '请再次输入密码', trigger: ['change'] }]">
              <el-input v-model="UpdateUserPassword.secondPassword" size="large" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </ul>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="goBack" v-if="activeStep != 1">上一步</el-button>
        <el-button type="primary" @click="toNext">
          下一步
        </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import { deletePhotoApi } from '@/api/photo';
import { baseURL } from '@/utils/url';
import { getUserSex, getUserBirthday } from "@/utils/identity";
import { dateConversion } from "@/utils/timeFormat";
import { ArrowRight, Edit } from "@element-plus/icons-vue";
import { ElMessageBox, ElMessage, UploadProps, UploadInstance, FormInstance, FormRules } from 'element-plus';
import { getUserByNickApi, checkUserNameApi, updateOwnInfoApi, checkOldPasswordApi, checkUserInfoApi, updatePasswordApi } from '@/api/user'
import useRouterStore from '@/store/router';
import useMenuStore from '@/store/menu';
import useUserStore from '@/store/user';
import useLoadingStore from "@/store/loading";
import useStyleStore from '@/store/style';
import { storeToRefs } from 'pinia';
import { removeRoutes } from '@/router';
import screenfull from 'screenfull';
const router = useRouter()
const routerStore = useRouterStore();
const menuStore = useMenuStore();
const userInfoStore = useUserStore();
const loadingStore = useLoadingStore();
const styleStore = useStyleStore();
const { collapseTF } = storeToRefs(menuStore);
const { userInfo } = storeToRefs(userInfoStore);


// 面包屑
const route = useRoute();
const breadcrumbPath = computed(() => {
  let result = [];
  route.matched.forEach((path) => {
    const index = result.findIndex((e) => e == path.name);
    if (index == -1) {
      result.push(path.name);
    }
  })
  return result;
});

// 全屏
const fullScreenTF = ref(false);

// 自定义主题
const styleDialogFlag = ref(false)
const NewStyleData = reactive({
  asideBackgroundColor: '',
  asideTextColor: '',
  asideActiveTextColor: '',
  headerBackgroundColor: '',
  headerTextColor: '',
  tabActiveTextColor: '',
  mainBackgroundColor: '',
})

// 抽屉
const drawerFlag = ref(false)
const identityFlag = ref(false)
const homeAddressFlag = ref(false)
const userInfoData = reactive({
  sex: '',
  age: '',
  birthday: '',
  mobile: '',
  identity: '',
  homeAddress: '',
})

// 修改头像
const avatarDialogFlag = ref(false)
const uploadAvatarRef = ref<UploadInstance>()
const previewPhoto = ref()
const UpdateUserAvatar = reactive({
  id: '',
  avatar: '',
  avatarArray: []
})

// 修改个人信息
const infoDialogFlag = ref(false)
const firstFormRef = ref<FormInstance>()
const tempUserName = ref()
const userNameSameFlag = ref(true)
const UpdateUserData = reactive({
  id: '',
  name: '',
  nickName: '',
  sex: '',
  birthday: '',
  mobile: '',
  identity: '',
  homeAddress: '',
})

// 修改密码
const passwordDialogFlag = ref(false)
const activeStep = ref(1)
const switchWayFlag = ref(1)
const UpdateUserPassword = reactive({
  id: '',
  oldPassword: '',
  nickName: '',
  identity: '',
  firstPassword: '',
  secondPassword: ''
})

//修改个人信息表单校验规则
const firstRules = reactive<FormRules>({
  name: [
    { required: true, message: '请输入姓名', trigger: ['change'] }
  ],
  nickName: [
    { required: true, message: '请输入用户名', trigger: ['change'] }
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
    { required: true, message: '请输入身份证号', trigger: ['blur'] }
  ],
  homeAddress: [
    { required: true, message: '请输入家庭住址', trigger: ['change'] }
  ],
})

// 打开自定义主题窗口
const openStyleDialog = () => {
  styleDialogFlag.value = true;
  // nextTick(() => {
  NewStyleData.asideBackgroundColor = styleStore.asideBackgroundColor;
  NewStyleData.asideTextColor = styleStore.asideTextColor;
  NewStyleData.asideActiveTextColor = styleStore.asideActiveTextColor;
  NewStyleData.headerBackgroundColor = styleStore.headerBackgroundColor;
  NewStyleData.headerTextColor = styleStore.headerTextColor;
  NewStyleData.tabActiveTextColor = styleStore.tabActiveTextColor;
  NewStyleData.mainBackgroundColor = styleStore.mainBackgroundColor;
  // })
  // styleStore.setDefaultStyle();
}

// 关闭自定义主题窗口
const closeStyleDialog = () => {
  styleDialogFlag.value = false;
}

// 改变全屏状态
const changeFullScreen = () => {
  if (fullScreenTF.value) {
    screenfull.exit();
  } else {
    console.log(screenfull.isEnabled);
    screenfull.toggle(document.getElementById("myFullScreenContainer"));
  }
}

//退出
const loginOut = () => {
  router.push('/login');
  removeRoutes();
  routerStore.setRouterNull();
  menuStore.setMenuNull();
  userInfoStore.setUserInfoNull();
};

//是否展开menu
const clickCollapse = () => {
  menuStore.changeCollapse();
};

// 获取个人信息
const getUserInfo = () => {
  getUserByNickApi(userInfo.value.name).then(res => {
    if (res && res.code == 200 && res.data) {
      // 存入状态管理
      let newUserInfo = {
        userId: res.data.id,
        name: res.data.name,
        nickName: res.data.nickName,
        avatar: res.data.avatar,
        roleNames: res.data.roleNames,
      }
      userInfoStore.setUserInfo(newUserInfo);
      // 记录到当前对象
      userInfoData.sex = res.data.sex;
      userInfoData.age = res.data.age;
      userInfoData.birthday = res.data.birthday;
      userInfoData.mobile = res.data.mobile;
      userInfoData.identity = res.data.identity;
      userInfoData.homeAddress = res.data.homeAddress;
    } else {
      ElMessageBox.confirm(
        '因用户名修改，登录已过期，请重新登录',
        {
          confirmButtonText: '确定',
          showCancelButton: false,
          title: '系统提示',
          draggable: true,
        }
      ).then(() => {
        loginOut()
      });
    }
  })
}

// 打开个人中心（抽屉）
const openUserDrawer = () => {
  drawerFlag.value = true;
  getUserInfo();
}

// 关闭个人中心（抽屉）
const closeUserDrawer = () => {
  drawerFlag.value = false;
  identityFlag.value = false;
  homeAddressFlag.value = false;
}

// 打开修改头像窗口
const openAvatarDialog = async (row: any) => {
  avatarDialogFlag.value = true;
  nextTick(() => {
    UpdateUserAvatar.id = userInfo.value.userId;
    UpdateUserAvatar.avatar = userInfo.value.avatar;
    previewPhoto.value = userInfo.value.avatar;
    UpdateUserAvatar.avatarArray.push(row.avatar);
  })
}

// 发送修改头像请求
const sendUpdateAvatar = () => {
  loadingStore.setLoadingT();
  console.log(UpdateUserAvatar);
  updateOwnInfoApi(UpdateUserAvatar).then(res => {
    loadingStore.setLoadingF();
    if (res.data == 1) {
      ElMessage({
        message: '修改头像成功！',
        type: 'success',
      })
      getUserInfo();
      closeAvatarDialog();
    }
    else {
      ElMessage({
        message: '修改头像失败！',
        type: 'error',
        duration: 4000
      })
    }
  })
}

// 更新窗口：上传照片成功后赋值
const updateHandlePhotoSuccess: UploadProps['onSuccess'] = (response, uploadFile) => {
  if (response.code == 200) {
    // 此处使用是因为要判别照片是否是新上传的
    // 在修改窗口新上传的照片都加到照片组里
    UpdateUserAvatar.avatarArray = [];
    UpdateUserAvatar.avatarArray.push(response.data);
    previewPhoto.value = response.data;
    console.log(UpdateUserAvatar.avatarArray);
    console.log(response.data);
    console.log("加入照片数据组");
  }
}


// 更新窗口：照片移除后发送请求后台删除照片
const updateHandleRemove: UploadProps['onRemove'] = (uploadFile: any, uploadFiles) => {
  if (UpdateUserAvatar.avatar != uploadFile.url) {
    // 已经新上传了，所以和照片中的地址不相等
    // 由于是新上传的，当移除时可以直接删掉
    UpdateUserAvatar.avatarArray.splice(UpdateUserAvatar.avatarArray.indexOf(uploadFile.response.data), 1);
    deletePhotoApi(uploadFile.response.data);
    console.log("删除已上传照片");
  }
  previewPhoto.value = UpdateUserAvatar.avatar;
}


// 关闭修改头像窗口
const closeAvatarDialog = () => {
  avatarDialogFlag.value = false;
  uploadAvatarRef.value.clearFiles();
}

// 根据身份证号码获取性别、出生日期
const inputIdentity = () => {
  UpdateUserData.sex = getUserSex(UpdateUserData.identity);
  UpdateUserData.birthday = getUserBirthday(UpdateUserData.identity);
}

// 打开更新资料窗口
const openInfoDialog = async (row: any) => {
  infoDialogFlag.value = true;
  nextTick(() => {
    UpdateUserData.id = userInfo.value.userId;
    UpdateUserData.name = userInfo.value.name;
    userNameSameFlag.value = false;
    tempUserName.value = userInfo.value.name;
    UpdateUserData.nickName = userInfo.value.nickName;
    UpdateUserData.sex = userInfoData.sex;
    UpdateUserData.birthday = dateConversion(userInfoData.birthday);
    UpdateUserData.mobile = userInfoData.mobile;
    UpdateUserData.identity = userInfoData.identity;
    UpdateUserData.homeAddress = userInfoData.homeAddress;
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

// 发送更新请求
const sendUpdateUser = async (formEl1: FormInstance | undefined) => {
  if (!formEl1) return
  await formEl1.validate((valid, fields) => {
    if (valid) {
      if (UpdateUserData.identity.length == 15 || UpdateUserData.identity.length == 18) {
        if (userNameSameFlag.value == false || tempUserName.value == UpdateUserData.name) {
          loadingStore.setLoadingT();
          console.log(UpdateUserData);
          updateOwnInfoApi(UpdateUserData).then(res => {
            loadingStore.setLoadingF();
            if (res.data == 1) {
              ElMessage({
                message: '修改个人信息成功！',
                type: 'success',
              })
              getUserInfo();
              closeInfoDialog();
            }
            else {
              ElMessage({
                message: '修改个人信息失败！',
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
const closeInfoDialog = () => {
  userNameSameFlag.value = true;
  infoDialogFlag.value = false;
  firstFormRef.value?.resetFields();
}

// 打开修改密码窗口
const openPasswordDialog = () => {
  passwordDialogFlag.value = true;
  switchWayFlag.value = 1;
  UpdateUserPassword.id = userInfo.value.userId;
}

// 切换验证方式
const switchWay = () => {
  if (switchWayFlag.value == 1) {
    UpdateUserPassword.oldPassword = "";
    switchWayFlag.value = 2;
  } else if (switchWayFlag.value == 2) {
    UpdateUserPassword.nickName = "";
    UpdateUserPassword.identity = "";
    switchWayFlag.value = 1;
  }
}

// 返回上一步
const goBack = () => {
  if (activeStep.value == 2) {
    activeStep.value = 1;
    UpdateUserPassword.nickName = "";
    UpdateUserPassword.identity = "";
  } else if (activeStep.value == 3) {
    activeStep.value = 2;
    UpdateUserPassword.firstPassword = "";
    UpdateUserPassword.secondPassword = "";
  }
}

// 进入下一步
const toNext = () => {
  if (activeStep.value == 1) {
    if (switchWayFlag.value == 1) {
      if (UpdateUserPassword.oldPassword != null && UpdateUserPassword.oldPassword != "") {
        loadingStore.setLoadingT();
        checkOldPasswordApi(UpdateUserPassword).then(res => {
          loadingStore.setLoadingF();
          if (res.data == true) {
            activeStep.value = 2;
            ElMessage({
              message: '密码验证成功！',
              type: 'success',
            })
          } else {
            ElMessage({
              message: '密码错误，请重试！',
              type: 'error',
              duration: 4000
            })
          }
        })
      } else {
        ElMessage({
          message: '原密码不能为空！',
          type: 'error',
          duration: 4000
        })
      }
    } else if (switchWayFlag.value == 2) {
      if (UpdateUserPassword.nickName != null && UpdateUserPassword.nickName != ""
        && UpdateUserPassword.identity != null && UpdateUserPassword.identity != "") {
        loadingStore.setLoadingT();
        checkUserInfoApi(UpdateUserPassword).then(res => {
          loadingStore.setLoadingF();
          if (res.data == true) {
            activeStep.value = 3;
            ElMessage({
              message: '账号信息验证成功！',
              type: 'success',
            })
          } else {
            ElMessage({
              message: res.msg,
              type: 'error',
              duration: 4000
            })
          }
        })
      } else {
        ElMessage({
          message: '姓名或身份证号不能为空！',
          type: 'error',
          duration: 4000
        })
      }
    }
  } else if (activeStep.value == 2) {
    if (UpdateUserPassword.firstPassword != null && UpdateUserPassword.firstPassword != ""
      && UpdateUserPassword.secondPassword != null && UpdateUserPassword.secondPassword != "") {
      if (UpdateUserPassword.firstPassword == UpdateUserPassword.secondPassword) {
        loadingStore.setLoadingT();
        updatePasswordApi(UpdateUserPassword).then(res => {
          loadingStore.setLoadingF();
          if (res.data == 1) {
            ElMessage({
              message: '密码修改成功！',
              type: 'success',
            });
            closePasswordDialog();
            ElMessageBox.confirm(
              '因密码修改，登录已过期，请重新登录',
              {
                confirmButtonText: '确定',
                showCancelButton: false,
                title: '系统提示',
                draggable: true,
              }
            ).then(() => {
              loginOut()
            });
          } else {
            ElMessage({
              message: '密码修改失败',
              type: 'error',
              duration: 4000
            })
          }
        })
      } else {
        ElMessage({
          message: '两次输入的密码不一致，请检查！',
          type: 'error',
          duration: 4000
        })
      }
    } else {
      ElMessage({
        message: '密码不能为空！',
        type: 'error',
        duration: 4000
      })
    }
  }
}

// 关闭找回密码窗口
const closePasswordDialog = () => {
  passwordDialogFlag.value = false;
  UpdateUserPassword.oldPassword = "";
  UpdateUserPassword.nickName = "";
  UpdateUserPassword.identity = "";
  UpdateUserPassword.firstPassword = "";
  UpdateUserPassword.secondPassword = "";
}

</script>

<style lang="scss" scoped>
.header-layout {
  display: flex;
  justify-content: space-between;
  font-size: $DefaultFontSize;

  .header-layout-icon-group {
    display: flex;
    justify-content: center;
    align-items: center;

    .header-layout-icon {
      margin: 0 0.2vw;
    }
  }

  .header-layout-breadcrumb {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 1vw;

    .header-layout-breadcrumb-item {
      font-size: $SecondFontSize;
      font-weight: bolder;
    }
  }

  .header-layout-title {
    font-size: $SecondFontSize;
    font-weight: bolder;
  }

  .avatar-group {
    display: flex;
    justify-content: center;
    align-items: center;

    .avatar {
      margin: 0 1vh;
    }
  }
}

.centerCommon {
  display: flex;
  justify-content: center;
}

.userNameClass {
  font-weight: bolder;
}

.labelGroup {
  font-weight: bolder;
  line-height: 5vh;
}

.valueGroup {
  line-height: 5vh;
}

.hiddenGroup {
  line-height: 5vh;
  color: #40a6fa;
}

.showGroup {
  line-height: 5vh;
  color: #40a6fa;
}

// 垂直居中
.justifyCenterGroup {
  display: flex;
  align-items: center;
  flex-direction: row;
  font-size: $SecondFontSize;
}

.drawerButtonGroup {
  margin-top: 8vh;
  display: flex;
  justify-content: center;
}
</style>
