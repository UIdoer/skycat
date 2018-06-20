package com.skycat.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.skycat.user.info.entity.User;

public class UserLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user= (User) session.getAttribute("user");
		// 已登录用户
		if(null!=user) {
			return true;
		}
		
		// 未登录用户
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>location='/skycat/user/toLogin'</script>");
		return false;
	}
}
