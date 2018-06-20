<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>左侧导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/public.js"></script>
</head>
<body style="background:#313131">
<div class="menu-list">
 <!-- <a href="main.html" target="mainCont" class="block menu-list-title center" style="border:none;margin-bottom:8px;color:#fff;">起始页</a> -->
 <ul>
 
 <li class="menu-list-title" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
   <span>消息推送</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
    <li><a href="${basePath }/message/toSalesPromotionMsg" title="促销消息" target="mainCont">促销消息</a></li>
   </ul>
  </li>
 
  <li class="menu-list-title" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
   <span>订单管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
    <li><a href="${basePath }/store/order/toStoreOrderList?storeId=${currAdmin.storeId}" title="商品列表" target="mainCont">订单列表</a></li>
   </ul>
  </li>
 
  <li class="menu-list-title" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
   <span>商品管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 2}">hidden</c:if>>
    <li><a href="${basePath }/storeGood/accordingStatusFindProduct" title="商品列表" target="mainCont">商品列表</a></li>
   </ul>
  </li>
  
  
   <li class="menu-list-title" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
   <span>系统管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
    <li><a href="${basePath}/checkGood/find" title="站点基本设置" target="mainCont">商品审核</a></li>
   <li><a href="${basePath}/user/find" title="会员列表" target="mainCont">会员管理</a></li>
    <li><a href="${basePath}/store/find" title="商铺列表" target="mainCont">商铺列表</a></li>
    <li><a href="${basePath}/category/find" title="商品分类" target="mainCont">分类管理</a></li>
    <li><a href="${basePath}/admin/find" title="站点基本设置" target="mainCont">管理员管理</a></li>
   </ul>
  </li>
  
  <%-- <li class="menu-list-title" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
   <span>系统设置</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
    <li><a href="basic_settings.html" title="站点基本设置" target="mainCont">站点基本设置</a></li>
    
   </ul>
  </li>
  
  <li class="menu-list-title" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
   <span>广告管理</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children" <c:if test="${currAdminRole eq 1}">hidden</c:if>>
    <li><a href="advertising_list.html" title="站点基本设置" target="mainCont">广告列表</a></li>
   </ul>
  </li> --%>
    
 </ul>
</div>

</body>
</html>