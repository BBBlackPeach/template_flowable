package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.*;
import cn.edu.guet.bean.export.SysUserExport;
import cn.edu.guet.bean.util.ForgetFormParm;
import cn.edu.guet.bean.util.UpdatePasswordParm;
import cn.edu.guet.bean.views.UserRoleView;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.mapper.SysRoleMapper;
import cn.edu.guet.mapper.SysUserMapper;
import cn.edu.guet.mapper.SysUserRoleMapper;
import cn.edu.guet.mapper.export.SysUserExportMapper;
import cn.edu.guet.service.SysMenuService;
import cn.edu.guet.service.SysUserRoleService;
import cn.edu.guet.service.SysUserService;
import cn.edu.guet.util.PasswordUtils;
import cn.edu.guet.util.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static cn.edu.guet.util.ImageUtils.deleteImages;


/**
 * @author 陶祎祎
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysUserExportMapper sysUserExportMapper;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysMenuService sysMenuService;

    @Override
    public Page<SysUser> getUserList(int currentPage, int pageSize) {
        QueryWrapper<SysUser> qw = new QueryWrapper<>();
        qw.orderByAsc("create_time", "id");
        Page<SysUser> page = new Page<>(currentPage, pageSize);
        page = sysUserMapper.selectPage(page, qw);
        for (SysUser record : page.getRecords()) {
            //处理图片，形成一个图片数组
            String avatar = record.getAvatar();
//            头像
            if (StringUtils.isNotEmpty(avatar) && avatar.contains(",")) {
                List<String> list = new ArrayList<>();
                list.add(avatar);
                record.setAvatarArray(list);
            } else {
                record.setAvatarArray(Arrays.asList(avatar));
            }
        }
        return page;
    }

    @Override
    public Page<SysUser> searchUser(int currentPage, int pageSize, String searchWord) {
        QueryWrapper<SysUser> qw = new QueryWrapper<>();
        qw.like("name", searchWord).or().like("nick_name", searchWord).or()
                .like("sex", searchWord).or().like("mobile", searchWord).or()
                .like("identity", searchWord).or().like("home_address", searchWord).orderByAsc("create_time", "id");
        Page<SysUser> page = new Page<>(currentPage, pageSize);
        page = sysUserMapper.selectPage(page, qw);
        for (SysUser record : page.getRecords()) {
            //处理图片，形成一个图片数组
            String avatar = record.getAvatar();
//            头像
            if (StringUtils.isNotEmpty(avatar) && avatar.contains(",")) {
                List<String> list = new ArrayList<>();
                list.add(avatar);
                record.setAvatarArray(list);
            } else {
                record.setAvatarArray(Arrays.asList(avatar));
            }
        }
        return page;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addUser(SysUser sysUser) {
        sysUser.setCreateBy(SecurityUtils.getUsername());
        sysUser.setLastUpdateBy(SecurityUtils.getUsername());
        String salt = PasswordUtils.getSalt();
        String encode = PasswordUtils.encode("123456", salt);
        sysUser.setPassword(encode);
        sysUser.setSalt(salt);
        int result = sysUserMapper.insert(sysUser);
        if (result == 1) {
            for(int i=0;i<sysUser.getRoleId().size();i++){
                SysUserRole sysUserRole=new SysUserRole();
                sysUserRole.setUserId(sysUser.getId());
                sysUserRole.setRoleId(sysUser.getRoleId().get(i));
                if(sysUserRoleMapper.insert(sysUserRole)==1){
    //                获取相应角色，更改用户绑定flag
                    QueryWrapper<SysRole> qw = new QueryWrapper<>();
                    qw.eq("id", sysUser.getRoleId().get(i));
                    SysRole sysRole=sysRoleMapper.selectOne(qw);
                    sysRole.setUserExistFlag(1);
                    sysRoleMapper.updateById(sysRole);
                }
            }
        }
        return result;
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateUser(SysUser sysUser) {
        sysUser.setAvatar(sysUser.getAvatarArray().get(0));
        sysUser.setLastUpdateBy(SecurityUtils.getUsername());
        int result = sysUserMapper.updateById(sysUser);
        if (result == 1) {
            QueryWrapper<SysUserRole> qw1 = new QueryWrapper<>();
            qw1.eq("user_id", sysUser.getId());
            List<SysUserRole> sysUserRoleList=sysUserRoleMapper.selectList(qw1);

            for(int i=0;i<sysUser.getRoleId().size();i++){
//                新增用户角色记录，并修改用户绑定flag
//                与原记录进行循环比较roleId
//                若新角色不在原角色列表中，则添加
                boolean sameFlag=false;
                for(int j=0;j<sysUserRoleList.size();j++){
                    if(sysUser.getRoleId().get(i).equals(sysUserRoleList.get(j).getRoleId())){
                        sameFlag=true;
                        break;
                    }
                }

                if(!sameFlag){
                    SysUserRole sysUserRole=new SysUserRole();
                    sysUserRole.setUserId(sysUser.getId());
                    sysUserRole.setRoleId(sysUser.getRoleId().get(i));
                    if(sysUserRoleMapper.insert(sysUserRole)==1){
//                      获取相应角色，更改用户绑定flag
                        QueryWrapper<SysRole> qw2 = new QueryWrapper<>();
                        qw2.eq("id", sysUser.getRoleId().get(i));
                        SysRole sysRole=sysRoleMapper.selectOne(qw2);
                        sysRole.setUserExistFlag(1);
                        sysRoleMapper.updateById(sysRole);
                    }
                }
            }

            for(int i=0;i<sysUserRoleList.size();i++){
//                删除用户角色记录，并修改用户绑定flag
//                与新列表进行循环比较roleId
//                若原角色不在新列表中，则删除
                boolean sameFlag=false;
                for(int j=0;j<sysUser.getRoleId().size();j++){
                    if(sysUser.getRoleId().get(j).equals(sysUserRoleList.get(i).getRoleId())){
                        sameFlag=true;
                        break;
                    }
                }

                if(!sameFlag){
                    if(sysUserRoleMapper.deleteById(sysUserRoleList.get(i).getId())==1){
//                      获取相应角色，更改用户绑定flag
                        QueryWrapper<SysRole> qw3 = new QueryWrapper<>();
                        qw3.eq("id", sysUserRoleList.get(i).getRoleId());
                        SysRole sysRole=sysRoleMapper.selectOne(qw3);
                        sysRole.setUserExistFlag(0);
                        sysRoleMapper.updateById(sysRole);
                    }
                }
            }
        }
        return result;
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteUser(int id) {
        String avatarUrl=sysUserMapper.selectById(id).getAvatar();
        int result=sysUserMapper.deleteById(id);
        if(result==1){
            deleteImages(avatarUrl);

//            查找该用户的角色列表
            QueryWrapper<SysUserRole> qw1 = new QueryWrapper<>();
            qw1.eq("user_id", id);
            List<SysUserRole> sysUserRoleList=sysUserRoleMapper.selectList(qw1);

//            删除该用户的角色绑定
            if(sysUserRoleMapper.delete(qw1)>=1){
                for(int i=0;i<sysUserRoleList.size();i++){
                    QueryWrapper<SysUserRole> qw2 = new QueryWrapper<>();
                    qw2.eq("role_id", sysUserRoleList.get(i).getRoleId());

//                    检查相应角色的用户绑定情况
//                    若为0，则将该角色的用户绑定flag修改为0
                    if(sysUserRoleMapper.selectList(qw2).size()==0){
                        SysRole sysRole=sysRoleMapper.selectById(sysUserRoleList.get(i).getRoleId());
                        sysRole.setUserExistFlag(0);
                        sysRoleMapper.updateById(sysRole);
                    }
                }
            }
        }
        return result;
    }

    @Override
    public Boolean checkUserName(String name) {
        QueryWrapper<SysUser> qw = new QueryWrapper<>();
        qw.eq("name", name).orderByAsc("create_time","id");
        List<SysUser> sysUserList = sysUserMapper.selectList(qw);
        return !sysUserList.isEmpty();
    }

    @Override
    public List<SysUserExport> sysUserExportExcel(String searchWord) {
        QueryWrapper<SysUserExport> qw = new QueryWrapper<>();
        qw.like("name", searchWord).or().like("nick_name", searchWord).or()
                .like("sex", searchWord).or().like("mobile", searchWord).or()
                .like("identity", searchWord).or().like("home_address", searchWord).orderByAsc("create_time", "id");
        return sysUserExportMapper.selectList(qw);
    }

    @Override
    public Boolean checkUserName(ForgetFormParm forgetFormParm) {
        return checkUserName(forgetFormParm.getUserName());
    }

    @Override
    public HttpResult checkUserInfo(ForgetFormParm forgetFormParm) {
        QueryWrapper<SysUser> qw = new QueryWrapper<>();
        qw.eq("name", forgetFormParm.getUserName());
        SysUser sysUser = sysUserMapper.selectOne(qw);
        if(!sysUser.getNickName().equals(forgetFormParm.getNickName())){
            return HttpResult.success("姓名验证失败，请检查！",false);
        }else if(!sysUser.getIdentity().equals(forgetFormParm.getIdentity())){
            return HttpResult.success("身份证号码验证失败，请检查！",false);
        }else{
            return HttpResult.success("验证成功",true);
        }
    }

    @Override
    public int updatePassword(ForgetFormParm forgetFormParm) {
        QueryWrapper<SysUser> qw = new QueryWrapper<>();
        qw.eq("name", forgetFormParm.getUserName());
        SysUser sysUser = sysUserMapper.selectOne(qw);
        String salt = PasswordUtils.getSalt();
        String encode = PasswordUtils.encode(forgetFormParm.getFirstPassword(), salt);
        sysUser.setPassword(encode);
        sysUser.setSalt(salt);
        return sysUserMapper.updateById(sysUser);
    }

    @Override
    public Boolean checkOldPassword(UpdatePasswordParm updatePasswordParm) {
        SysUser sysUser = sysUserMapper.selectById(updatePasswordParm.getId());
        if (PasswordUtils.matches(sysUser.getSalt(), updatePasswordParm.getOldPassword(), sysUser.getPassword())) {
            return true;
        }
        return false;
    }

    @Override
    public HttpResult checkUserInfo(UpdatePasswordParm updatePasswordParm) {
        SysUser sysUser = sysUserMapper.selectById(updatePasswordParm.getId());
        if(!sysUser.getNickName().equals(updatePasswordParm.getNickName())){
            return HttpResult.success("姓名验证失败，请检查！",false);
        }else if(!sysUser.getIdentity().equals(updatePasswordParm.getIdentity())){
            return HttpResult.success("身份证号码验证失败，请检查！",false);
        }else{
            return HttpResult.success("验证成功",true);
        }
    }

    @Override
    public int updatePassword(UpdatePasswordParm updatePasswordParm) {
        SysUser sysUser = sysUserMapper.selectById(updatePasswordParm.getId());
        String salt = PasswordUtils.getSalt();
        String encode = PasswordUtils.encode(updatePasswordParm.getFirstPassword(), salt);
        sysUser.setPassword(encode);
        sysUser.setSalt(salt);
        return sysUserMapper.updateById(sysUser);
    }

    @Override
    public int updateOwnInfo(SysUser sysUser) {
        System.out.println(sysUser);
        String avatarUrl="";
        if(sysUser.getAvatarArray()!=null){
            avatarUrl=sysUser.getAvatar();
            sysUser.setAvatar(sysUser.getAvatarArray().get(0));
            sysUser.setLastUpdateBy(SecurityUtils.getUsername());
        }
        int result=sysUserMapper.updateById(sysUser);
        if(result==1){
            if(sysUser.getAvatarArray()!=null){
                if(avatarUrl!=null&&avatarUrl!=""){
                    deleteImages(avatarUrl);
                }
            }
        }
        return result;
    }

    @Override
    public SysUser findByName(String name) {
        QueryWrapper<SysUser> sysUserQueryWrapper = new QueryWrapper<>();
        sysUserQueryWrapper.lambda().eq(SysUser::getName, name);
        SysUser sysUser = sysUserMapper.selectOne(sysUserQueryWrapper);

        if (sysUser != null) {
            List<UserRoleView> userRoles = sysUserRoleService.getUserRoles(sysUser.getId());
            ArrayList<String> roleNameList = new ArrayList<>();
            for (UserRoleView userRole : userRoles) {
                roleNameList.add(userRole.getName());
            }
            sysUser.setUserRoles(userRoles);
            sysUser.setRoleNames(roleNameList);
            return sysUser;
        }
        return null;
    }

    @Override
    public Set<String> getPermissions(String userName) {
        Set<String> perms = new HashSet<>();
        List<SysMenu> sysMenus = sysMenuService.findByUser(userName);
        for (SysMenu sysMenu : sysMenus) {
            if (sysMenu.getPerms() != null && !"".equals(sysMenu.getPerms())) {
                perms.add(sysMenu.getPerms());
            }
        }
        return perms;
    }
}
