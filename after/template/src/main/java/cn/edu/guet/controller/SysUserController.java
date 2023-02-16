package cn.edu.guet.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.edu.guet.bean.SysRole;
import cn.edu.guet.bean.SysUser;
import cn.edu.guet.bean.SysUserRole;
import cn.edu.guet.bean.common.ExportParamsModel;
import cn.edu.guet.bean.export.SysUserExport;
import cn.edu.guet.bean.util.ForgetFormParm;
import cn.edu.guet.bean.util.UpdatePasswordParm;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.service.SysRoleService;
import cn.edu.guet.service.SysUserRoleService;
import cn.edu.guet.service.SysUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import static cn.edu.guet.util.ExcelUtils.downloadExcel;


/**
 * @author 陶祎祎
 */
@RestController
@RequestMapping("/api/user")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Resource
    private SysUserRoleService sysUserRoleService;

    @Resource
    private SysRoleService sysRoleService;


    //    获取用户数据
    @RequestMapping("/getUserList")
    @PreAuthorize("hasAuthority('sys:user:view')")
    public HttpResult getUserList(int current, int page){
        return HttpResult.success("查询成功",sysUserService.getUserList(current,page));
    }

//    搜索用户
    @RequestMapping("/searchUser")
    @PreAuthorize("hasAuthority('sys:user:view')")
    public HttpResult searchUser(int current,int page,String searchWord){
        return HttpResult.success("查询成功",sysUserService.searchUser(current,page,searchWord));
    }

//    添加用户
    @RequestMapping("/addUser")
    @PreAuthorize("hasAuthority('sys:user:add')")
    public HttpResult addUser(@RequestBody SysUser sysUser){
        return HttpResult.success("新增成功",sysUserService.addUser(sysUser));
    }

//    更新用户
    @RequestMapping("/updateUser")
    @PreAuthorize("hasAuthority('sys:user:update')")
    public HttpResult updateUser(@RequestBody SysUser sysUser){
        return HttpResult.success("修改成功",sysUserService.updateUser(sysUser));
    }

//    删除用户
    @DeleteMapping("/deleteUser/{id}")
    @PreAuthorize("hasAuthority('sys:user:delete')")
    public HttpResult deleteUser(@PathVariable("id") Integer id){
        System.out.println("所要删除的ID为"+id);
        return HttpResult.success("删除成功",sysUserService.deleteUser(id));
    }

//    获取导出参数（搜索关键词）
    @RequestMapping("/sendExportParm")
    @PreAuthorize("hasAuthority('sys:user:export')")
    public HttpResult sendExportParm(HttpServletRequest request, @RequestBody ExportParamsModel sysUserExportParamsModel){
        request.getServletContext().setAttribute("sysUserExportParamsModel", sysUserExportParamsModel);
        System.out.println("存进的全局属性："+ sysUserExportParamsModel);
        return HttpResult.success("传递参数成功");
    }

//    导出excel
    @RequestMapping("/exportExcel")
    @PreAuthorize("hasAuthority('sys:user:export')")
    public void exportExcel(HttpServletResponse response, HttpServletRequest request) throws Exception {
        ExportParamsModel sysUserExportParamsModel = (ExportParamsModel) request.getServletContext().getAttribute("sysUserExportParamsModel");
        System.out.println("拿到的全局数据:"+sysUserExportParamsModel);
        // 导出
        String fileName = "用户列表.xlsx";
        ExportParams exportParams = new ExportParams();
        exportParams.setType(ExcelType.XSSF);
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, SysUserExport.class, sysUserService.sysUserExportExcel(sysUserExportParamsModel.getSearchWord()));
        downloadExcel(fileName, workbook, response);
    }

//    验证用户名是否重复
    @RequestMapping("/checkUserName")
    public HttpResult checkUserName(String name){
        return HttpResult.success("获取成功",sysUserService.checkUserName(name));
    }

//    获取所有角色，以便给用户分配 Select配套
    @RequestMapping("/getRoleSelect")
    public HttpResult getRoleSelect(){
        return HttpResult.success("查询成功",sysRoleService.getRoleSelect());
    }

    //    获取用户的角色
    @RequestMapping("/getUserRoles")
    public HttpResult getUserRoles(Long userId){
        return HttpResult.success("查询成功",sysUserRoleService.getUserRoles(userId));
    }

    //    更新个人信息
    @RequestMapping("/updateOwnInfo")
    public HttpResult updateOwnInfo(@RequestBody SysUser sysUser){
        return HttpResult.success("修改成功",sysUserService.updateOwnInfo(sysUser));
    }

    @PostMapping("/checkOldPassword")
    public HttpResult checkUserName(@RequestBody UpdatePasswordParm updatePasswordParm){
        return HttpResult.success("获取成功",sysUserService.checkOldPassword(updatePasswordParm));
    }

    @PostMapping("/checkUserInfo")
    public HttpResult checkUserInfo(@RequestBody UpdatePasswordParm updatePasswordParm){
        return sysUserService.checkUserInfo(updatePasswordParm);
    }

    @PostMapping("/updatePassword")
    public HttpResult updatePassword(@RequestBody UpdatePasswordParm updatePasswordParm){
        return HttpResult.success("修改成功",sysUserService.updatePassword(updatePasswordParm));
    }

//    获取用户按钮权限 name是用户名
    @GetMapping(value = "/getPermissions")
    public HttpResult getPermissions(@RequestParam String name) {
        System.out.println("查找权限："+name);
        System.out.println("find");
        return HttpResult.success("查询成功",sysUserService.getPermissions(name));
    }

    //通过用户名获取user信息
    @GetMapping("/nickName/{name}")
    public HttpResult getUserByNick(@PathVariable("name") String name){
        System.out.println("需要的username是："+name);
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getName,name);
        SysUser sysUser = sysUserService.getOne(query);

        if(sysUser==null){
            return HttpResult.error("无对应信息");
        }

        //赋值roleId和roleName
        QueryWrapper<SysUserRole> sysUserRoleQueryWrapper = new QueryWrapper<>();
        sysUserRoleQueryWrapper.lambda().eq(SysUserRole::getUserId,sysUser.getId());
        // SysUserRole sysUserRole = sysUserRoleService.getOne(sysUserRoleQueryWrapper);
        List<SysUserRole> sysUserRoleList = sysUserRoleService.list(sysUserRoleQueryWrapper);
        List<Long> roleIdList = new ArrayList<>();
        List<String> roleNameList = new ArrayList<>();
        for (SysUserRole sysUserRole : sysUserRoleList) {
            QueryWrapper<SysRole> sysRoleQueryWrapper = new QueryWrapper<>();
            sysRoleQueryWrapper.lambda().eq(SysRole::getId,sysUserRole.getRoleId());
            SysRole sysRole = sysRoleService.getOne(sysRoleQueryWrapper);
            roleIdList.add(sysRole.getId());
            roleNameList.add(sysRole.getName());
        }
        sysUser.setRoleId(roleIdList);
        sysUser.setRoleNames(roleNameList);
        return HttpResult.success("查询成功",sysUser);
    }

}
