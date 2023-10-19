package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.SysUserRole;
import cn.edu.guet.bean.views.UserRoleView;
import cn.edu.guet.mapper.SysUserRoleMapper;
import cn.edu.guet.mapper.views.UserRoleViewMapper;
import cn.edu.guet.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 陶祎祎
 */
@Service
@AllArgsConstructor
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

    private UserRoleViewMapper userRoleViewMapper;

    @Override
    public List<UserRoleView> getUserRoles(Long userId) {
        QueryWrapper<UserRoleView> qw = new QueryWrapper<>();
        qw.eq("user_id", userId);
        return userRoleViewMapper.selectList(qw);
    }
}
