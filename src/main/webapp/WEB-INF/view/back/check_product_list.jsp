<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<c:set var="imgPath" value="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath}/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath}/static/back/js/jquery.js"></script>
<script src="${basePath}/static/back/js/public.js"></script>
<script>
	function updateStatus(goodId,oper){
		$.post('${basePath}/checkGood/updateGoodStatus/'+goodId+'/'+oper,{},function(data){
			if(data){
				alert("商品"+goodId+"操作成功")
				location='${basePath}/checkGood/find?pageNum='+${page.pageNum}
			}else{
				alert("商品"+goodId+"操作失败")
			}
		})
	}
	
	function findPage(pageNum){
		location='${basePath}/checkGood/find?pageNum='+pageNum;
	}
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>产品列表</em></span>
    </div>
  <div class="operate">
   
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>ID编号</th>
    <th>产品</th>
    <th>名称</th>
    <th>价格</th>
    <th>店铺</th>
    <th>操作</th>
   </tr>
   
   <c:forEach items="${page.list }" var="good">
   <tr>
    <td>
     <span>
     <!-- <input type="checkbox" class="middle children-checkbox"/> -->
     <i>${good.goodId}</i>
     </span>
    </td>
    <td class="center pic-area"><img src="${imgPath}${good.img1 }" class="thumbnail"/></td>
    <td class="td-name">
      <span class="ellipsis td-name block">${good.goodTitle }</span>
    </td>
    <td class="center">
     <span>
      <i>￥</i>
      <em>${good.defaultPrice }</em>
     </span>
    </td>
    <td class="center">
     <span>
      <em>${storeNames[good.goodId]}</em>
      <i></i>
     </span>
    </td>
    <td class="center">
     <a href="javascript:;" onclick="updateStatus(${good.goodId},1)" title="通过"><img src="${basePath }/static/back/images/yes.gif"/></a>&nbsp;&nbsp;&nbsp;
     <a href="javascript:;" onclick="updateStatus(${good.goodId},2)" title="驳回"><img src="${basePath }/static/back/images/no.gif"/></a>
    </td>
   </tr>
   </c:forEach>
   
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
      <!-- Operation -->
	  <!-- <div class="BatchOperation fl">
	   <input type="checkbox" id="del"/>
	   <label for="del" class="btnStyle middle">全选</label>
	   <input type="button" value="批量删除" class="btnStyle"/>
	  </div> -->
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