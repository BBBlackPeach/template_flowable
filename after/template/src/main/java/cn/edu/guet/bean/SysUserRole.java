package cn.edu.guet.bean;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author 陶祎祎
 */
@Data
@TableName("sys_user_role")
public class SysUserRole extends BaseModel {

    private Long userId;

    private Long roleId;

}