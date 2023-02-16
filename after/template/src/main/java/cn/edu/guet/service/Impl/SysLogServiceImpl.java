package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.SysLog;
import cn.edu.guet.mapper.SysLogMapper;
import cn.edu.guet.service.SysLogService;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;


/**
 * @author 陶祎祎
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {
    @Resource
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
    public int sevenDayDelete() {
        //删除7天前的日志
        QueryWrapper<SysLog> sysLogQueryWrapper = new QueryWrapper<>();
        sysLogQueryWrapper.lambda().le(SysLog::getCreateTime, DateUtil.offsetWeek(new Date(),-1));
        return sysLogMapper.delete(sysLogQueryWrapper);
    }
}
