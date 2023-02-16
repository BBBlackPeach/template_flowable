package cn.edu.guet.mapper;

import cn.edu.guet.bean.SysUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author 陶祎祎
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {
}