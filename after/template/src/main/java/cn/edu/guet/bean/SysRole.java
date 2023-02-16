package cn.edu.guet.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author Liwei
 * @Date 2021-08-13 17:38
 */
@Data
@TableName("sys_role")
public class SysRole extends BaseModel {

    private String name;

    private String remark;

    private int userExistFlag;

    private Byte delFlag;

}