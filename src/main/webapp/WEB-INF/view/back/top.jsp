<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script>
	$(function(){
		// 安全退出
		$("#logOut").click(function(){
			$.get('${basePath}/admin/doLogout',function(data){
				if(data){
					top.location='${basePath}/adminLogin.jsp'
				}
			})
		})
		
		// 清除缓存
		$("#removeCookie").click(function(){
			$.post('${basePath}/admin/removeCookie',function(data){
				$("#removeCookie>span").html('清除成功✔');
			})
		})
	})

</script>

</head>
<body>
<div class="header">
 <div class="logo">
  <img src="${basePath }/static/back/images/admin_logo.png" title="在哪儿"/>
 </div>
 <div class="fr top-link">
 <!-- 访问站点即访问前台页面 -->
  <a href="${basePath}/Index" target="_blank" title="访问站点"><i class="shopLinkIcon"></i><span>访问站点</span></a>
  <a href="${basePath}/admin/find" target="mainCont" title="DeathGhost"><i class="adminIcon"></i><span>管理员：${currAdmin.adminCode }</span></a>
  <a href="javascript:;" id="removeCookie" title="修改密码"><i class="clearIcon"></i><span>清除缓存</span></a>
  <!-- <a href="revise_password.html" target="mainCont" title="修改密码"><i class="revisepwdIcon"></i><span>修改密码</span></a> -->
  <a href="javascript:;" id="logOut" title="安全退出" style="background:rgb(60,60,60);"><i class="quitIcon"></i><span>安全退出</span></a>
 </div>
</div>
</body>
</html>