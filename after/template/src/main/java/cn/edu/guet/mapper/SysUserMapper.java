package cn.edu.guet.mapper;

import cn.edu.guet.bean.SysUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author 陶祎祎
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    String getNickNameByName(String name);
}