package cn.edu.guet.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

/**
 * @author 陶祎祎
 */
@Data
@TableName("sys_menu")
public class SysMenu extends BaseModel {

    private String name;

    private Long parentId;

    private String parentName;

    private String url;

    private String filePath;

    private String perms;

    private Integer type;

    private String icon;

    private String color;

    private Integer orderNum;

    private Byte delFlag;

    // 非数据库字段
    @TableField(exist = false)
    private Integer level;
    // 非数据库字段
    @TableField(exist = false)
    private List<SysMenu> children;

    @TableField(exist = false)
    private Boolean open;
    

}