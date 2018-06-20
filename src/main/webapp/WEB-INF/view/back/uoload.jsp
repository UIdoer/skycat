<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${basePath }/storeGood/insertGoood" enctype="multipart/form-data" method="post">
上传文件1：<input type="file" name="files"/>
上传文件2：<input type="file" name="files"/>
上传文件3：<input type="file" name="files"/>
<input type="submit" />
</form>


</body>
</html>