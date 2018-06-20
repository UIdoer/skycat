<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${sourcePath}/js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
        
	<%-- <script type="text/javascript" src="${sourcePath}/js/select.js"></script> --%>
    
	<script type="text/javascript" src="${sourcePath}/js/lrscroll.js"></script>
    
    <script type="text/javascript" src="${sourcePath}/js/iban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/fban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/f_ban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/mban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/bban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/hban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/tban.js"></script>
    
	<script type="text/javascript" src="${sourcePath}/js/lrscroll_1.js"></script>
    
    
<title>skyCat</title>
</head>
<body>  

<jsp:include page="./include/head_for_index.jsp"></jsp:include>

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
                                   			 <a style="color:black" href="${basePath }/good/findCategoryGood?CategoryId=${sonName.categoryId}">${sonName.categoryName}|</a>
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
<%-- <!--Begin Header Begin-->
<jsp:include page="./Navigation.jsp" ></jsp:include>
      	  <!--End 商品分类详情 End-->                                                     
    	                                                                                                                                              
        	<jsp:include page="./Navigation.jsp" ></jsp:include> --%>
        
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>
</div>
<!--End Menu End--> 
<div class="i_bg bg_color">
	<div class="i_ban_bg">
		<!--Begin Banner Begin-->
    	<div class="banner">    	
            <div class="top_slide_wrap">
                <ul class="slide_box bxslider">
                	<c:forEach items="${rollImages}" var="roll">
                    <li><a href="${basePath }/${roll.url}"><img src="${sourcePath}/images/${roll.imgSrc}" width="740" height="401" /></a></li>
                    </c:forEach>
                </ul>	
                <div class="op_btns clearfix">
                    <a href="#" class="op_btn op_prev"><span></span></a>
                    <a href="#" class="op_btn op_next"><span></span></a>
                </div>        
            </div>
        </div>
        <script type="text/javascript">
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:$(".top_slide_wrap .op_prev")[0],nextSelector:$(".top_slide_wrap .op_next")[0]
            });
        })();
        </script>
        <!--End Banner End-->
        <div class="inews">
        	<div class="news_t">
            	<span class="fr"><a href="#">更多 ></a></span>新闻资讯
            </div>
            <ul>
            	<li><span>[ 特惠 ]</span><a href="#">掬一轮明月 表无尽惦念</a></li>
            	<li><span>[ 公告 ]</span><a href="#">好奇金装成长裤新品上市</a></li>
            	<li><span>[ 特惠 ]</span><a href="#">大牌闪购 · 抢！</a></li>
            	<li><span>[ 公告 ]</span><a href="#">发福利 买车就抢千元油卡</a></li>
            	<li><span>[ 公告 ]</span><a href="#">家电低至五折</a></li>
            </ul>
            <div class="charge_t">
            	话费充值<div class="ch_t_icon"></div>
            </div>
            <form>
            <table border="0" style="width:205px; margin-top:10px;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td width="33">号码</td>
                <td><input type="text" value="" class="c_ipt" /></td>
              </tr>
              <tr height="35">
                <td>面值</td>
                <td>
                	<!-- <select class="jj" name="city">
                      <option value="0" selected="selected">100元</option>
                      <option value="1">50元</option>
                      <option value="2">30元</option>
                      <option value="3">20元</option>
                      <option value="4">10元</option>
                    </select> -->
                    <span style="color:#ff4e00; font-size:14px;">￥99.5</span>
                </td>
              </tr>
              <tr height="35">
                <td colspan="2"><input type="submit" value="立即充值" class="c_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
    <!--Begin 热门商品 Begin-->
    <div class="content mar_10">
    	<div class="h_l_img">
        	<div class="img"><img src="${sourcePath}/images/l_img.jpg" width="188" height="188" /></div>
            <div class="pri_bg">
                <span class="price fl">￥53.00</span>
                <span class="fr">16R</span>
            </div>
        </div>
        <div class="hot_pro">        	
        	<div id="featureContainer">
                <div id="feature">
                    <div id="block">
                        <div id="botton-scroll">
                            <ul class="featureUL">
                            	<!-- 热卖活动商品展示 -->
                            	<c:forEach items="${Be_Hot}" var="hot">
                                <li class="featureBox">
                                    <div class="box">
                                    	<div class="h_icon"><img src="${sourcePath}/images/hot.png" width="50" height="50" /></div>
                                        <div class="imgbg">
                                        	<a href="${basePath}/good/findGood?GoodId=${hot.goodId}">
                                        		<img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${hot.img1}" width="160" height="136" />
                                        	</a>
                                        </div>                                        
                                        <div class="name">
                                        	<a href="${basePath}/good/findGood?GoodId=${hot.goodId}">
                                            <h2>${hot.goodTitle}</h2>
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>${hot.defaultPrice}</span></font> &nbsp;
                                        </div>
                                    </div>
                                </li>
                              </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <a class="h_prev" href="javascript:void();">Previous</a>
                    <a class="h_next" href="javascript:void();">Next</a>
                </div>
            </div>
        </div>
    </div>
   
    <div class="content mar_20">
    	<img src="${sourcePath}/images/mban_1.jpg" width="1200" height="110" />
    </div>
    
   <!--Begin 数码家电 Begin-->
    <c:forEach items="${categoryLevle}" var="levelCate" varStatus="lavelCount">
   <!--  如果有活动的商品则进行楼层广告显示 -->
    <c:if test="${levelCate.goods!=null && !levelCate.goods.isEmpty() }">
    
   
    <div class="i_t mar_10">
    	<!-- 楼层F展示 -->
    	<span class="floor_num">${lavelCount.count}F</span>
    	<span class="fl">${levelCate.categoryName}</span>                                
       <span class="i_mores fr">
      				 <c:forEach items="${levelCate.beTops}" var="beTop" >
                	 | &nbsp; &nbsp;<a href="${basePath}/good/findCategoryGood?CategoryId=${beTop.categoryId}">${beTop.categoryName}</a>&nbsp; &nbsp; 
                	</c:forEach> 
       
       </span>                                       
    </div>
    <div class="content">
    	<div class="tel_left">
        	<div class="tel_ban">
            	<div id="imgPlay6">
                    <ul class="imgs" id="actor6">
                    	<c:forEach items="${levelCate.goods}" var="rollLevel" >
                        <li><a href="${basePath}/good/findGood?GoodId=${rollLevel.goodId}"><img src="${upload}/${rollLevel.img1}" width="211" height="286" /></a></li>
                       
                        </c:forEach>
                    </ul>
                    <div class="prev_t">上一张</div>
                    <div class="next_t">下一张</div> 
                </div>   
            </div>
            <div class="fresh_txt">
            	<div class="fresh_txt_c">
            		<c:forEach items="${levelCate.beTops}" var="beTop" >
                	<a href="${basePath}/good/findCategoryGood?CategoryId=${beTop.categoryId}">${beTop.categoryName}</a>
                	</c:forEach>
                </div>
            </div>
        </div>
        <div class="fresh_mid">
        	<ul>
        		<c:forEach items="${levelCate.goods}" var="cateRollImg">
            	<li>
                	<div class="name"><a href="${basePath}/good/findGood?GoodId=${cateRollImg.goodId}">${cateRollImg.goodTitle}</a></div>
                    <div class="price">
                    	<font>￥<span>${cateRollImg.defaultPrice}</span></font> &nbsp;
                    </div>
                    <div class="img"><a href="${basePath}/good/findGood?GoodId=${cateRollImg.goodId}"><img src="${upload}/${cateRollImg.img1}" width="185" height="155" /></a></div>
                </li>
               </c:forEach> 
               
            </ul>
        </div>
        <div class="fresh_right">
        	<ul>
            	<li><a href="#"><img src="${sourcePath}/images/tel_b1.jpg" width="260" height="220" /></a></li>
                <li><a href="#"><img src="${sourcePath}/images/tel_b2.jpg" width="260" height="220" /></a></li>
            </ul>
        </div>
    </div>   
    </c:if>
     </c:forEach>
    
    
    <!--End 数码家电 End-->
    <!--Begin 猜你喜欢 Begin-->
    <div class="i_t mar_10">
    	<span class="fl">猜你喜欢</span>
    </div>    
    <div class="like">        	
        <div id="featureContainer1">
            <div id="feature1">
                <div id="block1">
                    <div id="botton-scroll1">
                        <ul class="featureUL">
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="${sourcePath}/images/hot1.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>德国进口</h2>
                                        德亚全脂纯牛奶200ml*48盒
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>189</span></font> &nbsp; 26R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="${sourcePath}/images/hot2.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>iphone 6S</h2>
                                        Apple/苹果 iPhone 6s Plus公开版
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>5288</span></font> &nbsp; 25R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="${sourcePath}/images/hot3.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>倩碧特惠组合套装</h2>
                                        倩碧补水组合套装8折促销
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>368</span></font> &nbsp; 18R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="${sourcePath}/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="${sourcePath}/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>                                        
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <a class="l_prev" href="javascript:void();">Previous</a>
                <a class="l_next" href="javascript:void();">Next</a>
            </div>
        </div>
    </div>
    <!--End 猜你喜欢 End-->
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg b_btm_c">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="${sourcePath}/images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="${sourcePath}/images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="${sourcePath}/images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="${sourcePath}/images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
    	<dl>                                                                                            
        	<dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
        	<a href="#" class="b_sh1">新浪微博</a>            
        	<a href="#" class="b_sh2">腾讯微博</a>
            <p>
            服务热线：<br />
            <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="${sourcePath}/images/er.gif" width="118" height="118" /></div>
            <img src="${sourcePath}/images/ss.png" />
        </div>
    </div>    
    <div class="btmbg">
		<div class="btm">
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="${sourcePath}/images/b_1.gif" width="98" height="33" /><img src="${sourcePath}/images/b_2.gif" width="98" height="33" /><img src="${sourcePath}/images/b_3.gif" width="98" height="33" /><img src="${sourcePath}/images/b_4.gif" width="98" height="33" /><img src="${sourcePath}/images/b_5.gif" width="98" height="33" /><img src="${sourcePath}/images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
