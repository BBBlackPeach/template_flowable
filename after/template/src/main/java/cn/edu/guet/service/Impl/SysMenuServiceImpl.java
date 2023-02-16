package cn.edu.guet.service.Impl;

import cn.edu.guet.bean.SysMenu;
import cn.edu.guet.bean.common.SelectModel;
import cn.edu.guet.mapper.SysMenuMapper;
import cn.edu.guet.service.SysMenuService;
import cn.edu.guet.util.MakeMenuTree;
import cn.edu.guet.util.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 陶祎祎
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public List<SysMenu> getMenuTree(String userName, int menuType) {
        List<SysMenu> sysMenus = new ArrayList<>();
        List<SysMenu> menus = findByUser(userName);
        for (SysMenu menu : menus) {
            if (menu.getParentId() == null || menu.getParentId() == 0) {
                menu.setLevel(0);
                if (!exists(sysMenus, menu)) {
                    sysMenus.add(menu);
                }
            }
        }
        sysMenus.sort((o1, o2) -> o1.getOrderNum().compareTo(o2.getOrderNum()));
        findChildren(sysMenus, menus, menuType);
        return sysMenus;
    }

    @Override
    public List<SysMenu> findByUser(String userName) {
        if (userName == null || "".equals(userName) || "admin".equalsIgnoreCase(userName)) {
            return sysMenuMapper.findAll();
        }
        return sysMenuMapper.findByUserName(userName);
    }

    @Override
    public List<SysMenu> getMenuList() {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.orderByAsc("order_num");
        return MakeMenuTree.makeTree(sysMenuMapper.selectList(qw),0L);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addMenu(SysMenu sysMenu) {
        SysMenu newSysMenu=new SysMenu();
        newSysMenu.setCreateBy(SecurityUtils.getUsername());
        newSysMenu.setLastUpdateBy(SecurityUtils.getUsername());
        newSysMenu.setName(sysMenu.getName());
        if(sysMenu.getType()==0){
            newSysMenu.setType(0);
            newSysMenu.setParentId(0L);
            newSysMenu.setParentName("顶级菜单");
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setUrl(sysMenu.getUrl());
            newSysMenu.setIcon(sysMenu.getIcon());
        }else if(sysMenu.getType()==1){
            if(sysMenu.getParentId()!=0){
                QueryWrapper<SysMenu> qw = new QueryWrapper<>();
                qw.eq("id", sysMenu.getParentId());
                sysMenuMapper.selectOne(qw);
                newSysMenu.setParentId(sysMenu.getParentId());
                newSysMenu.setParentName(sysMenuMapper.selectOne(qw).getName());
            }else{
                newSysMenu.setParentId(0L);
                newSysMenu.setParentName("顶级菜单");
            }
            newSysMenu.setType(1);
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setUrl(sysMenu.getUrl());
            newSysMenu.setFilePath(sysMenu.getFilePath());
            newSysMenu.setIcon(sysMenu.getIcon());
            newSysMenu.setColor(sysMenu.getColor());
        }else if(sysMenu.getType()==2){
            QueryWrapper<SysMenu> qw = new QueryWrapper<>();
            qw.eq("id", sysMenu.getParentId());
            sysMenuMapper.selectOne(qw);
            newSysMenu.setType(2);
            newSysMenu.setParentId(sysMenu.getParentId());
            newSysMenu.setParentName(sysMenuMapper.selectOne(qw).getName());
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setPerms(sysMenu.getPerms());
        }
        return sysMenuMapper.insert(newSysMenu);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateMenu(SysMenu sysMenu) {
        SysMenu newSysMenu=new SysMenu();
        newSysMenu.setLastUpdateBy(SecurityUtils.getUsername());
        newSysMenu.setId(sysMenu.getId());
        newSysMenu.setName(sysMenu.getName());
        if(sysMenu.getType()==0){
            newSysMenu.setType(0);
            newSysMenu.setParentId(sysMenu.getParentId());
            newSysMenu.setParentName(sysMenu.getParentName());
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setUrl(sysMenu.getUrl());
            newSysMenu.setIcon(sysMenu.getIcon());
        }else if(sysMenu.getType()==1){
            if(sysMenu.getParentId()!=0){
                QueryWrapper<SysMenu> qw = new QueryWrapper<>();
                qw.eq("id", sysMenu.getParentId());
                sysMenuMapper.selectOne(qw);
                newSysMenu.setParentId(sysMenu.getParentId());
                newSysMenu.setParentName(sysMenuMapper.selectOne(qw).getName());
            }else{
                newSysMenu.setParentId(0L);
                newSysMenu.setParentName("顶级菜单");
            }
            newSysMenu.setType(1);
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setUrl(sysMenu.getUrl());
            newSysMenu.setFilePath(sysMenu.getFilePath());
            newSysMenu.setIcon(sysMenu.getIcon());
            newSysMenu.setColor(sysMenu.getColor());
        }else if(sysMenu.getType()==2){
            QueryWrapper<SysMenu> qw = new QueryWrapper<>();
            qw.eq("id", sysMenu.getParentId());
            sysMenuMapper.selectOne(qw);
            newSysMenu.setType(2);
            newSysMenu.setParentId(sysMenu.getParentId());
            newSysMenu.setParentName(sysMenuMapper.selectOne(qw).getName());
            newSysMenu.setOrderNum(sysMenu.getOrderNum());
            newSysMenu.setPerms(sysMenu.getPerms());
        }
        return sysMenuMapper.updateById(newSysMenu);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteMenu(int id) {
        return sysMenuMapper.deleteById(id);
    }

    @Override
    public List<SelectModel> getCatalogueData() {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("type", 0).orderByAsc("order_num");
        List<SysMenu> sysMenuList=sysMenuMapper.selectList(qw);
        List<SelectModel> selectModelList=new ArrayList<>();
//        加入顶级菜单
        SelectModel s=new SelectModel();
        s.setLabel("顶级菜单");
        s.setValue("0");
        selectModelList.add(s);

        for(SysMenu sysMenu : sysMenuList){
            SelectModel selectModel=new SelectModel();
            selectModel.setLabel(sysMenu.getName());
            selectModel.setValue(String.valueOf(sysMenu.getId()));
            selectModelList.add(selectModel);
        }
        return selectModelList;
    }

    @Override
    public List<SelectModel> getMenuData() {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("type", 1).orderByAsc("id");
        List<SysMenu> sysMenuList=sysMenuMapper.selectList(qw);
        List<SelectModel> selectModelList=new ArrayList<>();
        for(SysMenu sysMenu : sysMenuList){
            SelectModel selectModel=new SelectModel();
            selectModel.setLabel(sysMenu.getName());
            selectModel.setValue(String.valueOf(sysMenu.getId()));
            selectModelList.add(selectModel);
        }
        return selectModelList;
    }

    @Override
    public Boolean checkMenuName(String name) {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("name", name).orderByAsc("id");
        List<SysMenu> sysMenuList = sysMenuMapper.selectList(qw);
        return !sysMenuList.isEmpty();
    }

    @Override
    public Boolean checkMenuUrl(String url) {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("url", url).orderByAsc("id");
        List<SysMenu> sysMenuList = sysMenuMapper.selectList(qw);
        return !sysMenuList.isEmpty();
    }

    @Override
    public Boolean checkFilePath(String filePath) {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("file_path", filePath).orderByAsc("id");
        List<SysMenu> sysMenuList = sysMenuMapper.selectList(qw);
        return !sysMenuList.isEmpty();
    }

    @Override
    public Boolean checkMenuPerms(String perms) {
        QueryWrapper<SysMenu> qw = new QueryWrapper<>();
        qw.eq("perms", perms).orderByAsc("id");
        List<SysMenu> sysMenuList = sysMenuMapper.selectList(qw);
        return !sysMenuList.isEmpty();
    }

    private void findChildren(List<SysMenu> SysMenus, List<SysMenu> menus, int menuType) {
        for (SysMenu SysMenu : SysMenus) {
            List<SysMenu> children = new ArrayList<>();
            for (SysMenu menu : menus) {
                if (menuType == 1 && menu.getType() == 2) {
                    // 如果是获取类型不需要按钮，且菜单类型是按钮的，直接过滤掉
                    continue;
                }
                if (SysMenu.getId() != null && SysMenu.getId().equals(menu.getParentId())) {
                    menu.setParentName(SysMenu.getName());
                    menu.setLevel(SysMenu.getLevel() + 1);
                    if (!exists(children, menu)) {
                        children.add(menu);
                    }
                }
            }
            SysMenu.setChildren(children);
            children.sort((o1, o2) -> o1.getOrderNum().compareTo(o2.getOrderNum()));
            findChildren(children, menus, menuType);
        }
    }

    private boolean exists(List<SysMenu> sysMenus, SysMenu sysMenu) {
        boolean exist = false;
        for (SysMenu menu : sysMenus) {
            if (menu.getId().equals(sysMenu.getId())) {
                exist = true;
            }
        }
        return exist;
    }

    @Override
    public List<SysMenu> getAllMenu() {
        //查询目录,菜单和按钮
        String[] type = {"0", "1", "2"};
        List<String> strings = Arrays.asList(type);
        //构造查询条件
        QueryWrapper<SysMenu> query = new QueryWrapper<>();
        query.lambda().in(SysMenu::getType, strings).orderByAsc(SysMenu::getOrderNum);
        List<SysMenu> menus = this.baseMapper.selectList(query);
        //组装顶级菜单（默认）
        SysMenu menu = new SysMenu();
        menu.setId(0L);
        menu.setParentId(-1L);
        menu.setName("顶级菜单");
        menus.add(menu);
        //组装树数据
        return MakeMenuTree.makeTree(menus, -1L);
    }
}
