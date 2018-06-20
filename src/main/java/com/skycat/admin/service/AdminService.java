package com.skycat.admin.service;

import java.util.List;

import com.skycat.admin.entity.Admin;
import com.skycat.base.service.BaseService;

public interface AdminService extends BaseService<Admin>{
	/**
	 * 查找当前可用的管理员
	 * @return
	 */
	List<Admin> selectValid();
	
	/**
	 * 使用AdminCode来查询是否有以及存在的admin
	 * @param code
	 * @return
	 */
	Admin selectByAdminCode(String code);
	
	/**
	 * 验证管理员code和密码登录
	 * @param admin
	 * @return
	 */
	Admin loginAdmin(Admin admin);
}
