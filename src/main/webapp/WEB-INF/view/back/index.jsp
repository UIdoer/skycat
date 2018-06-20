<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<frameset rows="76,*" framespacing="0" border="0">
  <frame src="${basePath }/base/toTop" id="header-frame" name="header-frame" frameborder="no" scrolling="no">
  <frameset cols="180, 10, *" framespacing="0" border="0" id="frame-body">
    <frame src="${basePath }/base/toMenu" frameborder="no" scrolling="yes">
    <frame src="${basePath }/base/toBar" frameborder="no" scrolling="no">
    <frame src="${basePath }/base/toMain" name="mainCont" frameborder="no" scrolling="yes">
  </frameset>
</frameset><noframes></noframes>
</head><div class="menu-footer">© 版权所有 2015 "DeathGhost"</div>
<body>
</body>
</html>