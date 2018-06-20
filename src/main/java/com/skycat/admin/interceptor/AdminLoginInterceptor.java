package com.skycat.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.skycat.admin.entity.Admin;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Admin admin= (Admin) session.getAttribute("currAdmin");
		if(admin!=null) {
			return true;
		}
		//response.sendRedirect(request.getContextPath()+"/admin/toLogin");
		response.getWriter().write("<script>top.location='/skycat/admin/toLogin'</script>");
		return false;
	}

}
