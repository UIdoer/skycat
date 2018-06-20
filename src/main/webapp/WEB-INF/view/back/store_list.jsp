<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${basePath}/static/back/js/public.js"></script>
<script src="${basePath}/static/back/js/jqpaginator.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script>
	$(function(){
		// 查询按钮
		$(".tdBtn:eq(0)").click(function(){
			// 如果是条件搜索，自动到第一页，提交带条件的表单
			findPage(1);
		})
		
		// 清除按钮
		$(".tdBtn:eq(1)").click(function(){
			$("select option:eq(0)").removeAttr('selected')
			$("select option:eq(0)").attr('selected','true')
			$("input[name='storeName']").val('')
		})
	})
	
	function findPage(pageNum){
		$("input[name='pageNum']").val(pageNum);
		$("form").submit()
	}
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>商铺列表</em></span>
    <!-- <span class="modular fr"><a href="add_user.html" class="pt-link-btn">+添加新会员</a></span> -->
  </div>
  <div class="operate">
   <form method="post" action="${basePath}/store/find">
   <input type="hidden"  value="${condition.pageNum }" name="pageNum"/>
    状态：<select class="inline-select" name="status">
	 <c:if test="${condition.status eq -1 }">selected</c:if>
     <option value="-1" <c:if test="${condition.status eq -1 }">selected</c:if>>全部</option>
     <option value="0" <c:if test="${condition.status eq 0 }">selected</c:if>>正常营业</option>
     <option value="1" <c:if test="${condition.status eq 1 }">selected</c:if>>暂停营业</option>
    </select>
    <input type="text" class="textBox length-long" value="${condition.storeName }" name="storeName" placeholder="输入店铺名..."/>
    <input type="button" value="查询" class="tdBtn"/>
    <input type="button" value="清除" class="tdBtn"/>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
     <th>编号</th>
     <th>店铺名</th>
     <th>地址</th>
     <th>联系方式</th>
     <th>好评分</th>
     <th>店铺状态</th>
     <th>管理员id</th>
     <th>操作</th>
   </tr>
   <c:forEach items="${page.list}" var="item">
	   <tr>
	    <td>
	     <!-- <input type="checkbox"/> -->
	     <span class="middle">${item.storeId }</span>
	    </td>
	    <td class="center">${item.storeName }</td>
	    <td class="center">
		    ${item.storeAdd }
	    </td>
	    <td class="center">${item.phone }</td>
	    <td class="center">${item.grade }</td>
	    <c:choose>
	    	<c:when test="${item.status eq 0 }">
	    		<td class="center"><img src="${basePath}/static/back/images/yes.gif"/>正常营业</td>
	    	</c:when>
	    	<c:when test="${item.status eq 1 }">
	    		<td class="center"><img src="${basePath}/static/back/images/no.gif"/>暂停营业</td>
	    	</c:when>
	    </c:choose>
	    <td class="center">${item.managerId }</td>
	    
	   <!--  <td class="center">2015-04-17</td> -->
	    <td class="center">
	     <a href="${basePath}/store/toModify?id=${item.storeId }" class="inline-block" title="编辑"><img src="${basePath}/static/back/images/icon_edit.gif"/></a>
	    <%--  <a href="account.html" class="inline-block" title="资金管理"><img src="${basePath}/static/back/images/icon_account.gif"/></a>
	     <a class="inline-block" title="删除"><img src="${basePath}/static/back/images/icon_drop.gif"/></a> --%>
	    </td>
	   </tr>
   </c:forEach>
   
   
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
      <!-- Operation -->
	  <div class="BatchOperation fl">
	   <!-- <input type="checkbox" id="del"/>
	   <label for="del" class="btnStyle middle">全选</label> -->
	   <!-- <input type="button" value="批量删除" class="btnStyle"/> -->
	  </div>
	  <!-- turn page -->
	  <div class="turnPage center fr">
	   <a href="javascript:;" onclick="findPage(${page.navigateFirstPage})">首页</a>
	   <a href="javascript:;" <c:if test="${page.hasPreviousPage }">onclick="findPage(${page.prePage})"</c:if> >上一页</a>
	   <c:forEach items="${page.navigatepageNums}" var="i"> 
		   <a href="javascript:;" <c:if test="${page.pageNum ne i }">onclick='findPage(${i})'</c:if>  <c:if test="${page.pageNum eq i }">style='color:blue'</c:if>>${i}</a>
	   </c:forEach>
	   <a href="javascript:;" <c:if test="${page.hasNextPage}">onclick="findPage(${page.nextPage})"</c:if>>下一页</a>
	   <a href="javascript:;" onclick="findPage(${page.navigateLastPage})">末页</a>
	  </div>
  </div>
 </div>
</body>
</html>