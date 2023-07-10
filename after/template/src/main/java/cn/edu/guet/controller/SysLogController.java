package cn.edu.guet.controller;

import cn.edu.guet.http.HttpResult;
import cn.edu.guet.service.SysLogService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author 陶祎祎
 */
@RestController
@RequestMapping("/api/log")
public class SysLogController {

    @Resource
    private SysLogService sysLogService;

    @GetMapping("/getLogList")
    @PreAuthorize("hasAuthority('sys:log:view')")
    public HttpResult getLogList(int current, int page){
        return HttpResult.success("查询成功",sysLogService.getLogList(current,page));
    }


    //    删除日志
    @DeleteMapping("/deleteLog/{id}")
    @PreAuthorize("hasAuthority('sys:log:delete')")
    public HttpResult deleteLog(@PathVariable("id") Integer id){
        System.out.println("所要删除的ID为"+id);
        return HttpResult.success("删除成功",sysLogService.deleteLog(id));
    }

    @DeleteMapping("/sevenDayDelete")
    @PreAuthorize("hasAuthority('sys:log:delete')")
    public HttpResult sevenDayDelete(){
        return sysLogService.sevenDayDelete();
    }
}
