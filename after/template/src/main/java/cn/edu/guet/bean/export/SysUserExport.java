package cn.edu.guet.bean.export;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.edu.guet.bean.BaseModel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 陶祎祎
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user")
public class SysUserExport extends BaseModel {

    @Excel(name = "用户名")
    private String name;

    @Excel(name = "姓名")
    private String nickName;

    @Excel(name = "性别")
    private String sex;

    private Date birthday;

    @Excel(name = "出生日期",width = 14)
    @TableField(exist = false)
    private String birthdayStr;

    @Excel(name = "年龄")
    @TableField(exist = false)
    private Integer age;

    @Excel(name = "手机号码",width = 18)
    private String mobile;

    @Excel(name = "身份证号码",width = 24)
    private String identity;

    @Excel(name = "家庭住址",width = 40)
    private String homeAddress;

}
