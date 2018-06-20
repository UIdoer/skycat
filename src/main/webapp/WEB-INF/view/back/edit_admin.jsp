<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新增产品分类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script>
	$(function(){
		$("#ckPwd~span").hide();
		$(".tdBtn").click(function(){
			var pwd=$("#pwd").val();
			var ckPwd=$("#ckPwd").val();
			if(pwd==ckPwd){
				$("#ckPwd~span").hide();
				var formData = $("form").serialize();
				$.ajax({
					url:'${basePath}/admin/doModifyPwd',
					type:'post',
					data:formData,
					success:function(data){
						if(data){
							alert("修改密码成功")
							location="${basePath}/admin/find"
						}else{
							alert("修改失败")
						}
					}
				})
			}else{
				$("#ckPwd~span").show();
			}
		})
	})
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>修改分类</em></span>
  </div>
  <form action="">
  <table class="list-style">
   <tr>
    <td style="text-align:right;width:15%;">管理员Id：</td>
    <td>
     <input type="text" readonly="true" name="adminId" value="${adminId }"/>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">新密码：</td>
    <td>
     <input type="password" name="adminPassword" id="pwd" class="textBox"/>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">确认新密码：</td>
    <td>
     <input type="password" id="ckPwd" class="textBox"/>
     <span style="color:red">两次输入不一致</span>
    </td>
   </tr>

   <tr>
    <td style="text-align:right;"></td>
    <td><input type="button" value="保存" class="tdBtn"/></td>
   </tr>
  </table>
  </form>
 </div>
</body>
</html>