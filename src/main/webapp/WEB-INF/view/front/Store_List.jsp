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
    <script src="${sourcePath}/js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->    
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${sourcePath}/js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
            
	<script type="text/javascript" src="${sourcePath}/js/lrscroll_1.js"></script>
    
    
	<script type="text/javascript" src="${sourcePath}/js/n_nav.js"></script>    
    <script type="text/javascript" src="${sourcePath}/js/milk_ban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/paper_ban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/baby_ban.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/storegood-sort-query.js"></script>
    <script type="text/javascript">
    function findPage(pageNum){
    	location = '${basePath}/good/findGoodByStoreId?storeId=${storeId}&condition=${condition}&sort=${sort}&pageNum='+pageNum;
    }
    </script>
    
<title>skyCat</title>
</head>
<body>      
<!--End Header End--> 
<!--Begin Menu Begin-->
<jsp:include page="./include/head_for_index.jsp"></jsp:include>
<!--End Menu End--> 
<div class="i_bg">
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="his_t">
            	<span class="fl">商家推广</span>
            </div>
        	<ul>
        		<c:forEach items="${be_top}" var="be_top">
        			<li>
                    <div class="img"><a href="${basePath}/good/findGood?GoodId=${be_top.goodId}"><img src="${upload}/${be_top.img1}" width="185" height="162" /></a></div>
                	<div class="name"><a href="${basePath}/good/findGood?GoodId=${be_top.goodId}">${be_top.goodTitle}</a></div>
                    <div class="price">
                    	<font>￥<span>${be_top.defaultPrice}</span></font> &nbsp; 
                    </div>
                </li>
        		</c:forEach>
            	
                
        	</ul>
        </div>
        <div class="l_list">
        	<table border="0" style="width:100%; margin-bottom:30px; border:1px solid #eaeaea;" cellspacing="0" cellpadding="0">
              <tr valign="top">
          
                
              </tr>
            </table>
        	<div class="list_t">
            	<span class="fl list_or">
                	<a id="defualt-key"   title="默认排序" <c:if test="${condition eq 'defualt-key'}">class='now'</c:if>  onclick="defaultSort('${basePath}/','${storeId}')">默认</a>
                	<c:choose >
                		<c:when test="${condition eq 'price-key' && sort eq 'desc'}">
                			 <a href="#" id="price-key" data-sort="asc" title="价格从低到高"  onclick="priceSort('${basePath}/','${storeId}')" <c:if test="${condition eq 'price-key'}">class='now'</c:if> >价格</a>
                		</c:when>
                		<c:otherwise>
                			<a href="#" id="price-key" data-sort="desc" title="价格从高到低"  onclick="priceSort('${basePath}/','${storeId}')" <c:if test="${condition eq 'price-key'}">class='now'</c:if> >价格</a>
                		</c:otherwise>
              
                	</c:choose>
                	
                	<c:choose>
                		<c:when test="${condition eq 'newGood-key' && sort eq 'desc'}">
                			<a href="#" id="newGood-key" data-sort="asc" title="按最远上架时间"  onclick="newGood('${basePath}/','${storeId}')" <c:if test="${condition eq 'newGood-key'}">class='now'</c:if> >新品</a>
                		</c:when>
                		<c:otherwise>
                			<a href="#" id="newGood-key" data-sort="desc" title="按最近上架时间"  onclick="newGood('${basePath}/','${storeId}')" <c:if test="${condition eq 'newGood-key'}">class='now'</c:if> >新品</a>
                		</c:otherwise>
                	
                	</c:choose>
                    
               		
                    
                </span>
                	<script type="text/javascript"></script>
                <span class="fr">共发现${currentPage.total}件</span>
            </div>
            <div class="list_c">
            	
                <ul class="cate_list">
                	<c:forEach items="${currentPage.list}" var="goodList">
	                	<li>
	                    	<div class="img"><a href="${basePath}/good/findGood?GoodId=${goodList.goodId}"><img src="${upload}/${goodList.img1}" width="210" height="185" /></a></div>
	                        <div class="price">
	                            <font>￥<span>${goodList.defaultPrice}</span></font> &nbsp; 
	                        </div>
	                        <div class="name"><a href="${basePath}/good/findGood?GoodId=${goodList.goodId}">${goodList.goodTitle}</a></div>
	                    </li>
                	</c:forEach>
                	
                </ul>
                
                <div class="pages">
                	<c:choose >
                		<c:when test="${currentPage.pageNum-1>0}">
                			<a href="#" class="p_pre" onclick="findPage('${currentPage.pageNum-1}')">上一页</a>
                		</c:when>
                		<c:otherwise>
                			<a href="#" class="p_pre" >上一页</a>
                		</c:otherwise>
                	</c:choose>
                	
                	<c:forEach items="${currentPage.navigatepageNums}" var="pageNum">
	                	<c:choose >
	                		<c:when test="${currentPage.pageNum == pageNum }">
	   						   <a href="#"   onclick="findPage('${pageNum}')" class="cur">${pageNum}</a>
	                		</c:when>
	                		<c:otherwise>
	                			<a href="#"   onclick="findPage('${pageNum}')" >${pageNum}</a>
	                		</c:otherwise>
	                	</c:choose>
                	</c:forEach>
                	<c:choose >
                		<c:when test="${currentPage.pageNum<currentPage.pages}">
                			<a href="#" class="p_pre" onclick="findPage('${currentPage.pageNum+1}')">下一页</a>
                		</c:when>
                		<c:otherwise>
                			<a href="#" class="p_pre">下一页</a>
                		</c:otherwise>
                	</c:choose>
                	
                </div>
                
                
                
            </div>
        </div>
    </div>
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
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
