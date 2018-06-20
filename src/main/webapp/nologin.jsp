<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${basePath }/static/back/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		var flag=2;
		window.setInterval(function(){$("span").html(flag--);},1000);
		var t = setTimeout("top.location='${basePath}/adminLogin.jsp'",2100);
	})
</script>
</head>
<body>
	<h1>登录状态失效，<span>3</span>秒后跳转登录页~</h1>
</body>
</html>