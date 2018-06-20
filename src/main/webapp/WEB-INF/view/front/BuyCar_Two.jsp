<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/style.css" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/buttons.css" />
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
     <link type="text/css" rel="stylesheet" href="${sourcePath}/css/city-picker.css" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/main.css" />
	<script type="text/javascript" src="${sourcePath}/js/plug-in.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city-picker.data.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city-picker.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city.js"></script>
    
     <style>
    	#addressList>li{
    		background-image: url("${sourcePath}/images/address_blur.png");
    		float:left;
    		width:237px;
    		height:106px;
    		margin:0 10px 10px 0;
    	}
    	#addressList>li.cur{
    		background-image: url("${sourcePath}/images/address_cur.png");
    	
    	}
    	#addressList>li>p>span.link{
    		display:table-cell;
    		padding:2px;
    		position:absolute;
    		top:0;
    		right:0;
    		background-color: rgba(255,255,255,0.2);
    		color:#ccc;
    		line-height: 20px;
    		border-radius: 3px;
    	}
    	#addressList>li>p>span.link:hover{
    		color: rgba(255,100,100,1);
    	}
    	#addressList>li>p{
    		min-height:20px;
    		line-height:20px;
    		position:relative;
    		padding:0 10px;
    		max-height:61px;
    		display:-webkit-box; 
			-webkit-box-orient:vertical; 
			-webkit-line-clamp:2; 
    	}
    	#addressList>li>p>span.fl{
    		color:#fff;
    		background-color: rgba(255,100,100,1);
    		right:auto;
    		left:0;
    	}
    	#addressList>li.cur span.link{
    		display: inline-block;
    	}
    	#addressList{
    		margin: 0 auto 10px auto;
    		width:1110px;
    	}
    	.addAddresForm{
    		display: none;
       }
    </style>
<title>尤洪</title>
</head>
<body>  
<jsp:include page="./include/head_user_center.jsp"></jsp:include>
<script >
	$(function(){
		$("#jijiao").click(function(){
			var stores = {};
			$(".goods").each(function(){
				var sid = $(this).attr("data-sid");
				if($(this).is(":checked")){
					if(!stores[sid]){
						stores[sid] = [];
						stores[sid].push($(this).attr("data-gpid"))
					}else{
						stores[sid].push($(this).attr("data-gpid"))
					}
				}
				
			});
			
			var cartdata = [];
			for(storeId in stores){
				var s = {};
				var goodPropertyIds = stores[storeId];
				var remark = $(".remark_"+storeId).val();
				var addressId = $("#dafAddress").val();
				s.storeId = storeId;
				s.remark = remark;
				s.addressId = addressId;
				s.goodPropertyIds = goodPropertyIds;
				cartdata.push(s);
			}
			
			$.ajax({
	            url:"${basePath}/user/cart/createOrder",
	            type:"POST",
	            contentType:"application/json",
	           
	            data:JSON.stringify(cartdata),
	            success:function (result) {
	                location.href = "${basePath}"+result.url;

	            }
	        })
			
		})
		$('#addressList>li').click(function(){
			console.log($(this));
			$(this).addClass("cur")
			.siblings().removeClass("cur");
			$("#dafAddress").val($(this).attr("data-aid"));
		});
		$(".editor").click(function(){
			var aid = $(this).attr("data-aid");			
			$.post(
				"${basePath}/user/address/PopEditor",
				{"addressId":aid},
				function(data){
					console.log(data);
					$("input[name='specificAddress']").val(data.address.specificAddress);
					$("input[name='specificAddress']").attr("placeholder",data.address.specificAddress);
					$("input[name='addressId']").val(data.address.addressId);
					$("input[name='receiveDetail']").val(data.address.receiveDetail);
					$("input[name='receiveName']").val(data.address.receiveName);
					$("input[name='receivePhone']").val(data.address.receivePhone);
					if(data.address.isDefault=="1"){
						$("input[name='isDefault']").prop("checked",true);
					}else{
						$("input[name='isDefault']").prop("checked",false);
					}
				}
			)
					
					$("#popbg").css({display:"flex"});
			
		});
		
		$("#yes").click(function(){
			$.post(
					"${basePath}/user/address/PopDoEditor",
					$("#addressForm").serialize(),
					function(data){
						$.Pro(data.msg);
						$("#popbg").hide();
						setTimeout(function(){
						location.href = "${basePath}/user/cart/topay"
						},2000)
					}
				)
		})
		
	});
	function setDefault(addressId,addressName,ele){
		$.Pop('确定将 "'+addressName+'" \n设置为默认收货地址?','confirm',function(){
			
			$.post(
				"${basePath}/user/address/setDefault",
				{"addressId":addressId}
				,function(data){
					$.Pro(data.msg)
					$("#msg").text(data.msg).show();
					if(data.flag){
						$(".default").hide();
						$(".setDefault").show();
						$(ele).hide();
						$(".default_"+addressId).show();
						$(".address_"+addressId).prependTo($("#addressList"));
					}
				}
			)
			
		})
	}
