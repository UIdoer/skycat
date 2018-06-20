<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>

<script type="text/javascript">
function sendGood(){
	var url="${basePath}/store/order/sendGood?userId=${order2.userId}&orderId=${order2.orderId}";
	location=url;
	
}

function refund(){
	var url="${basePath}/store/order/refund?userId=${order2.userId}&orderId=${order2.orderId}";
	location=url;
	
}

</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="order"></i><em>订单编号：${order.orderId }</em></span>
  </div>
  <dl class="orderDetail">
   <dt class="order-h">订单详情</dt>
   <dd>
    <ul>
     <li>
      <span class="h-cont h-right">收件人姓名：</span>
      <span class="h-cont h-left">${order.receive_name }</span>
     </li>
     <li>
      <span class="h-cont h-right">联系电话：</span>
      <span class="h-cont h-left">${order.receive_phone }</span>
     </li>
     <li>
      <span class="h-cont h-right">联系地址：</span>
      <span class="h-cont h-left">${order.receive_detail }</span>
     </li>
     <li>
      <span class="h-cont h-right">付款状态：</span>
      <span class="h-cont h-left">
      	<c:if test="${order.status==(-1) }">交易关闭</c:if>
     	<c:if test="${order.status==0 }">未付款</c:if>
     	<c:if test="${order.status==1 }">已付款</c:if>
     	<c:if test="${order.status==2 }">已发货</c:if>
     	<c:if test="${order.status==3 }">已完成</c:if>
     	<c:if test="${order.status==4 }">退款中</c:if>
      </span>
     </li>
     <li>
      <span class="h-cont h-right">下单时间：</span>
      <span class="h-cont h-left">
      <fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd hh:mm" />
      </span>
     </li>
     
    </ul>
   </dd>
   <dd style="padding:1em 0;">
    <span><b>订单留言：</b></span>
    <span>${order.remark }</span>
   </dd>
   <dd>
    <table class="list-style">
     <tr>
      <th>缩略图</th>
      <th>产品</th>
      <th>单价</th>
      <th>数量</th>
      <th>小计</th>
     </tr>
     <c:forEach items="${item }" var="onceOrder">
     <tr>
      <td><img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${onceOrder.img1 }" class="thumbnail"/></td>
      <td>${onceOrder.good_title }(${onceOrder.p1_value },${onceOrder.p2_value })</td>
      <td>
       <span>
        <i>￥</i>
        <em>${onceOrder.price }</em>
       </span>
      </td>
      <td>${onceOrder.item_count }</td>
      <td>
       <span>
        <i>￥</i>
        <em>${onceOrder.price*onceOrder.item_count }</em>
       </span>
      </td>
     </tr>
     <c:set 
        var="costs" 
        value=" ${costs+onceOrder.price*onceOrder.item_count }">
        </c:set>
     </c:forEach>
     <tr>
      <td colspan="5">
       <div class="fr">
        <span style="font-size:15px;font-weight:bold;">
         <i>订单共计金额：￥</i>
         <b>${costs }</b>
        </span>
       </div>
      </td>
     </tr>
    </table>
   </dd>
<!--    <dd>
    <table class="noborder">
     <tr>
      <td width="10%" style="text-align:right;"><b>管理员操作：</b></td>
      <td>
       <textarea class="block" style="width:80%;height:35px;outline:none;"></textarea>
      </td>
     </tr>
     
    </table>
   </dd> -->
   <dd>
      <!-- Operation -->
	  <div class="BatchOperation">
	  <c:if test="${order.status==1 }"><input onclick="sendGood();" type="button" value="发货" class="btnStyle"/></c:if>
	   <c:if test="${order.status==0 or order.status==4 }"><input onclick='refund();' type="button" value="取消订单" class="btnStyle"/></c:if>
	  </div>
   </dd>
  </dl>
 </div>
</body>
</html>