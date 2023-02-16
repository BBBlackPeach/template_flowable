package cn.edu.guet.controller;

import cn.edu.guet.bean.*;
import cn.edu.guet.bean.util.RoleAuthorParm;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.service.SysRoleMenuService;
import cn.edu.guet.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * @author 陶祎祎
 */
@RestController
@RequestMapping("/api/role")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    //    获取角色数据
    @RequestMapping("/getRoleList")
    @PreAuthorize("hasAuthority('sys:role:view')")
    public HttpResult getRoleList(int current, int page){
        return HttpResult.success("查询成功",sysRoleService.getRoleList(current,page));
    }

    //    搜索角色
    @RequestMapping("/searchRole")
    @PreAuthorize("hasAuthority('sys:role:view')")
    public HttpResult searchRole(int current,int page,String searchWord){
        return HttpResult.success("查询成功",sysRoleService.searchRole(current,page,searchWord));
    }

    //    添加角色
    @RequestMapping("/addRole")
    @PreAuthorize("hasAuthority('sys:role:add')")
    public HttpResult addRole(@RequestBody SysRole sysRole){
        return HttpResult.success("新增成功",sysRoleService.addRole(sysRole));
    }

    //    更新角色
    @RequestMapping("/updateRole")
    @PreAuthorize("hasAuthority('sys:role:update')")
    public HttpResult updateRole(@RequestBody SysRole sysRole){
        return HttpResult.success("修改成功",sysRoleService.updateRole(sysRole));
    }

    //    删除角色
    @DeleteMapping("/deleteRole/{id}")
    @PreAuthorize("hasAuthority('sys:role:delete')")
    public HttpResult deleteRole(@PathVariable("id") Integer id){
        System.out.println("所要删除的ID为"+id);
        return HttpResult.success("删除成功",sysRoleService.deleteRole(id));
    }

    //    验证角色名称是否重复
    @RequestMapping("/checkRoleName")
    public HttpResult checkRoleName(String name){
        return HttpResult.success("获取成功",sysRoleService.checkRoleName(name));
    }

    //通过角色id获取拥有的所有的菜单
    @RequestMapping("/getRoleAuthor/{roleId}")
    public HttpResult getRoleAuthor(@PathVariable("roleId") String roleId){
        return HttpResult.success("获取成功",sysRoleMenuService.getRoleAuthor(roleId));
    }

    //分配权限保存
    @PostMapping("/updateAuthor")
    public HttpResult updateAuthor(@RequestBody RoleAuthorParm parm){
        return HttpResult.success("修改成功",sysRoleMenuService.updateAuthor(parm));
    }
}
