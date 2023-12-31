package cn.edu.guet.aspect;

import cn.edu.guet.bean.SysLog;
import cn.edu.guet.service.SysLogService;
import cn.edu.guet.util.HttpUtils;
import cn.edu.guet.util.IPUtils;
import cn.edu.guet.util.SecurityUtils;
import com.alibaba.fastjson.JSONObject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 系统日志，切面处理类，记录日志
 * @author 陶祎祎
 */
@Aspect
@Component
public class SysLogAspect {

    @Resource
    private SysLogService sysLogService;

    @Pointcut("execution(* cn.edu.guet.controller.*.*(..))")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        // 执行方法
        Object result = point.proceed();
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;
        // 保存日志
        saveSysLog(point, time);
        return result;
    }

    private void saveSysLog(ProceedingJoinPoint joinPoint, long time) {
        String userName = SecurityUtils.getUsername();
        if (joinPoint.getTarget() instanceof SysLogService) {
            return;
        }
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        SysLog sysLog = new SysLog();

        // 请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        sysLog.setMethod(className + "." + methodName + "()");

        // 请求的参数
        Object[] args = joinPoint.getArgs();
        try {
            String params = JSONObject.toJSONString(args[0]);
            if (params.length() > 200) {
                params = params.substring(0, 200) + "...";
            }
            sysLog.setParams(params);
        } catch (Exception e) {
        }

        // 获取request
        HttpServletRequest request = HttpUtils.getHttpServletRequest();
        // 设置IP地址
        sysLog.setIp(IPUtils.getIpAddr(request));

        // 用户名
        sysLog.setUserName(userName);

        // 执行时长(毫秒)
        sysLog.setTime(time);

        //创建者
        sysLog.setCreateBy(SecurityUtils.getUsername());
        //创建时间
        sysLog.setCreateTime(new Date());
        //最近操作
        sysLog.setLastUpdateBy(SecurityUtils.getUsername());
        //最近操作时间
        sysLog.setLastUpdateTime(new Date());

        // 保存系统日志
        sysLogService.save(sysLog);
    }
}