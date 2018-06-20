package com.skycat.admin;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.admin.dao.AdminMapper;
import com.skycat.admin.entity.Admin;
import com.skycat.admin.service.AdminService;
import com.skycat.base.BaseTest;
import com.skycat.privilege.dao.PrivilegeMapper;
import com.skycat.privilege.entity.Privilege;
import com.skycat.role.dao.RoleMapper;
import com.skycat.role.entity.Role;
import com.skycat.user.info.util.MD5Utils;

public class TestAdmin extends BaseTest{

	@Autowired
	AdminService adminService;
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	PrivilegeMapper privilegeMapper;
	
	@Test
	public void test1() {
		List<Admin> list = adminService.selectValid();
		System.out.println(list);
	}
	
	@Test
	public void test2() {
		System.out.println(MD5Utils.getPwd("111"));
	}
	
	@Test
	public void test3() {
		Admin admin = new Admin();
		admin.setAdminCode("admin");
		admin.setAdminPassword("admin");
		admin=adminService.loginAdmin(admin);
		System.out.println(admin);
		System.out.println(admin.getStoreId());
	}
	
	@Test
	public void testRole() {
		List<Role> roles = roleMapper.selectRolesByAdminId(11);
		List<Privilege> privileges = privilegeMapper.selectPrivilegesByRoleId(2);
		
		System.out.println(roles);
		System.out.println(privileges);
	}
	
	@Test
	public void testSelectAll() {
		List<Admin> list = adminService.selectAll();
		System.out.println(list);
	}
	
}
