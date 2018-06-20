<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
	
	
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.html">登录</a>&nbsp; <a href="Regist.html" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;<a href="#">我的订单</a>&nbsp;|</span>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                                <li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                                <li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${sourcePath}/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="Index.html"><img src="${sourcePath}/images/logo.png" /></a></div>
    <div class="search">
    	<form>
        	<input type="text" value="" class="s_ipt" />
            <input type="submit" value="搜索" class="s_btn" />
        </form>                      
        <span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a href="#">连衣裙</a></span>
    </div>
    <div class="i_car">
    	<div class="car_t">购物车 [ <span>3</span> ]</div>
        <div class="car_bg">
       		<!--Begin 购物车未登录 Begin-->
        	<div class="un_login">还未登录！<a href="Login.html" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <ul class="cars">
            	<li>
                	<div class="img"><a href="#"><img src="${sourcePath}/images/car1.jpg" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a></div>
                    <div class="price"><font color="#ff4e00">￥399</font> X1</div>
                </li>
                <li>
                	<div class="img"><a href="#"><img src="${sourcePath}/images/car2.jpg" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a></div>
                    <div class="price"><font color="#ff4e00">￥399</font> X1</div>
                </li>
                <li>
                	<div class="img"><a href="#"><img src="${sourcePath}/images/car2.jpg" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">香奈儿（Chanel）邂逅活力淡香水50ml</a></div>
                    <div class="price"><font color="#ff4e00">￥399</font> X1</div>
                </li>
            </ul>
            <div class="price_sum">共计&nbsp; <font color="#ff4e00">￥</font><span>1058</span></div>
            <div class="price_a"><a href="#">去购物车结算</a></div>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>		    
<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul>    
                <c:forEach items="${categorys}" var="cates">
                	<c:if test="${cates.parentId==0}">
                    <li>
                    	<div class="fj">
                    		<!-- 一级父类 -->
                        	<span class="n_img"><span></span><img src="${sourcePath}/images/nav1.png" /></span>
                            <span class="fl"><c:if test="${cates.parentId==0}"> ${cates.categoryName }</c:if></span>
                        </div>
                        <div class="zj">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                	<!-- 二级父类 -->
                                    <h2><c:if test="${cates.parentId==0}"> ${cates.categoryName}</c:if></h2>
                                    	
                                	 <c:forEach items="${categorys}"  var="sonName" varStatus="varSta">
                                	 	<!-- 判断具体的商品的父类和二级类目的id是否相同，相同则遍历输出 -->
                                   		<c:if test="${sonName.parentId==cates.categoryId}">
                                   			 <a href="#">${sonName.categoryName}|
                                   		</c:if>
                                    </c:forEach>
                               
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="${sourcePath}/images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="${sourcePath}/images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    </c:if>
                   </c:forEach>  
                </ul>            
            </div>
        </div>  
        <!--End 商品分类详情 End-->                                                     
    	                                                                                                                                              
        	<ul class="menu_r">                                                                                                                                           
        	<li><a href="${basePath}/Index">首页</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=7">美食</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=14">生鲜</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=11">家居</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=18">服装</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=17">美妆</a></li>
            <li><a href="${basePath}/good/findCategoryGood?CategoryId=1">数码</a></li>
            
            </ul>
        
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>
</div>
<!--End Menu End--> 