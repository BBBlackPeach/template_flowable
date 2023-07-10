package cn.edu.guet.service;

import cn.edu.guet.bean.SysLog;
import cn.edu.guet.http.HttpResult;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * @author 陶祎祎
 */
public interface SysLogService extends IService<SysLog> {

    Page<SysLog> getLogList(int currentPage, int pageSize);
    int deleteLog(int id);

    //删除7天前的日志
    HttpResult sevenDayDelete();
}
