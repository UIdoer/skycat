package com.skycat.admin.realm;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.skycat.admin.entity.Admin;
import com.skycat.admin.exception.NotStoreManagerException;
import com.skycat.admin.service.AdminService;
import com.skycat.privilege.entity.Privilege;
import com.skycat.role.entity.Role;

/**
 * 自定义realm方便自定义处理权限控制
 * @author Administrator
 *
 */
public class CustomAuthenRelam extends AuthorizingRealm{

	@Autowired
	AdminService adminService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info=null;
		Admin admin=(Admin)principals.fromRealm(getName()).iterator().next();
		if(admin!=null) {
			info=new SimpleAuthorizationInfo();
			List<Role> roles = admin.getRoles();
			if(roles!=null && roles.size()>0) {
				List<String> roleNames = new ArrayList<>();
				Set<String> privilegeNames = new HashSet<>();
				
				for (Role role : roles) {
					roleNames.add(role.getRoleName());
					List<Privilege> privileges = role.getPrivileges();
					if(privileges!=null && privileges.size()>0) {
						for (Privilege privilege : privileges) {
							privilegeNames.add(privilege.getName());
						}
					}
				}
				// 添加到授列表
				info.addRoles(roleNames);
				info.addStringPermissions(privilegeNames);
			}
		}
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 从request监听器中拿到当前请求进而拿到session
		ServletRequestAttributes attriubtes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attriubtes.getRequest();
		HttpServletResponse response = attriubtes.getResponse();
		HttpSession session = request.getSession();
		
		SimpleAuthenticationInfo info=null;
		// 获取controller中生成的token
		String username=(String) token.getPrincipal();
		String password=String.valueOf((char[])token.getCredentials());
		Admin admin = new Admin();
		admin.setAdminCode(username);
		admin.setAdminPassword(password);
		
		admin = adminService.loginAdmin(admin);
		if(admin!=null) {
			List<Role> roles = admin.getRoles();
			for (Role role : roles) {
				// 有店铺管理员的身份
				if(role.getRoleId()==1) {
					// sb玩意，null就是null你怎么还给整成null字符串了呢
					if("null".equals(admin.getStoreId()) ||admin.getStoreId()==null) {
						// 店铺管理员没有管理的店铺
						throw new NotStoreManagerException();
					}
				}
			}
			
			info=new SimpleAuthenticationInfo(admin,token.getCredentials(),getName());
			// 吧admin放进session
			session.setAttribute("currAdmin", admin);
			// 把当前管理员的role身份放进session
			session.setAttribute("currAdminRole", roles.get(0).getRoleId());
			// 记住登录名
			Cookie cookie = new Cookie("adminCode", admin.getAdminCode());
			// 设置为项目目录，防止webapp下的jsp页面读取不到cookie
			cookie.setPath("/skycat/");
			response.addCookie(cookie);
		}else {
			throw new AuthenticationException("incorrect username or password");
		}
		return info;
	}

}
