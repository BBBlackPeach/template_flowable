package cn.edu.guet.controller;


import cn.edu.guet.bean.util.LoginFormParm;
import cn.edu.guet.bean.SysUser;
import cn.edu.guet.bean.util.ForgetFormParm;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.security.JwtAuthenticationToken;
import cn.edu.guet.service.SysUserService;
import cn.edu.guet.util.AscUtils;
import cn.edu.guet.util.PasswordUtils;
import cn.edu.guet.util.SecurityUtils;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 陶祎祎
 */
@RestController
@AllArgsConstructor
@RequestMapping("/api/login")
public class LoginController {

    private AuthenticationManager authenticationManager;

    private SysUserService sysUserService;

    @PostMapping("/login")
    public HttpResult login(@RequestBody LoginFormParm loginFormParm, HttpServletRequest request) {
        String username = loginFormParm.getUsername();
        String password = AscUtils.desEncrypt(loginFormParm.getPassword(),AscUtils.KEY,AscUtils.IV);
        // 用户信息
        SysUser user = sysUserService.findByName(username);

        // 账号不存在
        if (user == null) {
            return HttpResult.error("账号不存在");
        }
        // 账号锁定
        if (user.getStatus()==0) {
            return HttpResult.error("该账号已锁定，请联系管理员处理");
        }
        // 密码错误
        if (!PasswordUtils.matches(user.getSalt(), password, user.getPassword())) {
            return HttpResult.error("用户名或密码错误");
        }
        // 系统登录认证
        JwtAuthenticationToken token = SecurityUtils.login(request, username, password, authenticationManager);

        return HttpResult.success("获取token", token);
    }

    @PostMapping("/forgetPassword/checkUserName")
    public HttpResult checkUserName(@RequestBody ForgetFormParm forgetFormParm){
        return HttpResult.success("获取成功",sysUserService.checkUserName(forgetFormParm));
    }

    @PostMapping("/forgetPassword/checkUserInfo")
    public HttpResult checkUserInfo(@RequestBody ForgetFormParm forgetFormParm){
        return sysUserService.checkUserInfo(forgetFormParm);
    }

    @PostMapping("/forgetPassword/updatePassword")
    public HttpResult updatePassword(@RequestBody ForgetFormParm forgetFormParm){
        return HttpResult.success("修改成功",sysUserService.updatePassword(forgetFormParm));
    }
}
