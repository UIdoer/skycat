package com.skycat.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycat.admin.entity.Admin;
import com.skycat.admin.exception.NotStoreManagerException;
import com.skycat.admin.service.AdminService;
import com.skycat.base.entity.ResultObject;
import com.skycat.role.entity.Role;
import com.skycat.user.info.util.MD5Utils;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	AdminService adminService;

	/**
	 * 查询所有管理员
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("find")
	@RequiresRoles("systemManager")
	public String findAdmin(ModelMap map) {
		List<Admin> list = adminService.selectAll();
		map.put("admins", list);
		return "back/admin_list";
	}

	/**
	 * 跳转到添加管理员的页面
	 * 
	 * @return
	 */
	@RequestMapping("toAdd")
	@RequiresRoles("systemManager")
	public String toAdd() {
		return "back/add_admin";
	}

	/**
	 * 执行添加一个管理员的逻辑
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping("doAdd")
	@RequiresRoles("systemManager")
	@ResponseBody
	public String doAdd(Admin admin,String adminRole) {
		Role role = new Role();
		role.setRoleId(Integer.valueOf(adminRole));
		ArrayList<Role> roles = new ArrayList<Role>();
		roles.add(role);
		admin.setRoles(roles);
		int i = adminService.insertSelective(admin);
		if (i > 0) {
			return "success";
		}
		return null;
	}

	/**
	 * 使用AdminCode来查询是否有以及存在的admin
	 * 
	 * @param adminCode
	 * @return
	 */
	@RequestMapping("findAdminByCode")
	@ResponseBody
	public String findAdminByCode(String adminCode) {
		Admin admin = adminService.selectByAdminCode(adminCode);
		// 如果amdin不为空代表存在这个code的admin所以返回null
		if (null != admin) {
			return null;
		}
		return "success";
	}

	/*@RequestMapping("toLogin")
	public String toLogin() {
		return "back/adminLogin";
	}*/

	/**
	 * 执行登录逻辑， 如果admin的storeId为空的话说明这个amdin没有管理店铺或者他是一个系统管理员
	 * admin的adminRole为1时表示他是店铺管理员，2表示是系统管理员
	 * 
	 * @param admin
	 *            页面封装的amdin对象 包含用户名和密码
	 * @param session
	 *            用于在登录成功后，将admin射到session中保存登录状态
	 * @param response
	 *            用于设置cookie保存登录名
	 * @return
	 */
	@RequestMapping("doLogin")
	@ResponseBody
	public ResultObject doLogin(Admin admin) {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(admin.getAdminCode(), admin.getAdminPassword());

		try {
			subject.login(token);
		} catch(NotStoreManagerException nsme) {
			return new ResultObject(null, "您还没有管理的店铺哦");
		}catch (AuthenticationException e) {
			e.printStackTrace();
			return new ResultObject(null, "用户名或密码错误");
		} 
		{
			
		}
		// response.addCookie(new Cookie("adminCode", admin.getAdminCode()));

		return new ResultObject(admin, "success");
	}

	@RequestMapping("doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "success";
	}

	/**
	 * 在页面点击清除缓存的时候清除cookie中保存的adminCode
	 * 
	 * @param requset
	 * @param response
	 * @return
	 */
	@RequestMapping("removeCookie")
	@ResponseBody
	public String removeCookie(HttpServletRequest requset, HttpServletResponse response) {
		Cookie[] cookies = requset.getCookies();
		for (Cookie cookie : cookies) {
			if ("adminCode".equals(cookie.getName())) {
				cookie.setValue(null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				return "success";
			}
		}
		return null;
	}

	@RequestMapping("toModifyPwd")
	@RequiresRoles("systemManager")
	public String toModifyPwd(String id, ModelMap map) {
		map.put("adminId", id);
		return "back/edit_admin";
	}

	@RequestMapping("doModifyPwd")
	@RequiresRoles("systemManager")
	@ResponseBody
	public String doModifyPwd(Admin admin) {
		admin.setAdminPassword(MD5Utils.getPwd(admin.getAdminPassword()));
		int i = adminService.updateByPrimaryKeySelective(admin);
		if (i > 0) {
			return "success";
		}
		return null;
	}
}
