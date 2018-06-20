<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<script>
			$(function(){
				//去计算
				$("#jiesuan").click(function(){
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
						s.storeId = storeId;
						s.goodPropertyIds = goodPropertyIds;
						cartdata.push(s);
					}
					console.log(cartdata);
					$.ajax({
			            url:"${basePath}/user/cart/gotopay",
			            type:"POST",
			            contentType:"application/json",
			            /* dataType:"json", */ 
			            data:JSON.stringify(cartdata),
			            success:function (result) {
			                location.href = "${basePath}"+result.url;

			            }
			        })
					/* $.post(
						"${basePath}/user/cart/gotopay",
						cartdata,
						function(data){
							console.log(data);
						}
					) */
					/* [
						{
							"storeID":001,
							"goodPropertyId":[001,002,003]
						}
						]*/
					//location.href = "${basePath}/user/cart/gotopay";
				});
				//更改复选框,同步件数
				function caclSeletedNum(){
					var selected = 0;
					$('.goods').each(function(){
						//console.log($(this).prop("checked"))
						
						if($(this).prop("checked")){
							selected++;
						}
					});
					$("#jianshu").text(selected)
				}
				//选择某个商店的所有商品
				$('.select_store_all_goods').on("change",function(){
					var sid = $(this).attr("data-sid");
					var flag = $(this).is(":checked");
					$(".store_good_"+sid).prop("checked",flag);
					caclSeletedNum();
					
				});
				
				//只要取消一个商品就不选中全选按钮
				//如果选择了一个商品就刚刚好是全选，那么顺便将全选按钮也勾选上
				$('input[type="checkbox"]').not($('.selectAll')).on("change",function(){
					var b = true;
					$('.goods').each(function(){
						if(!$(this).prop("checked")){
							b = false;
						}
					})
					$('.selectAll').prop("checked",b)
					caclCartTotal()
					caclSeletedNum();
				})
				//店铺的所有商品都被选择了，那么顺便也勾选商铺的选框
				//店铺的所有商品都被取消了，那么顺便也取消商铺的选框
				$(".goods").on("change",function(){
					activeStoreSelect($(this));
				});
				
				//
				function activeStoreSelect(ele){
					var gid = ele.attr("data-gid");
					var sid = ele.attr("data-sid");
					console.log($('.store_good_'+sid));
					var b = true;
					$('.store_good_'+sid).each(function(){
 					if(!$(this).is(":checked")){
 						b = false;
 					}
					})
					$('.select_'+sid).prop("checked",b)
					caclSeletedNum();
				}
				
				//全选
				$('.selectAll').on("change",function(){
					var flag = $(this).is(":checked");
					$('input[type="checkbox"]').prop("checked",flag);
					caclSeletedNum();
				})
				//删除单个商品
				$(".del").click(function(){
 				var gpId = $(this).attr("data-gpId");
					$.tan("询问","<center>确定删除该商品吗？</center>","确定","删除",function(){
 					$.post(
 						"${basePath}/user/cart/delete",
 						{"gpId":gpId}
 						,function(data){
 							alert(data.msg);
 							if(data.flag){
 								var sid = $('.gpid_'+gpId).attr("data-sid");
 								if($(".gpitem_"+sid).length>1){
  								$('.gpid_'+gpId).remove();
 								}else{
 									$("#stroe_"+sid).remove();
 								}
 								
 							}
 							$("#goodsNum").text("("+data.goodsNum+")");
 						}
 					)
						
					},function(){})
				})
				
				//删除选中
				$("#deleteSelectGoods").click(function(){
					
					$.post("${basePath}/user/cart/delete",function(){
						
					})
				})
				//点击+/-按钮时
				$(".changeNumBtn").on("click",function(){
					caclGoodTotal($(this))
					caclCartTotal();
					caclSeletedNum();
					var gpid = $(this).attr("data-gpid");
					activeStoreSelect($("#checkGood_"+gpid));
				})
				//修改输入框数字时
				$(".goodNum").on("keyup",function(){
					caclGoodTotal($(this))
					caclCartTotal();
					caclSeletedNum();
					var gpid = $(this).attr("data-gpid");
					activeStoreSelect($("#checkGood_"+gpid));
				})
				$(".goodNum").keyup();
				//计算购物车总价
				function caclCartTotal(){
					var cartTotal = 0;
					$('.goods').each(function(){
 					if($(this).is(":checked")){
  					var goodsTotal = eval($(this).attr("data-total"));
  					cartTotal+=goodsTotal;
 					}
					})
					$('#cartTotal').text(cartTotal.toFixed(2));
					
				}
				function update(goodPropertyId,number){
					$.post(
						"${basePath}/user/cart/update",
						{
							"goodPropertyId":goodPropertyId,
							"number":number
						},
						function(data){
							console.log(data.msg);
						}
					)
				}
				
				//计算商品总价
				function caclGoodTotal(ele){
					var gpid = ele.attr("data-gpid");
					var stock = $("#goodNum_"+gpid).attr("data-stock");
					var ucnum = 0;
					try{
						ucnum = eval($("#goodNum_"+gpid).val());
					}catch(e){
						ucnum = 0;
					}
					if(!ucnum){
					ucnum = 0; 
					}
					if(ele.hasClass("cut")){
						ucnum--;
					}
					if(ele.hasClass("add")){
						ucnum++;
 				}
					if(ucnum<=1){
						ucnum=1;
					}
 				$("#goodNum_"+gpid).val(ucnum);
 				
					var postfee =ele.attr("data-postfee");
					var price = ele.attr("data-price");
					
					
					var goodTotal = eval("("+price+"+"+postfee+")*"+ucnum).toFixed(2);
					
					//console.log(goodTotal);
					var checkGood = $("#checkGood_"+gpid);
					checkGood.attr("data-total",goodTotal)
					var postfee =eval(postfee+"*"+ucnum).toFixed(2);
					$("#postFee_"+gpid).text( postfee >0?postfee:"" )
					$("#goodTotal_"+gpid).text( goodTotal );
					if(!$("#checkGood_"+gpid).prop("checked")){
 					$("#checkGood_"+gpid).prop("checked",true);
					}
					update(gpid,ucnum);
				}
				
			});
  		</script>