<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<c:set var="upload" value="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    <meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
                
	<script type="text/javascript" src="${sourcePath}/js/n_nav.js"></script>   
    
    <script type="text/javascript" src="${sourcePath}/js/num.js"></script>     
    
    <script type="text/javascript" src="${sourcePath}/js/shade.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/cart.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/tan.js"></script>
    
<title>尤洪</title>
</head>
<body>  
<jsp:include page="./include/head_user_center.jsp"></jsp:include>

<div class="i_bg">  
    
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    	<div class="m_left">
    		<jsp:include page="./include/aside_user_center.jsp"></jsp:include>
    	</div>
    	<div class="m_right" style="width:960px;">
    	
             <div class="tab_btn">
            	<b class="cur color">全部商品<b id="goodsNum">(${goodsNum})</b><span></span></b>
            	<b>降价商品<span></span></b>
            	<b>库存紧张</b>
            	<p></p>
            </div>
            <div>
            <form action="${basePath}/user/order/list" method="post">
     
            	<div class="tab_content">
	            	
	            	<div id="cart">
            	
            	<jsp:include page="./include/userCartJs.jsp"></jsp:include>
            	
		            	<table  cellpadding="0" cellspacing="0">
		            		<thead>
			            		<tr>
			            			<th>
			            				<input type="checkbox" class="selectAll"/>
			            				商品
			            			</th>
			            			<th width=200>属性</th>
			            			<th>单价</th>
			            			<th>数量</th>
			            			<th>小计</th>
			            			<th>操作</th>
			            		</tr>
		            		</thead>
		            		<c:if test="${fn:length(carts) == 0}">
		            		<tbody>
		            			<tr>
		            				<td colspan="6" height=200>
					            				<div class="vertical_bar_l"></div>
		            					<center>您的购物车空空如也!<a href="${basePath}/Index">不如去逛逛吧</a></center>
					            				<div class="vertical_bar_r"></div>
		            				</td>
		            			</tr>
		            		</tbody>
		            		</c:if>
		            		<c:forEach items="${stores}" var="store">
		            			<tbody id="stroe_${store.storeId }">
		            			
		            			<tr class="order_title">
										<td>
											<input type="checkbox" data-sid="${store.storeId}"  class="select_${store.storeId} select_store_all_goods"/>
											<b>店铺:</b>
											<a href="#${page.s.storeId}" class="link">${store.storeName}</a>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
										</td>
								</tr>
			            		<c:forEach items="${carts}" var="page">
			            			<c:if test="${store.storeId == page.s.storeId }"> 
				            			<tr class="gpid_${page.gp.goodPropertyId} gpitem_${page.s.storeId}" data-sid="${page.s.storeId}" >
					            			<td width="375">
					            				<div class="checkbox">
						            				<input type="checkbox" 
						            				id="checkGood_${page.gp.goodPropertyId}" 
						            				data-gid="${page.g.goodId}" 
						            				data-gpid="${page.gp.goodPropertyId}"
						            				data-sid="${page.s.storeId}" 
						            				data-total="${page.gp.price*page.uc.number+page.g.postFee}" 
						            				class="goods store_good_${page.s.storeId}">
					            				</div>

					            				<a href="${basePath}/good/findGood?GoodId=${page.g.goodId}" class="goodLink">
					            					<div style="background-image: url('${upload}/${page.g.img1}');">

					            				<a href="#" class="goodLink">
					            					<div style="background-size: cover;background-image: url('${upload}/${page.g.img1}'); ">

					            						<%-- <img src="${basePath}"> --%>
					            					</div>
					            					<p>
					            						<b class="goodDescr">${page.g.goodTitle}</b>
					            						
					            					</p>
					            				</a>
					            				<div class="vertical_bar_l"></div>
					            			</td>
					            			<td>
					            				<span class="property">${page.p.propertyName}:${page.gp.p1Value}&emsp;${page.p.propertyName}:${page.gp.p2Value}</span>
					            			</td>
					            			<td>
					            				<fmt:formatNumber 
												type="number" 
												value="${page.gp.price}" 
												pattern="0.00" minFractionDigits="2"/>  
					            			</td>
					            			<td>
					            				<div class="cartNumber">
						            				<input type="button" value="-" class="cut changeNumBtn"  data-gpid="${page.gp.goodPropertyId}"  data-postfee="${page.g.postFee}" data-price="${page.gp.price}"/>
						            				<input  name="cartNum" id="goodNum_${page.gp.goodPropertyId}" data-gpid="${page.gp.goodPropertyId}" data-postfee="${page.g.postFee}" data-price="${page.gp.price}" class="goodNum" value="${page.uc.number}" data-stock="${page.gp.stock}" type="text"/>
						            				<input type="button" value="+" class="add changeNumBtn" data-gpid="${page.gp.goodPropertyId}"  data-postfee="${page.g.postFee}" data-price="${page.gp.price}"/>
					            				</div>
					            			</td>
					            			<td>
					            				￥
					            				<span id="goodTotal_${page.gp.goodPropertyId}">
					            				
												<fmt:formatNumber 
												type="number" 
												value="${page.gp.price*page.uc.number+page.g.postFee}" 
												pattern="0.00" minFractionDigits="2"/>  
					            					
					            				</span>
					            				(
					            				${page.g.postFree == 0 ? '包邮': '含邮费:'}
					            				<span id="postFee_${page.gp.goodPropertyId}">
					            					  
													<fmt:formatNumber 
													type="number" 
													value="${page.g.postFree == 0 ? '': page.g.postFee*page.uc.number}" 
													pattern="0.00" minFractionDigits="2"/>  
					            				</span>
					            				)
					            				
					            			</td>
					            			<td>
					            				<span class="link">加入收藏</span>
					            				<span class="link del" data-gpId="${page.gp.goodPropertyId}"  >删除</span>
					            				<div class="vertical_bar_r"></div>
					            			</td>
					            		</tr>
			            			</c:if> 
			            			
			            		</c:forEach>
			            		</tbody>
		            		</c:forEach>
		            		<tbody>
		            			<tr class="order_title">
		            				<td colspan="3">
		            					<input type="checkbox" class="selectAll" id="selectAll" />
		            					<label  for="selectAll" >全选</label>
		            					<span class="link" id="deleteSelectGoods">删除选中</span>
		            					<span class="link">收藏选中商品</span>
		            				</td>
		            				<td>
		            					已选<b id="jianshu">0</b>件
		            				</td>
		            				<td>
		            					合计(不含运费)<b id="cartTotal">0.00</b>
		            				</td>
		            				<td>
		            					<button type="button" id="jiesuan" class="jiesuan">结算</button>
		            				</td>
		            			</tr>
		            		</tbody>
		            	</table>
	            	</div>
	            	
            	</div>
        		</form>
        		</div>
            </div>

            
        </div>
    </div>
    <jsp:include page="./include/footer_user_center.jsp"></jsp:include>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
