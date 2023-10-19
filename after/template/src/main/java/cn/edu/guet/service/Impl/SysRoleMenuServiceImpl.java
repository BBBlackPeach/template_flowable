package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.util.RoleAuthorParm;
import cn.edu.guet.bean.SysRoleMenu;
import cn.edu.guet.mapper.SysRoleMenuMapper;
import cn.edu.guet.service.SysRoleMenuService;
import cn.edu.guet.util.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 陶祎祎
 */
@Service
@AllArgsConstructor
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {

    @Override
    public List<Long> getRoleAuthor(String roleId) {
        QueryWrapper<SysRoleMenu> qw=new QueryWrapper<>();
        qw.eq("role_id",roleId);
        List<SysRoleMenu> sysRoleMenuList=this.baseMapper.selectList(qw);
        List<Long> menuIdList=new ArrayList<>();
        for(SysRoleMenu sysRoleMenu:sysRoleMenuList){
            menuIdList.add(sysRoleMenu.getMenuId());
        }
        return menuIdList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateAuthor(RoleAuthorParm parm) {
        QueryWrapper<SysRoleMenu> qw=new QueryWrapper<>();
        qw.eq("role_id",parm.getId());
        this.baseMapper.delete(qw);
        int result=0;
        for (int i=0;i<parm.getList().size();i++){
            SysRoleMenu sysRoleMenu=new SysRoleMenu();
            sysRoleMenu.setCreateBy(SecurityUtils.getUsername());
            sysRoleMenu.setLastUpdateBy(SecurityUtils.getUsername());
            sysRoleMenu.setRoleId(parm.getId());
            sysRoleMenu.setMenuId(parm.getList().get(i));
            result=result+this.baseMapper.insert(sysRoleMenu);
        }
        return result;
    }
}
