<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理员列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>管理员列表</em></span>
    <span class="modular fr"><a href="${basePath}/admin/toAdd" class="pt-link-btn">+添加管理员</a></span>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>管理员id</th>
    <th>管理员code</th>
    <th>管理员角色</th>
    <th>操作</th>
   </tr>
   <c:forEach items="${admins}" var="item">
	   <tr>
	    <td>${item.adminId }</td>
	    <td>${item.adminCode }</td>
	    <td>
	    	<c:forEach items="${item.roles}" var="role" varStatus="i">
		    	<c:if test="${role.roleId eq 1}">店铺管理员</c:if> 
		    	<c:if test="${role.roleId eq 2}">系统管理员</c:if> 
		    	<c:if test="${!i.last }">,</c:if>
	    	</c:forEach>
	    </td>
	    <td><a href="${basePath}/admin/toModifyPwd?id=${item.adminId}">修改密码</a></td>
	   </tr>
   </c:forEach>
  </table>
 </div>
</body>
</html>