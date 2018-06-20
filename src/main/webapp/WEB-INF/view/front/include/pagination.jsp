<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<link type="text/css" rel="stylesheet" href="${sourcePath}/css/pagination.css" />
<script>
	$(function(){
		$(".pagination input").bind("click",function(){
			$("input[name='pageNum']").val($(this).attr("data-pagenum"));
			console.log($(this));
			$("#form").submit();
		});
	});
</script>
<input type="hidden" name="pageNum" />
<ul class="pagination">
	<p class="first" data-pagenum="1">首页</p>
	<p class="prev" data-pagenum="${page.pageNum-1<0?1:page.pageNum}">上一页</p>
	<b class="btns">
		<c:forEach items="${page.navigatepageNums}" var="n">
		<li data-pagenum="${n}">${n }</li>
		</c:forEach>
	</b>
	<p class="next" data-pagenum="${page.pageNum+1>page.pages?page.pages:page.pageNum+1 }">下一页</p>
	<p class="last" data-pagenum="${page.pages}">尾页</p>
	
	<select class="pageSize" >
		<option value="10">每页10行</option>
		<option value="15">每页15行</option>
		<option value="20">每页20行</option>
	</select>
	<p>
		共${page.pages}页
	</p>
</ul>