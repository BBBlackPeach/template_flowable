package cn.edu.guet.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author 陶祎祎
 */
@Data
@TableName("sys_role_menu")
public class SysRoleMenu extends BaseModel {

    private Long roleId;

    private Long menuId;

}