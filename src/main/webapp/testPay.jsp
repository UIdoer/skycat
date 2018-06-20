<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${basePath}/alipay/generatePay" method="post">
	商户订单号：<input name="WIDout_trade_no"><br>
	订单名称：<input name="WIDsubject"><br>
	付款金额：<input name="WIDtotal_amount"><br>
	订单描述：<input name="WIDbody"><br>
	<input type="submit" value="提交订单">
</form>
</body>
</html>