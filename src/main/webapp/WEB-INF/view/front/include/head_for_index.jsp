<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<!--Begin Header Begin-->
<c:if test="${user==null }">

<div class="soubg">
	<div class="sou">
		<span class="fl">
		你好，请<a href="${basePath}/user/toLogin">登录&nbsp;|&nbsp;
        	</a>
		<a href="${basePath}/user/toRegist" style="color:#ff4e00;">免费注册</a>
		</span>
        <span class="fr">
        	<span class="fl"><a href="${basePath}/user/toLogin">我的订单</a>&nbsp;|&nbsp;</span>
        	<span class="fl"><a href="${basePath}/user/toLogin">购物车</a>&nbsp;|</span>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">            
                        	<ul>
                            	<li><a href="${basePath}/user/toLogin">我收藏的商品</a></li>
                                <li><a href="${basePath}/user/toLogin">我收藏的店铺</a></li>
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
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${sourcePath}/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
        
    </div>
</div>
</c:if>
<c:if test="${user !=null }">
<div class="soubg">
	<div class="sou">
	<span class="fl">
		Hi,<a href="${basePath}/user/info?userId=${user.userId}">${user.userName}</a>!
		</span>
        <span class="fr">
        	<span class="fl"><a href="${basePath}/user/order/list">我的订单</a>&nbsp;|</span>
        	<span class="fl"><a href="${basePath}/user/cart/list">购物车</a>&nbsp;|</span>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="${basePath}/user/collect">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">            
                        	<ul>
                            	<li><a href="${basePath}/user/collect/good/list">我收藏的商品</a></li>
                                <li><a href="${basePath}/user/collect/store/list">我收藏的店铺</a></li>
                            </ul>
                        </div>
                    </div>     
                </div>
                <div class="ss_list">
                	<a href="#">个人中心</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="${basePath}/user/info">个人资料</a></li>
                               <!--  <li><a href="#">安全中心</a></li>
                                <li><a href="#">客户服务</a></li> -->
                            </ul>
                        </div>
                    </div>    
                </div>
                
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
	       <span class="fr">
	        	&nbsp;|&nbsp;<a href="${basePath}/user/exits">退出</a>
	        </span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${sourcePath}/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
        
    </div>
</div>
</c:if>
<div class="top">
    <div class="logo"><a href="${basePath}/Index"><img src="${sourcePath}/images/logo.png" /></a></div>
    <div class="search">
    	<form action="${basePath}/good/toFindGoodByGoodTitle" method="post">
        	<input type="text"  name="goodTitle" class="s_ipt" />
            <input type="submit" value="搜索" class="s_btn" />
        </form>                      
      
    </div>
    <div class="i_car">
    	<div class="car_t">购物车 [ <span>${userCartSize}</span> ]</div>
        <div class="car_bg">
       		<!--Begin 购物车未登录 Begin-->
       		<c:if test="${ userCartSize ==0 }">
       			<div><center>Oh!你的购物车什么也没有!</center></div>
       		</c:if>
        		<%-- <div class="un_login">还未登录！<a href="${basePath}/user/toLogin" style="color:#ff4e00;">马上登录</a> 查看购物车！</div> --%>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <ul class="cars">
            	<c:forEach items="${userCart}" var="cart">
            		<li>
	                	<div class="img"><a href="#"><img src="${cart.g.img1}" width="58" height="58" /></a></div>
	                    <div class="name"><a href="#">${cart.g.goodTitle}</a></div>
	                    <div class="price"><font color="#ff4e00">￥${cart.gp.price}</font>X ${cart.uc.number}</div>
	                   
	                </li>
            	</c:forEach>
            </ul>
            <c:if test="${ userCartSize !=0 }">
	            <div class="price_sum"  >共计&nbsp; <font color="#ff4e00">￥</font><span>${ cartTotal }</span></div>
	            <div class="price_a"><a href="${basePath}/user/cart/list">去购物车结算</a></div>
       		</c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
<!--End Header End-->

<!--Begin Menu Begin-->
<div class="menu_bg">
	<div class="menu">
    	<!--Begin 商品分类详情 Begin-->    
    	<div class="nav">
        	<div class="nav_t">全部商品分类</div>
            <div class="leftNav" style="display:none;">
                <ul>    
                <c:forEach items="${categorys}" var="cates">
                	<c:if test="${cates.parentId==0}">
                    <li>
                    	<div class="fj">
                    		<!-- 一级父类 -->
                        	<span class="n_img"><span></span><img src="${sourcePath}/images/nav1.png" /></span>
                            <span class="fl"><c:if test="${cates.parentId==0}">
                            <a  href="${basePath}/good/findGoodByParrentCategoryId?parentCategoryId=${cates.categoryId}"> ${cates.categoryName }</a>
                     </c:if></span>
                        </div>
                        <div class="zj">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                	<!-- 二级父类 -->
                                    <h2><c:if test="${cates.parentId==0}"> ${cates.categoryName}</c:if></h2>
                                    	
                                	 <c:forEach items="${categorys}"  var="sonName" varStatus="varSta">
                                	 	<!-- 判断具体的商品的父类和二级类目的id是否相同，相同则遍历输出 -->
                                   		<c:if test="${sonName.parentId==cates.categoryId}">
                                   			 <a href="${basePath}/good/findCategoryGood?CategoryId=${sonName.categoryId}">${sonName.categoryName}|</a>
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