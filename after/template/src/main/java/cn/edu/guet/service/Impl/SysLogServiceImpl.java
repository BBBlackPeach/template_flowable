package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.SysLog;
import cn.edu.guet.http.HttpResult;
import cn.edu.guet.mapper.SysLogMapper;
import cn.edu.guet.service.SysLogService;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author 陶祎祎
 */
@Service
@AllArgsConstructor
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

    private SysLogMapper sysLogMapper;

    @Override
    public Page<SysLog> getLogList(int currentPage, int pageSize) {
        QueryWrapper<SysLog> qw = new QueryWrapper<>();
        qw.orderByDesc("create_time", "id");
        Page<SysLog> page = new Page<>(currentPage, pageSize);
        return sysLogMapper.selectPage(page, qw);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteLog(int id) {
        return sysLogMapper.deleteById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public HttpResult sevenDayDelete() {
        //删除7天前的日志
        QueryWrapper<SysLog> sysLogQueryWrapper = new QueryWrapper<>();
        sysLogQueryWrapper.lambda().le(SysLog::getCreateTime, DateUtil.offsetWeek(new Date(),-1));
        if(sysLogMapper.selectList(sysLogQueryWrapper).size()==0){
            return HttpResult.success("暂无可删除日志",-1);
        }else{
            int result=sysLogMapper.delete(sysLogQueryWrapper);
            if(result!=0){
                return HttpResult.success("删除成功，共删除"+result+"条日志",result);
            }else{
                return HttpResult.success("删除失败",result);
            }
        }
    }
}
