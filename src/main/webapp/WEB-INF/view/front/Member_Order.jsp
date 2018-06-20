<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<c:set var="upload" value="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload"></c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/style.css" />
    <!--[if IE 6]>
    <script src="${sourcePath}js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
        
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
        
	<script type="text/javascript" src="${sourcePath}/js/select.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/cart.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/plug-in.js"></script>
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<jsp:include page="./include/head_user_center.jsp"></jsp:include>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<jsp:include page="./include/aside_user_center.jsp"></jsp:include>
		<div class="m_right">
             <div class="tab_btn">
            	<b class="cur color">所有订单<span></span></b>
            	<b>待付款<span></span></b>
            	<b>待发货<span></span></b>
            	<b>待收货<span></span></b>
            	<b>待评价</b>
            	<p></p>
            </div>
            <div>
            <form action="${basePath}/user/order/list" method="post" id="form">
     			
            	<div class="tab_content">
	            	<div>
	            		<div class="order_serach">
	            			<script>
	            				$('input[name="goodTitle"').keyup(function(){
	            					$('input[name="orderId"]').val($(this).val());
	            				});
	            			</script>
	            			<input type="hidden" name="orderId"/>
	            			<input type="text" name="goodTitle" placeholder="输入商品标题或订单号进行搜索"/>
	            			<button type="submit">订单搜索</button>
	            		</div>
	            		<div class="toggle_conditions_btn">精简筛选条件<b></b></div>
	            	</div>
	            	<div class="conditions" 
	            	${condition.orderTimeStart!=null?'style="display:block;"':''}
	            	${condition.orderTimeEnd!=null?'style="display:block;"':''}
	            	${condition.storeName!=''?'style="display:block;"':''}
	            	${condition.orderStatus!=null?'style="display:block;"':''}
	            	${condition.isCommented!=null?'style="display:block;"':''}
	            	>
	            		<table>
	            			<tr>
	            				<%-- <td>下单时间</td>
	            				<td>
	            					<input type="date" name="orderTimeStart" value="${condition.orderTimeStart}"/>-
	            					<input type="date" name="orderTimeEnd" value="${condition.orderTimeEnd}"/>
	            				</td> --%>
	            				
	            				<td>卖家昵称</td>
	            				<td>
	            					<input type="text" name="storeName" value="${condition.storeName}"/>
	            				</td>
	            				<td>交易状态</td>
	            				<td>
	            				<!-- -1-交易关闭,0-未付款,1-已付款,2-已发货,3-已完成,4-退款中 -->
	            					<select name='orderStatus'>
	            						<option value="" >全部</option>
	            						<option value="0" ${condition.orderStatus == 0 ?'selected':''} >待支付</option>
	            						<option value="1" ${condition.orderStatus == 1 ?'selected':''}>待发货</option>
	            						<option value="2" ${condition.orderStatus == 2 ?'selected':''}>待收货</option>
	            						<option value="3" ${condition.orderStatus == 3 ?'selected':''}>已完成</option>
	            						<option value="4" ${condition.orderStatus == 4 ?'selected':''}>退款中</option>
	            						<option value="-1" ${condition.orderStatus == -1 ?'selected':''}>已关闭</option>
	            					</select>
	            				</td>
	            			
	            				
	            				<td>评论状态</td>
	            				<td>
	            					<select name="isCommented">
	            						<option value="">全部</option>
	            						<option value="0" ${condition.isCommented == 0 ?'selected':''}>待评价</option>
	            						<option value="1" ${condition.isCommented == 1 ?'selected':''}>已评价</option>
	            					</select>
	            				</td>
	            				<td>&emsp;</td>
	            				<td>&emsp;</td>
	            			</tr>
	            			
	            		</table>
	            	</div>
	            	<div id="cart">
		            		
	            	
		            	<table  cellpadding="0" cellspacing="0">
		            		<thead>
			            		<tr>
			            			<th>商品</th>
			            			<th>单价</th>
			            			<th>数量</th>
			            			<th>实付金额</th>
			            			<th>交易状态</th>
			            			<th>交易操作</th>
			            		</tr>
		            		</thead>
		            			
		            		<c:forEach items="${page.list}" var="vo" >
		            		
		            		<tbody>
		            			<%-- <c:forEach items="${orders}" var="o">
		            			<c:if test="${store.storeId == o.storeId }"> --%>
		            				
									 <tr class="order_title">
										<td>
											<input type="checkbox"/>
											<b><fmt:formatDate type="both" value="${vo.orderTime}" /></b>
											<span>订单号:${vo.orderId}&emsp;${vo.storeName }</span>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
										</td>
									</tr>
								
		            		
		            			
		            			<c:forEach items="${vo.orderItem}" var="orderItem" varStatus="stat">
			            		<tr>
			            			<td width=375>
			            				<div class="checkbox">
				            				<input type="checkbox"/>
			            				</div>

			            				<a href="${basePath}/good/findGood?GoodId=${orderItem.good.goodId}" class="goodLink">
			            					
			            					<div style="background-size: cover;background-image: url('${upload}/${orderItem.good.img1}');">
			            					<%-- 	<img src="${upload}/${orderItem.good.img1}"/> --%>
			            					</div>
			            					<p>
			            						<b>${orderItem.good.goodTitle}</b>
			            						<span>${orderItem.gp.p1Name }:${orderItem.gp.p1Value}
			            						 ${orderItem.gp.p2Name }:${orderItem.gp.p2Value}</span>
			            					</p>
			            					
			            				</a>
			            				<div class="vertical_bar_l"></div>
			            				<div class="vertical_bar_r"></div>
			            			</td>
			            			<td>
			            				￥
			            				<fmt:formatNumber 
												type="number" 
												value="${orderItem.total }" 
												pattern="0.00" minFractionDigits="2"/> 
			            				<div class="vertical_bar_r"></div>
			            			</td>
			            			<td>
			            				${orderItem.itemCount}件
			            				<div class="vertical_bar_r"></div>
			            			</td>
			            			<c:if test="${stat.first}">
			            			<td rowspan="${fn:length(vo.orderItem)}">
			            			
			            				￥
			            				<fmt:formatNumber 
												type="number" 
												value="${vo.total}" 
												pattern="0.00" minFractionDigits="2"/>
			            				<%-- (
			            					${vo.g.postFree == 0 ? '包邮':'含邮费:'}
			            					<c:if test="${vo.g.postFree == 1 }">
			            						￥
			            						<fmt:formatNumber 
												type="number" 
												value="${ vo.g.postFee }" 
												pattern="0.00" minFractionDigits="2"/>  
			            					</c:if>
			            				) --%>
			            				<div class="vertical_bar_r"></div>
			            			</td>
			            			</c:if>
			            			<c:if test="${stat.first}">
				            			<td rowspan="${fn:length(vo.orderItem)}">
				            				<b>
				            				<!-- -1-交易关闭,0-未付款,1-已付款,2-已发货,3-已完成,4-退款中 -->
				            				${vo.status == -1 ?'交易关闭':''}
				            				${vo.status == 0 ?'待付款':''}
				            				${vo.status == 1 ?'买家已付款':''}
				            				${vo.status == 2 ?'卖家已发货':''}
				            				${vo.status == 3 ?'已完成':''}
				            				${vo.status == 4 ?'退款中':''}
				            				</b>
				            				<div class="vertical_bar_r"></div>
				            			</td>
			            			</c:if>
			            		<!-- 	* @param WIDout_trade_no 商户订单号
										 * @param WIDsubject 订单标题
										 * @param WIDtotal_amount 订单总价
										 * @param WIDbody 订单内容
										 * @param map -->
			            			<c:if test="${stat.first}">
				            			<td rowspan="${fn:length(vo.orderItem)}">

				            				<c:if test="${vo.status == -1 }">
				            					<button  type="button" class="play_btn">订单已关闭</button>
				            				</c:if>
				            				<c:if test="${vo.status==0}">
				            					<button id="payButton" type="button" class="play_btn" <c:if test="${vo.status eq 1 }">style='display:none'</c:if>
				            					 onclick="toCreatePay(${vo.orderId},'${vo.orderItem[0].good.goodTitle}',${fn:length(vo.orderItem)},${vo.total})"
				            					 >立即付款</button>
				            					 <span class="cancel_order_btn"  onclick="cancelOrder(${vo.orderId},'${orderItem.good.goodTitle}')">取消订单</span>
				            				</c:if>
				            				<c:if test="${vo.status == 1 }">
				            					<button  type="button" class="play_btn">待发货</button>
				            					 <span class="cancel_order_btn"  onclick="reminder(${vo.orderId},'${orderItem.good.goodTitle}')">我要催单</span>
				            				</c:if>
				            				<c:if test="${vo.status == 2 }">
				            					<button id="payButton" onclick="confirmReceive(${vo.orderId},'${vo.orderItem[0].good.goodTitle}',${fn:length(vo.orderItem)},${vo.total})" type="button" class="play_btn">确认收货</button>
				            					 <span class="cancel_order_btn"  onclick="returnOfGood(${vo.orderId},'${vo.orderItem[0].good.goodTitle}',${fn:length(vo.orderItem)},${vo.total})">申请退货</span>
				            				</c:if>
				            				<c:if test="${vo.status == 3 }">
				            					<button id="payButton" type="button" class="play_btn">交易完成</button>
				            					<span class="cancel_order_btn"  onclick="location.href='${basePath}/goodComment/toGoodComment?goodId=${orderItem.good.goodId}'">评论此次交易</span>
				            				</c:if>
				            				<c:if test="${vo.status == 4 }">
				            					<button id="payButton" type="button" class="play_btn">退款中</button>
				            				</c:if>
			            					<div class="vertical_bar_r"></div>
			            				</td>
			            			</c:if>
			            		</tr>
		            			</c:forEach>
			            	
		            </tbody>
		            		</c:forEach>
		          
		            		
		            		
		            	</table>
	            	</div>
	            	<script>
	            		//确认收货
	            		function confirmReceive(orderId,goodTitle,itemLen,orderTotal){
	            			
	            			$.Pop(
            					"请你亲自拆包清点商品后再操作哟!<br>"+
            					"商品概况:<br>"+
            					"<b>"+goodTitle+"等.."+itemLen+"件商品</b><br>"+
            					"总价:"+orderTotal,
            					"confirm",
            					function(){
            						$.post(
            							"${basePath}/user/order/confirmReceive",
            							{"orderId":orderId},
            							function(data){
            								$.Pro(data.msg)
            								setTimeout(function(){
				            					window.location.reload();
				            				},500);
            							}
            						)
            					},
            					function(){}
	            			)
	            			
	            		}
	            	
	            		//催单
	            		function reminder(orderId,goodTitle){
	            			setTimeout(function(){
	            				$.Pro("我们已经为你催促商家发货啦!")
	            			},500);
	            		}
	            		//申请退货
	            		function returnOfGood(orderId,goodTitle,itemLen,orderTotal){
	            			$.Pop(
	            					'你确定对 "'+goodTitle+'" 等'+itemLen+'件商品申请退货吗？<br>'
	            					+"订单总额为:<b style='color:red;'>"+orderTotal+"元",
	            					"confirm"
	            					,function(){
				            			$.post(
				            				"${basePath}/user/order/returnOfGood",
				            				{"orderId":orderId},
				            				function(data){
				            					$.Pro(data.msg);
				            					setTimeout(function(){
				            					window.location.reload();
				            					},500);
				            				}
				            			);
	            					},
	            					function(){}
	            			)
	            		}
	            		//去掉订单
	            		function cancelOrder(orderId,goodTitle){
	            			$.Pop('确定取消  "<b>'+goodTitle+'...</b>"  订单吗?',"confirm",function(){
		            			$.post(
		            				"${basePath}/user/order/cancel",
		            				{"orderId":orderId},
		            				function(data){
		            					$.Pro(data.msg);
		            					setTimeout(function(){
		            					window.location.reload();
		            						
		            					},500);
		            				}
		            			);
	            			},function(){})
	            		}
	            		function toCreatePay(orderId,goodTitle,itemLen,orderTotal){
	            			// 模拟form表单提交
	            			var temp_form = document.createElement("form");      
				            temp_form .action = "${basePath}/alipay/generatePay";      
				            //temp_form .target = "_blank";
				            temp_form .method = "post";
				            temp_form .style.display = "none";
				            // 第一个参数
				            var opt = document.createElement("textarea");      
			                opt.name = "WIDout_trade_no";      
			                opt.value = orderId;      
			                temp_form .appendChild(opt);
			                // 第二个参数
			                opt = document.createElement("textarea");      
			                opt.name = "WIDsubject";      
			                opt.value = goodTitle+"等"+itemLen+"个商品...";      
			                temp_form .appendChild(opt);
			                // 第三个参数
			                opt = document.createElement("textarea");      
			                opt.name = "WIDtotal_amount";      
			                opt.value = orderTotal;      
			                temp_form .appendChild(opt);
			                // 提交表单
			                document.body.appendChild(temp_form);      
			                temp_form .submit();
			                
			                // 更改提示信息
			                $("#payButton").text("刷新查看支付结果")
	            		}
	            	</script>
	            	<jsp:include page="./include/pagination.jsp"></jsp:include>
            	</div>
        		</form>
            </div>

            
        </div>
    </div>
	<!--End 用户中心 End--> 
    <jsp:include page="./include/footer_user_center.jsp" ></jsp:include>
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

