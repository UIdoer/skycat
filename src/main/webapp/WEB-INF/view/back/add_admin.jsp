<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加新会员</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script>

	var flag=false;
	function checkAdminCode(obj){
		var code=$(obj).val();
		$.post('${basePath}/admin/findAdminByCode',{adminCode:code},function(data){
			if(data){
				$("#errMsg").hide();
				flag=true;
			}else{
				$("#errMsg").show();
				flag=false;
			}
		})
	}

	$(function(){
		$("#errMsg").hide();
		
		// ajax验证是否重名
		$("input[name='adminCode']").blur(function(){
			checkAdminCode(this);
		})
		
		// 提交事件
		$(".tdBtn").click(function(){
			checkAdminCode($("input[name='adminCode']")[0]);
			if(flag){
				var formData = $("form").serialize();
				$.ajax({
					type:'post',
					url:'${basePath}/admin/doAdd',
					data:formData,
					success:function(data){
						if(data){
							alert("添加成功")
							location='${basePath}/admin/find'
						}else{
							alert("请检查输入的信息是否有误")
						}
					}
				})
			}else{
				$("#errMsg").show();
			}
			
		})
	})
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="add_user"></i><em>添加新会员</em></span>
  </div>
  <form action="">
  <table class="list-style">
   <tr>
    <td style="width:15%;text-align:right;">管理员名称：</td>
    <td><input type="text" name="adminCode" class="textBox length-middle"/><span style="color:red" id="errMsg">这个管理员名已经存在了</span></td>
   </tr>
   <tr>
    <td style="text-align:right;">管理员密码：</td>
    <td><input type="text" name="adminPassword" class="textBox length-middle"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">管理员角色：</td>
    <td>
		<select name="adminRole">
			<option value="1">店铺管理员</option>
			<option value="2">系统管理员</option>
		</select>
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