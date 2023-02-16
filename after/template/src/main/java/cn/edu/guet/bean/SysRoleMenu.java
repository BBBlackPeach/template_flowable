package cn.edu.guet.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author Liwei
 * @Date 2021-08-13 17:40
 */
@Data
@TableName("sys_role_menu")
public class SysRoleMenu extends BaseModel {

    private Long roleId;

    private Long menuId;

}