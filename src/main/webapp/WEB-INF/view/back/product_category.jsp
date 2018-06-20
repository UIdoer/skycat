<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品分类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script>
	/* function deleteCategory(id){
		$.post("${basePath}/category/doDelete",{id:id},function(data){
			if(data){
				alert('删除分类成功')
				location='{basePath}/category/find'
			}else{
				alert('删除分类失败')
			}
		})
	} */
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>产品分类</em></span>
    <span class="modular fr"><a href="${basePath}/category/toAdd" class="pt-link-btn">+添加新分类</a></span>
  </div>
  
  <table class="list-style">
   <tr>
    <th>分类名称</th>
    <th>操作</th>
   </tr>
   
   <!-- 遍历输出各个分类 -->
   <c:forEach items="${categories}" var="c">
   	<c:forEach items="${c.categories}" var="cate">
	    <!-- 一级分类 -->
	     <c:if test="${c.level eq 1 }">
		     <tr>
			     <td><span>&gt;${cate.categoryName }</span></td>
		     </tr>
		 </c:if>
		 
		 <!-- 二级分类 -->
		 <c:forEach items="${categories}" var="sc">
		 	<c:if test="${sc.level eq 2 and sc.parentId eq cate.categoryId }">
		 		<c:forEach items="${sc.categories}" var="scate">
				 	 <tr>
					     <td><span>|&gt;&gt;&gt;&gt;${scate.categoryName }</span></td>
					     <td class="center"><a class="block" title="移除" href="${basePath}/category/toModify?id=${scate.categoryId}">修改分类</a></td>
				     </tr>
		 		</c:forEach>
		 	</c:if>
		 </c:forEach>
	
	 </c:forEach>
   </c:forEach>
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
  </div>
 </div>
</body>
</html>