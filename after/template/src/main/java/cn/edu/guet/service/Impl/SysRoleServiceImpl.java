package cn.edu.guet.service.Impl;


import cn.edu.guet.bean.SysRole;
import cn.edu.guet.bean.common.SelectModel;
import cn.edu.guet.mapper.SysRoleMapper;
import cn.edu.guet.service.SysRoleService;
import cn.edu.guet.util.SecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static cn.edu.guet.util.ImageUtils.deleteImages;

/**
 * @author 陶祎祎
 */
@Service
@AllArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

	private SysRoleMapper sysRoleMapper;

	@Override
	public Page<SysRole> getRoleList(int currentPage, int pageSize) {
		QueryWrapper<SysRole> qw = new QueryWrapper<>();
		qw.orderByAsc("create_time", "id");
		Page<SysRole> page = new Page<>(currentPage, pageSize);
		page = sysRoleMapper.selectPage(page, qw);
		return page;
	}

	@Override
	public Page<SysRole> searchRole(int currentPage, int pageSize, String searchWord) {
		QueryWrapper<SysRole> qw = new QueryWrapper<>();
		qw.like("name", searchWord).or().like("remark", searchWord)
				.orderByAsc("create_time", "id");
		Page<SysRole> page = new Page<>(currentPage, pageSize);
		page = sysRoleMapper.selectPage(page, qw);
		return page;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int addRole(SysRole sysRole) {
		sysRole.setCreateBy(SecurityUtils.getUsername());
		sysRole.setLastUpdateBy(SecurityUtils.getUsername());
		int result = sysRoleMapper.insert(sysRole);
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateRole(SysRole sysRole) {
		sysRole.setLastUpdateBy(SecurityUtils.getUsername());
		return sysRoleMapper.updateById(sysRole);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteRole(int id) {
		return sysRoleMapper.deleteById(id);
	}

	@Override
	public Boolean checkRoleName(String name) {
		QueryWrapper<SysRole> qw = new QueryWrapper<>();
		qw.eq("name", name).orderByAsc("create_time","id");
		List<SysRole> sysRoleList = sysRoleMapper.selectList(qw);
		return !sysRoleList.isEmpty();
	}

	@Override
	public List<SelectModel> getRoleSelect() {
		QueryWrapper<SysRole> qw = new QueryWrapper<>();
		qw.orderByAsc("create_time","id");
		List<SysRole> sysRoleList=sysRoleMapper.selectList(qw);
		List<SelectModel> selectModelList=new ArrayList<>();
		for(SysRole sysRole : sysRoleList){
			SelectModel selectModel=new SelectModel();
			selectModel.setLabel(sysRole.getName());
			selectModel.setValue(String.valueOf(sysRole.getId()));
			selectModelList.add(selectModel);
		}
		return selectModelList;
	}
	
}
