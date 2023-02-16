package cn.edu.guet.service;

import cn.edu.guet.bean.SysUser;
import cn.edu.guet.bean.export.SysUserExport;
import cn.edu.guet.bean.util.ForgetFormParm;
import cn.edu.guet.bean.util.UpdatePasswordParm;
import cn.edu.guet.bean.views.UserRoleView;
import cn.edu.guet.http.HttpResult;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Set;

/**
 * @author 陶祎祎
 */
public interface SysUserService extends IService<SysUser> {

    Page<SysUser> getUserList(int currentPage, int pageSize);
    Page<SysUser> searchUser(int currentPage, int pageSize,String searchWord);
    int addUser(SysUser sysUser);
    int updateUser(SysUser sysUser);
    int deleteUser(int id);
    Boolean checkUserName(String name);
    List<SysUserExport> sysUserExportExcel(String searchWord);

//    忘记密码
    Boolean checkUserName(ForgetFormParm forgetFormParm);
    HttpResult checkUserInfo(ForgetFormParm forgetFormParm);
    int updatePassword(ForgetFormParm forgetFormParm);

//        修改密码
    Boolean checkOldPassword(UpdatePasswordParm updatePasswordParm);
    HttpResult checkUserInfo(UpdatePasswordParm updatePasswordParm);
    int updatePassword(UpdatePasswordParm updatePasswordParm);

//    更新个人信息
    int updateOwnInfo(SysUser sysUser);

    SysUser findByName(String username);

    /**
     * 查找用户的菜单权限标识集合
     * @param userName
     * @return
     */
    Set<String> getPermissions(String userName);
}
