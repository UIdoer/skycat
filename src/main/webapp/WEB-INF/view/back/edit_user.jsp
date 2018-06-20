<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑会员资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#ckPwd~span").hide()
		// 实时验证两次密码十分钟相等
		$("#ckPwd").blur(function(){
			var pwd=$("#pwd").val();
			var ckPwd=$(this).val();
			if(pwd!=ckPwd){
				$("#ckPwd~span").show();
			}else{
				$("#ckPwd~span").hide();
			}
		})
		
		// 更改保存按钮事件
		$(".tdBtn").click(function(){
			var pwd=$("#pwd").val();
			if(pwd){
				var ckPwd=$("#ckPwd").val();
				if(pwd!=ckPwd){
					alert("两次输入密码不一致哦")
					return;
				}
			}
			
			var formData = $("form").serialize();
			$.ajax({
				type:'post',
				url:'${basePath}/user/doModify',
				data:formData,
				success:function(data){
					if(data.result){
						alert("修改成功")
					}else{
						alert("修改失败，请检查您输入的信息或联系系统管理员")
					}
				}
			})
		})
	})
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="edit_user"></i><em>编辑会员资料</em></span>
  </div>
  <form action="">
  <input type="hidden" name="userId" value="${user.userId }"/>
	  <table class="list-style">
	   <tr>
	    <td style="width:15%;text-align:right;">会员名：</td>
	    <td><input type="text" class="textBox length-middle" value="${user.userName }" name="userName"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">电子邮件：</td>
	    <td><input type="text" class="textBox length-middle" name="email" value="${user.email }"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">手机号码：</td>
	    <td><input type="text" class="textBox length-middle" name="telephone" value="${user.telephone }"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">账号状态：</td>
	    <td>
	     <select class="textBox" name="status">
	      <option value="0" <c:if test="${user.status eq 0}">selected</c:if>>正常</option>
	      <option value="1" <c:if test="${user.status eq 1}">selected</c:if>>冻结</option>
	      <option value="2" <c:if test="${user.status eq 2}">selected</c:if>>封禁</option>
	     </select>
	    </td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">重置密码：</td>
	    <td><input type="password" class="textBox length-middle" name="userPassword" id="pwd"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">确认密码：</td>
	    <td><input type="password" class="textBox length-middle" id="ckPwd" /><span style="color:red">两次输入不一致哦</span></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;"></td>
	    <td><input type="button" class="tdBtn" value="更新保存"/></td>
	   </tr>
	  </table>
  </form>
 </div>
</body>
</html>