<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑商铺资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	//用来限制表单提交的条件，只有条件符合才可提交
	//var flag=false;

	$(function(){
		// 开始先隐藏错误信息
		//$("#errMsg").hide()	;
		
		// 更改保存按钮事件
		$(".tdBtn").click(function(){
			//checkManagerId($("input[name='managerId']")[0]);
			
			var formData = $("form").serialize();
			$.ajax({
				type:'post',
				url:'${basePath}/store/doModify',
				data:formData,
				success:function(data){
					if(data.result){
						alert("修改成功")
						location="${basePath}/store/find"
					}else{
						alert("修改失败，请检查您输入的的信息")
					}
				}
			})
		})
		
		// ajax验证输入的管理员id是否存在
		/*  $("input[name='managerId']").blur(function(){
			 checkManagerId(this);
		 }) */
	})
	
	function checkManagerId(obj){
		 var managerId=$(obj).val();
		 if(managerId){
			 $.post("${basePath}/store/checkManagerId",{id:managerId},function(data){
				 if(!data){
					 $("#errMsg").show();
					 flag=false;
				 }else{
					 $("#errMsg").hide();
					 flag=true;
				 }
			 })
		 }
	}
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="edit_user"></i><em>编辑店铺资料</em></span>
  </div>
  <form action="">
  <input type="hidden" name="storeId" value="${store.storeId}"/>
	  <table class="list-style">
	   <tr>
	    <td style="width:15%;text-align:right;">店铺名：</td>
	    <td><input type="text" class="textBox length-middle" value="${store.storeName}" name="storeName"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">地址：</td>
	    <td><input type="text" class="textBox length-middle" name="storeAdd" value="${store.storeAdd }"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">联系方式：</td>
	    <td><input type="text" class="textBox length-middle" name="phone" value="${store.phone}"/></td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">店铺状态：</td>
	    <td>
	     <select class="textBox" name="status">
	      <option value="0" <c:if test="${store.status eq 0}">selected</c:if>>正常</option>
	      <option value="1" <c:if test="${store.status eq 1}">selected</c:if>>暂时关闭</option>
	     </select>
	    </td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">管理员id：</td>
	    <td>
	     ${store.managerId}
	     </td>
	   </tr>
	   <tr>
	    <td style="text-align:right;">修改管理员id：</td>
	    <td>
	     <select class="textBox" name="managerId">
	     <c:forEach items="${admins}" var="admin">
	      <option value="${admin.adminId }" >${admin.adminId}--${admin.adminCode }</option>
	     </c:forEach>
	     </select>
	     </td>
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