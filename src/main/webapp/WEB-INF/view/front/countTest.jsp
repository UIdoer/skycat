<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 						<c:forEach begin="1" end="5" step="1" varStatus="imgCount">
                    	<c:set var="sysVar" value="img${imgCount.count}" ></c:set> 
                    	
                		<span>"${good.img+1}"</span>
                     </c:forEach>
</body>
</html>