package cn.edu.guet.service;


import cn.edu.guet.bean.SysUserRole;
import cn.edu.guet.bean.views.UserRoleView;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author 陶祎祎
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
     * 获取用户角色*
     * @param userId
     * @return
     */
    List<UserRoleView> getUserRoles(Long userId);
}
