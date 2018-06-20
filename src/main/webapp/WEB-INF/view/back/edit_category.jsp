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
		$(".tdBtn").click(function(){
			var formData = $("form").serialize();
			$.ajax({
				url:'${basePath}/category/doModify',
				type:'post',
				data:formData,
				success:function(data){
					if(data){
						alert("修改分类成功")
						location="${basePath}/category/doFindPwd1"
					}else{
						alert("修改失败")
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
    <span class="modular fl"><i></i><em>修改分类</em></span>
  </div>
  <form action="">
  <input type="hidden" name="categoryId" value="${category.categoryId }"/>
  <table class="list-style">
   <tr>
    <td style="text-align:right;width:15%;">分类Id：</td>
    <td>
     ${category.categoryId }
    </td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">分类名称：</td>
    <td>
     <input type="text" value="${category.categoryName }" name="categoryName" class="textBox"/>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;width:10%;">上级分类：</td>
    <td>
     <select class="textBox" name="parentId" >
      <option value="0">顶级分类</option>
      <c:forEach items="${all}" var="c">
      	<option value="${c.categoryId}" <c:if test="${c.categoryId eq category.categoryId }">selected</c:if> >${c.categoryName }</option>
      </c:forEach>
     </select>
    </td>
   </tr>
     
  <!--  <tr>
    <td style="text-align:right;">分类页面描述：</td>
    <td>
     <textarea class="textarea"></textarea>
    </td>
   </tr> -->
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="button" value="保存" class="tdBtn"/></td>
   </tr>
  </table>
  </form>
 </div>
</body>
</html>