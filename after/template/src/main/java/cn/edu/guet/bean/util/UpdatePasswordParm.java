package cn.edu.guet.bean.util;

import lombok.Data;

/**
 * @author 陶祎祎
 */
@Data
public class UpdatePasswordParm {
    Long id;
    String oldPassword;
    String nickName;
    String identity;
    String firstPassword;
    String secondPassword;
}
