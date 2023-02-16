package cn.edu.guet.service;

import cn.edu.guet.bean.util.RoleAuthorParm;
import cn.edu.guet.bean.SysRoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


/**
 * @author 陶祎祎
 */
public interface SysRoleMenuService extends IService<SysRoleMenu> {

    List<Long> getRoleAuthor(String roleId);

    int updateAuthor(RoleAuthorParm parm);
}
