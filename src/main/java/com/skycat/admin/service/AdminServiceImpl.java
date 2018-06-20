package com.skycat.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycat.admin.dao.AdminMapper;
import com.skycat.admin.entity.Admin;
import com.skycat.base.service.AbstractBaseServiceImpl;
import com.skycat.privilege.dao.PrivilegeMapper;
import com.skycat.role.dao.RoleMapper;
import com.skycat.role.entity.Role;
import com.skycat.user.info.util.MD5Utils;

@Service
public class AdminServiceImpl extends AbstractBaseServiceImpl<Admin> implements AdminService{

	@Autowired
	AdminMapper adminMapper;
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	PrivilegeMapper privilegeMapepr;
	
	@Override
	public List<Admin> selectValid() {
		return adminMapper.selectValid();
	}
	
	@Override
	public int insertSelective(Admin record) {
		record.setAdminPassword(MD5Utils.getPwd(record.getAdminPassword()));
		super.insertSelective(record);
		HashMap<String, Integer> param = new HashMap<String,Integer>();
		param.put("adminId", record.getAdminId());
		param.put("adminRole", record.getRoles().get(0).getRoleId());
		return adminMapper.insertAdminRole(param);
	}

	@Override
	public Admin selectByAdminCode(String code) {
		return adminMapper.selectByAdminCode(code);
	}

	@Override
	public Admin loginAdmin(Admin admin) {
		admin.setAdminPassword(MD5Utils.getPwd(admin.getAdminPassword()));
		admin=adminMapper.loginAdmin(admin);
		
		// 如果是店铺管理员，再查一次他管理的店铺的id
		if(admin!=null ) {
			List<Role> roles = roleMapper.selectRolesByAdminId(admin.getAdminId());
			if(roles!=null && roles.size()>0) {
				// admin可能有多个角色，这里查出每个角色的所有权限
				for (Role role : roles) {
					role.setPrivileges(privilegeMapepr.selectPrivilegesByRoleId(role.getRoleId()));
					// 如果admin有role这个角色，将他负责的storeId查出来射进去
					if(role.getRoleId()==1)
						admin.setStoreId(""+adminMapper.selectStoreIdByAdminId(admin.getAdminId()));
				}
				admin.setRoles(roles);
			}
		}
		return admin;
	}
	
	@Override
	public List<Admin> selectAll() {
		// 因需要查出角色信息，所以复写selectAll
		List<Admin> list = adminMapper.selectAll();
		for (Admin admin : list) {
			admin.setRoles(roleMapper.selectRolesByAdminId(admin.getAdminId()));
		}
		
		return list;
	}

}
