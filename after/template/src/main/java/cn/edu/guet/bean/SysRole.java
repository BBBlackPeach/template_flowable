package cn.edu.guet.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author 陶祎祎
 */
@Data
@TableName("sys_role")
public class SysRole extends BaseModel {

    private String name;

    private String remark;

    private int userExistFlag;

    private Byte delFlag;

}