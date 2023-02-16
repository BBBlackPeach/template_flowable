package cn.edu.guet.bean;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author Liwei
 * @Date 2021-08-13 17:43
 */
@Data
@TableName("sys_user_role")
public class SysUserRole extends BaseModel {

    private Long userId;

    private Long roleId;

}