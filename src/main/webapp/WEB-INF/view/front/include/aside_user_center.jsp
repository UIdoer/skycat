<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	$(function(){
		var url =document.location.pathname;
		console.log(url);
		var arr = url.split("/");
		console.log(arr[3]);
		var link = $(".m_left li>a");
		link.each(function(){
			var href = $(this).attr("href");
			if(href.indexOf(arr[3]) != -1 ){
				$(this).addClass("now");
			}
		});
		
		
	});
</script>
<div class="m_left">
        	<div class="left_n">管理中心</div>
            <div class="left_m">
            	<div class="left_m_t t_bg1">交易中心</div>
                <ul>
                	<li><a href="${basePath}/user/cart/list">购物车</a></li>
                	<li><a href="${basePath}/user/order/list" >我的订单</a></li>
                    <li><a href="${basePath}/user/address/list" >收货地址</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg2">会员中心</div>
                <ul>
                	<li><a href="${basePath}/user/info" >个人资料</a></li>
                    <li><a href="${basePath}/user/collect" >我的收藏</a></li>
                   
                    <li><a href="${basePath}/user/comment">我的评论</a></li>
                </ul>
            </div>
            
            
        </div>