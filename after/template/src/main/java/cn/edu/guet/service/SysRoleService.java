package cn.edu.guet.service;


import cn.edu.guet.bean.SysRole;
import cn.edu.guet.bean.common.SelectModel;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author 陶祎祎
 */
public interface SysRoleService extends IService<SysRole> {

    Page<SysRole> getRoleList(int currentPage, int pageSize);
    Page<SysRole> searchRole(int currentPage, int pageSize,String searchWord);
    int addRole(SysRole sysRole);
    int updateRole(SysRole sysRole);
    int deleteRole(int id);
    Boolean checkRoleName(String name);
    
    List<SelectModel> getRoleSelect();

}
