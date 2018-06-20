<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>商品详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/public.js"></script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>商品详情</em></span>
    <span class="modular fr"><a href="${basePath }/storeGood/toAddProductCategory?goodId=${goodId}&goodName=${goodName }" class="pt-link-btn">添加规格</a></span>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>ID编号</th>
    <th>名称</th>
    <th>市场价</th>
    <th>库存</th>
    <th>操作</th>
   </tr>
   
   <c:forEach items="${goodList }" var="good">
   <tr>
    <td>
     <span>
     <i>${good.goodPropertyId }</i>
     </span>
    </td>
    <td class="td-name">
      <span class="ellipsis td-name block">${goodName },${good.p1Value },${good.p2Value }</span>
    </td>
    <td class="center">
     <span>
      <i>￥</i>
      <em>${good.price }</em>
     </span>
    </td>
    <td class="center">
     <span>
      <em>${good.stock }</em>
      <i>件</i>
     </span>
    </td>
    
    <td class="center">
     <a href="${basePath }/storeGood/toEditProductCategory?goodPropertyId=${good.goodPropertyId}&goodId=${good.goodId}" title="编辑"><img src="${basePath }/static/back/images/icon_edit.gif"/></a>
    </td>
   </tr>
   </c:forEach>
   
  </table>
  <!-- BatchOperation -->
 </div>
</body>
</html>