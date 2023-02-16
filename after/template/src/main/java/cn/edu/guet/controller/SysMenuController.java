package cn.edu.guet.controller;


import cn.edu.guet.bean.SysMenu;
import cn.edu.guet.bean.SysUser;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.service.SysMenuService;
import cn.edu.guet.util.MakeMenuTree;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 陶祎祎
 */
@RestController
@RequestMapping("/api/menu")
public class SysMenuController {

    @Autowired
    private SysMenuService sysMenuService;

    // @PreAuthorize("hasAuthority('sys:menu:view')")
    @GetMapping(value = "/getMenuTree/{username}")
    public HttpResult getMenuTree(@PathVariable("username") String userName) {
        System.out.println("查找菜单树：" + userName);
        List<SysMenu> sysMenus = sysMenuService.getMenuTree(userName, 1);
        return HttpResult.success("查询成功",sysMenus);
    }

    @GetMapping("/getMenuList")
    @PreAuthorize("hasAuthority('sys:menu:view')")
    public HttpResult getMenuList() {
        return HttpResult.success("查询成功", sysMenuService.getMenuList());
    }

    //    添加菜单
    @RequestMapping("/addMenu")
    @PreAuthorize("hasAuthority('sys:menu:add')")
    public HttpResult addMenu(@RequestBody SysMenu sysMenu){
        return HttpResult.success("新增成功",sysMenuService.addMenu(sysMenu));
    }

    //    更新菜单
    @RequestMapping("/updateMenu")
    @PreAuthorize("hasAuthority('sys:menu:update')")
    public HttpResult updateMenu(@RequestBody SysMenu sysMenu){
        return HttpResult.success("修改成功",sysMenuService.updateMenu(sysMenu));
    }

    //    删除菜单
    @DeleteMapping("/deleteMenu/{id}")
    @PreAuthorize("hasAuthority('sys:menu:delete')")
    public HttpResult deleteMenu(@PathVariable("id") Integer id){
        System.out.println("所要删除的ID为"+id);
        return HttpResult.success("删除成功",sysMenuService.deleteMenu(id));
    }

    //    获取所有目录
    @RequestMapping("/getCatalogueData")
    public HttpResult getCatalogueData(){
        return HttpResult.success("获取成功",sysMenuService.getCatalogueData());
    }

    //    获取所有菜单
    @RequestMapping("/getMenuData")
    public HttpResult getMenuData(){
        return HttpResult.success("获取成功",sysMenuService.getMenuData());
    }

    //    验证菜单名称是否重复
    @RequestMapping("/checkMenuName")
    public HttpResult checkMenuName(String name){
        return HttpResult.success("获取成功",sysMenuService.checkMenuName(name));
    }

    //    验证菜单URL地址是否重复
    @RequestMapping("/checkMenuUrl")
    public HttpResult checkMenuUrl(String url){
        return HttpResult.success("获取成功",sysMenuService.checkMenuUrl(url));
    }

    //    验证菜单文件路径是否重复
    @RequestMapping("/checkFilePath")
    public HttpResult checkFilePath(String filePath){
        return HttpResult.success("获取成功",sysMenuService.checkFilePath(filePath));
    }

    //    验证权限字段是否重复
    @RequestMapping("/checkMenuPerms")
    public HttpResult checkMenuPerms(String menuPerms){
        return HttpResult.success("获取成功",sysMenuService.checkMenuPerms(menuPerms));
    }

//        查询所有的目录，菜单，包括按钮
    @RequestMapping("/getAllMenu")
    public HttpResult getAllMenu() {
        return HttpResult.success("获取成功", sysMenuService.getAllMenu());
    }
}
