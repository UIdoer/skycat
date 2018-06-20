<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="nofollow" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<style>
body {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: url(${basePath }/static/back/images/pc_loginBg.jpg) no-repeat;
	background-size: cover;
	position: absolute;
}
</style>
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/Particleground.js"></script>
<script>
	$(document).ready(function() {
		$('body').particleground({
			dotColor : 'green',
			lineColor : '#c9ec6e'
		});
		$('.intro').css({
			'margin-top' : -($('.intro').height() / 2)
		});
		$(".loginform input[type='button']").click(function() {
			var aname = $(".loginform input[type='text']").val();
			var apwd = $(".loginform input[type='password']").val();
			$.post("${basePath}/admin/doLogin", {
				adminCode : aname,
				adminPassword : apwd
			}, function(data) {
				//var obj=eval("("+data+")");
				if (data.result) {
					location.href = "${basePath}/base/toIndex";
				} else {
					/* $(".loginform input[type='text']").val("");
					$(".loginform input[type='text']").attr('placeholder',obj.msg); */
					$(".loginform input[type='password']").val("");
					$(".loginform input[type='button']").val(data.msg);
				}
			});

		});
	});
</script>
</head>
<body>
	<section class="loginform">
	<h1>后台管理系统</h1>
	<ul>
		<li><label>账号：</label> <input type="text" class="textBox"	placeholder="管理员账号" value="${cookie.adminCode.value }"/></li>
		<li><label>密码：</label> <input type="password" class="textBox"	placeholder="登陆密码" /></li>
		<li><input type="button" value="立即登陆" /></li>
	</ul>
	</section>
</body>
</html>