package cn.edu.guet.service;


import cn.edu.guet.bean.SysMenu;
import cn.edu.guet.bean.SysUser;
import cn.edu.guet.bean.common.SelectModel;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


/**
 * @author 陶祎祎
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     * 查询菜单树,用户ID和用户名为空则查询全部
     * @param menuType 0：获取所有菜单，包含按钮，1：获取所有菜单，不包含按钮
     * @param userName
     * @return
     */
    List<SysMenu> getMenuTree(String userName, int menuType);

    /**
     * 根据用户名查找菜单列表
     * @param userName
     * @return
     */
    List<SysMenu> findByUser(String userName);

    List<SysMenu> getMenuList();
    int addMenu(SysMenu sysMenu);
    int updateMenu(SysMenu sysMenu);
    int deleteMenu(int id);

//    获取为目录的
    List<SelectModel> getCatalogueData();
//    获取为菜单的
    List<SelectModel> getMenuData();

    Boolean checkMenuName(String name);
    Boolean checkMenuUrl(String url);
    Boolean checkFilePath(String filePath);
    Boolean checkMenuPerms(String perms);

    List<SysMenu> getAllMenu();
}