</script>
<div class="i_bg">  
    
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    	<input  type="hidden" id="dafAddress" value="${defaultAddress.addressId}" name="addressId" />
           	<c:if test="${fn:length(address)==0}">
           		<li style="height:30px;">oh!您还没有添加收货地址呢!<a href="${basePath}/user/address/list">添加一个</a></li>
           	</c:if>
            <ul id="addressList" >
            	<c:forEach items="${address}" var="addr">
            		<li data-aid="${addr.addressId}" class="address_${addr.addressId} ${addr.isDefault == 1?'cur':'' }"  >
            			<p>
	            		<span class="link fl default default_${addr.addressId}" style="display:${addr.isDefault == 1?'block':'none' };">默认</span>
            			<span class="link setDefault" onclick="setDefault(${addr.addressId},'${addr.receiveName}',this)" data-aid="${addr.addressId}"  style="display:${addr.isDefault == 0?'block':'none' };">设为默认</span>
            			</p>
            			
            			<p><b>${addr.receiveName}</b><span>(${addr.receivePhone})</span></p>
            			<p><b>${addr.specificAddress}</b><span>${addr.receiveDetail }</span></p>
            			<p>
            			<span class="link editor" data-aid="${addr.addressId}">编辑</span></p>
            		</li>
            		
            	</c:forEach>
            </ul>
             <%-- <div class="tab_btn">
            	<b class="cur color">全部商品<b id="goodsNum">(${goodsNum})</b><span></span></b>
            	<b>降价商品<span></span></b>
            	<b>库存紧张</b>
            	<p></p>
            </div> --%>
            <div>
            <form action="${basePath}/user/order/list" method="post">
     
            	<div class="tab_content">
	            	
	            	<div id="cart">
            	
            	<jsp:include page="./include/userCartJs.jsp"></jsp:include>
            	
		            	<table  cellpadding="0" cellspacing="0">
		            		<thead>
			            		<tr>
			            			<th>
			            				<input type="checkbox"  style="display:none;" class="selectAll"/>
			            				商品
			            			</th>
			            			<th width=200>属性</th>
			            			<th>单价</th>
			            			<th>数量</th>
			            			<th>小计</th>
			            			<!-- <th>操作</th> -->
			            		</tr>
		            		</thead>
		            	
		            		
		            		<c:forEach items="${stores}" var="store">
		            			<tbody id="stroe_${store.storeId }">
		            			
		            			<tr class="order_title">
										<td>
											<input type="checkbox" checked="checked"  style="display:none;" data-sid="${store.storeId}"  class="select_${store.storeId} select_store_all_goods"/>
											<b style="margin:0 0 0 10px">店铺:</b>
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
						            				<input type="checkbox" style="display:none;" checked="checked"
						            				id="checkGood_${page.gp.goodPropertyId}" 
						            				data-gid="${page.g.goodId}" 
						            				data-gpid="${page.gp.goodPropertyId}"
						            				data-sid="${page.s.storeId}" 
						            				data-total="${page.gp.price*page.uc.number+page.g.postFee}" 
						            				class="goods store_good_${page.s.storeId}">
					            				</div>
					            				<a href="#" class="goodLink">
					            					<div style="background-size: cover;background-image: url('https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${page.g.img1}');">
					            						<%-- <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${page.g.img1}"> --%>
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
					            				<div class="vertical_bar_r"></div>
					            			</td>
					            			<%-- <td>
					            				<span class="link">加入收藏</span>
					            				<span class="link del" data-gpId="${page.gp.goodPropertyId}"  >删除</span>
					            			</td> --%>
					            			
					            		</tr>
			            			</c:if> 
			            			
			            		</c:forEach>
			            		<tr>
			            			<td colspan="5">
			            				<table>
			            					<tr>
			            						<td style="width:50%;" align="left">
					            				<div class="vertical_bar_l"></div>
			            							<p style="margin-left:10px">给卖家留言:</p></br>
													<textarea class='remark remark_${store.storeId}' style="padding:10px;margin-left:10px;width:85%;min-height:70px;" rows="" cols=""></textarea>
			            						</td>
			            						
			            						<td style="width:50%;" align="left">
			            							<p>运送方式：普通配送 <span>￥6.00</span></p><br/>
			            							<p>发货时间：发货时间:卖家承诺订单在买家付款后, 订单合并72小时内<a href="#">发货</a></p>
					            				<div class="vertical_bar_r"></div>
			            						</td>
			            					</tr>
			            				</table>
			            			</td>
			            		</tr>
			            		</tbody>
		            		</c:forEach>
		            		<tbody>
		            			<tr class="order_title">
		            				<!-- <td colspan="3">
		            					<input type="checkbox" class="selectAll" id="selectAll" />
		            					<label  for="selectAll" >全选</label>
		            					<span class="link" id="deleteSelectGoods">删除选中</span>
		            					<span class="link">收藏选中商品</span>
		            				</td> -->
		            				<td></td>
		            				<td></td>
		            				<td></td>
		            				<!-- <td>
		            					已选<b id="jianshu">0</b>件
		            				</td> -->
		            				<td>
		            					合计(不含运费)<b id="cartTotal">${cart }</b>
		            				</td>
		            				<td>
		            					<button type="button" id="jijiao" class="jiesuan">提交订单</button>
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
    <jsp:include page="./include/footer_user_center.jsp"></jsp:include>
	<div id="popbg" style="width:100vw;height:100vh;background:rgba(0,0,0,0.3);display:none;position:fixed;top:0;left:0;-webkit-display:flex;
        display:none;
        -webkit-align-items:center;
        align-items:center;
        -webkit-justify-content:center;
        justify-content:center;">
				<div style="dispaly:table;width:930px;margin:0 auto ;background:#fff;border-radius: 5px;" >
				<h3 style="border-bottom: 1px solid #ccc;padding:5px 10px;margin-bottom:20px;">修改收货地址</h3>
			<form id="addressForm" >
            <table border="0" class="add_tab" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td width="135px" align="right">收货地址</td>
                <td colspan="3" style="font-family:'宋体';">
                	<div style="position: relative;"><!-- container -->
					  <input name="specificAddress" value="${defaultAddress.specificAddress}" style="min-width: 360px;" data-toggle="city-picker" placeholder="单击下拉修改收货地址" class="city-picker-input">
					</div>
                </td>
              </tr>
              <tr>
                <td align="right">详细地址</td>
                <td style="font-family:'宋体';">
                	<input type="hidden" name="addressId" value="16">
                	<input name="receiveDetail" value="" type="text" class="add_ipt">（必填）
                </td>
              </tr>
             
              <tr>
                <td align="right">收货人姓名</td>
                <td style="font-family:'宋体';">
                <input name="receiveName" value="" type="text" class="add_ipt">（必填）
                </td>
              </tr>
                <tr>
                <td align="right">手机</td>
                <td style="font-family:'宋体';">
                	<input name="receivePhone" value="" type="text" class="add_ipt">（必填）
                </td>
              </tr>
               
                <tr>
                <td align="right">是否默认:</td>
                <td style="font-family:'宋体';">
                	<input type="checkbox" name="isDefault" id="setDef">
                	<label for="setDef">设为默认收货地址</label>
                </td>
              </tr>
            
            </tbody>
            </table>
            </form>
            <div style="border-top: 1px solid #ccc;padding:5px 10px;margin-top:20px;">
            	<div style='display:table;pading:5px;'>
            		<button id="yes" class="button button-primary button-rounded button-small" style="margin:0 5px;">确认修改</button>
            		<button id="no" onclick="javascript:$('#popbg').hide();" class="button button-highlight button-rounded button-small" style="margin:15px;">&emsp;取消&emsp;</button>
            	</div>
            </div>
            </div>
            </div>
</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
