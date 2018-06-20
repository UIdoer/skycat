<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/public.js"></script>

<script type="text/javascript">
function findPage(pageNum,pageSize,status){
	var str2="${status}";
	
	var str="${basePath}/store/order/toStoreOrderList?pageNum="+pageNum+"&pageSize"+pageSize+"&status="+status+"&storeId=${currAdmin.storeId}";
	location=str;
	//console.log(str);
	//console.log(str2);
}

$(function (){
	$("#status").val("${status}");
});
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>订单列表</em></span>
  </div>
  <div class="operate">
   <form action="${basePath }/store/order/toStoreOrderList?storeId=${currAdmin.storeId}" method="post">
   
    <img src="${basePath }/static/back/images/icon_search.gif"/>
    <input type="text" name="orderId" class="textBox length-long" placeholder="输入订单号..."/>
    <select name="status" class="inline-select">
    <option value="5">全部</option>
     <option value="0">未付款</option>
     <option value="1">已付款</option>
     <option value="2">已发货</option>
     <option value="3">已完成交易</option>
     <option value="4">申请退款</option>
    </select>
    <input type="submit" value="查询" class="tdBtn"/>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>订单号</th>
    <th>下单时间</th>
    <th>收件人</th>
    <th>收件地址</th>
    <th>订单金额</th>
    <th>订单状态</th>
    <th>操作</th>
   </tr>
   
   <c:forEach items="${list }" var="storeOrderList">
   <tr>
    <td>
     <!-- <input  type="checkbox"/> -->
     <span class="block">${storeOrderList.orderId }</span>
    </td>
    <td>
     <span ><fmt:formatDate value="${storeOrderList.orderTime }" pattern="yyyy-MM-dd hh:mm" /></span>
    </td>
    <td class="center">
     <span class="block">${storeOrderList.receive_name }[${storeOrderList.receive_phone }]</span>
    </td>
     <td class="center">
     <span class="block">${storeOrderList.receive_detail }</span>
    </td>
    <td class="center">
     <span><i>￥</i><b>${storeOrderList.total }</b></span>
    </td>
    <td class="center">
     <span>
     	<c:if test="${storeOrderList.status==(-1) }">交易关闭</c:if>
     	<c:if test="${storeOrderList.status==0 }">未付款</c:if>
     	<c:if test="${storeOrderList.status==1 }">已付款</c:if>
     	<c:if test="${storeOrderList.status==2 }">已发货</c:if>
     	<c:if test="${storeOrderList.status==3 }">已完成</c:if>
     	<c:if test="${storeOrderList.status==4 }">退款中</c:if>
     </span>
    </td>
    <td class="center">
     <a href="${basePath }/store/order/toDetailMsg?orderId=${storeOrderList.orderId}" class="inline-block" title="查看订单"><img src="${basePath }/static/back/images/icon_view.gif"/></a>
    </td>
   </tr>
   </c:forEach>
   
  </table>
  
  <!-- BatchOperation -->
<!--   <div style="overflow:hidden;">
      Operation
	  <div class="BatchOperation fl">
	   <input type="checkbox" id="del"/>
	   <label for="del" class="btnStyle middle">全选</label>
	   <input type="button" value="打印订单" class="btnStyle"/>
	   <input type="button" value="配货" class="btnStyle"/>
	   <input type="button" value="删除订单" class="btnStyle"/>
	  </div> -->
	  <!-- turn page -->
	  <div class="turnPage center fr">
	    <a href="javascript:;" onclick="findPage(${pageInfo.pageNum-1<1?1:pageInfo.pageNum-1},${pageInfo.pageSize},${status });">上一页</a>
        	        
      <c:forEach begin="${pageInfo.pageNum }" end="${pageInfo.pages }" var="i">
      <c:if test="${pageInfo.pageNum==i }">${i }</c:if>
      <c:if test="${pageInfo.pageNum!=i }"><a href="#"  onclick='findPage(${i},${pageInfo.pageSize},${status });'>${i }</a> </c:if>
       
      </c:forEach>
      <a href="javascript:;" onclick="findPage(${pageInfo.pageNum+1>pageInfo.pages?pageInfo.pages:pageInfo.pageNum+1},${pageInfo.pageSize},${status });">下一页</a>
	  </div>
  </div>
 </div>
</body>
</html>