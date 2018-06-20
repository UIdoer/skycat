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
    
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
            
	<script type="text/javascript" src="${sourcePath}/js/lrscroll_1.js"></script>   
     
    
	<script type="text/javascript" src="${sourcePath}/js/n_nav.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${sourcePath}/css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="${sourcePath}/css/MagicZoom.css" />
    <script type="text/javascript" src="${sourcePath}/js/MagicZoom.js"></script>
    
    <script type="text/javascript" src="${sourcePath}/js/num.js">
    	
    </script>
        
    <script type="text/javascript" src="${sourcePath}/js/p_tab.js"></script>
    
    <script type="text/javascript" src="${sourcePath}/js/shade.js"></script>
	<script type="text/javascript" src="${sourcePath}/js/findprop.js"></script>
	<script type="text/javascript" src="${sourcePath}/js/addGood.js"></script>
	<script type="text/javascript" src="${sourcePath}/js/goodComment.js"></script>
   <script type="text/javascript">
		$(function(){
			findGoodComment(1, '${good.goodId}','${basePath}/');
			$(".des_choice input[type='radio']").eq(0).click();
		});
   </script>
    
<title>skyCat</title>
</head>
<body>  
<!--Begin Header Begin-->
<jsp:include page="./include/head_for_index.jsp" ></jsp:include>
<%-- <jsp:include page="Navigation.jsp" ></jsp:include> --%>
<!--End Menu End--> 
<div class="i_bg">
	<div class="postion">
		<!-- 该商品的路径 -->  
    	<span class="fl">
    	<a href="${basePath}/good/findAllGood">全部</a> > 
    	<c:forEach items="${categorys}" var="cates">
    		<!-- 遍历类目，显示到具体的产品名 -->
    		<c:if test="${good.categoryId == cates.categoryId}">
    			<c:forEach  items="${categorys}" var="catesparent">
    				<!-- 顶级类名 -->
	    			<c:if test="${cates.parentId == catesparent.categoryId}">
	    				<a href="${basePath}/good/findGoodByParrentCategoryId?parentCategoryId=${catesparent.categoryId}">${catesparent.categoryName}></a> 
	    			</c:if>
    			</c:forEach>
    		</c:if>
    		<!-- 二级类名和商品名 -->
    		<c:if test="${good.categoryId == cates.categoryId}">
    		<a href="${basePath}/good/findCategoryGood?CategoryId=${cates.categoryId}">	${cates.categoryName}</a>>${good.goodTitle}
    		</c:if>
    	</c:forEach>
    	</span>
    </div>    
    <div class="content">
    	<!-- 商品预览小图 -->                  
        <div id="tsShopContainer">
        	<c:if test="${good.img1 != null }">
            <div id="tsImgS"><a href="${upload}/${good.img1}" title="Images" class="MagicZoom" id="MagicZoom"><img src="${upload}/${good.img1}" width="390" height="390" /></a></div>
            </c:if>
            <div id="tsPicContainer">
                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                <div id="tsImgSCon">
                    <ul>
                    	<c:if test="${good.img1 != null }">
                        <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg">
                        	<img src="${upload}/${good.img1}" tsImgS="${upload}/${good.img1}" width="79" height="79" />
                        	
                        </li>
                        </c:if>
                        <c:if test="${good.img2 != null }">
                        <li onclick="showPic(1)" rel="MagicZoom">
                        	<img src="${upload}/${good.img2}" tsImgS="${upload}/${good.img2}" width="79" height="79" />
                        </li>
                        </c:if>
                       <c:if test="${good.img3 != null }">
                        <li onclick="showPic(2)" rel="MagicZoom">
                        	<img src="${upload}/${good.img3}" tsImgS="${upload}/${good.img3}" width="79" height="79" />
                        </li>
                        </c:if>
                        
                        
                      <c:if test="${good.img4!= null }">
                        <li onclick="showPic(3)" rel="MagicZoom" class="tsSelectImg">
                        	<img src="${upload}/${good.img4}" tsImgS="${upload}/${good.img4}" width="79" height="79" />
                        	
                        </li>
                        </c:if>
                        <c:if test="${good.img5 != null }">
                        <li onclick="showPic(4)" rel="MagicZoom">
                        	<img src="${upload}/${good.img5}" tsImgS="${upload}/${good.img5}" width="79" height="79" />
                        </li>
                        </c:if>
       
                    </ul>
                </div>
                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="images/loading.gif" alt="Loading..." />				
        </div>
       <!-- 提交到购物车数据开始 --> 
        <div class="pro_des">
        	<div class="des_name">
            	<p>${good.goodTitle}</p>
                
            </div>
            <div class="des_price">
            	<!-- 价格提交到购物车 -->
            	本店价格：<b id="price">￥${good.defaultPrice}</b><br /><input type="hidden"  id="hprice"/>
              	 邮费：<span><c:if test="${good.postFree==0}">包邮</c:if>
              	 		   <c:if test="${good.postFree==1}">${good.postFee}元</c:if>
              	 	 </span> 
            </div>
            <div class="des_choice">
            		
            	<c:if test="${goodPropertys!=null}">  
            		<!-- 套餐选择到购物车，提交商品属性ID -->
            		<span class="fl">套餐选择：</span>
            		<c:forEach items="${goodPropertys}" var="goodProperty" varStatus="propCount">
            			<c:choose>
            				<c:when test="${propCount.count==1 }">
            				<input type='radio' checked="checked" name='goodPropertyId' id='goodPropertyId' value='${goodProperty.goodPropertyId}' onclick='findProp("${basePath}/",${goodProperty.goodPropertyId})'   class='ch_img' />套餐${propCount.count} &nbsp;
            				</c:when>
            				<c:otherwise>
            				<input type='radio' name='goodPropertyId' id='goodPropertyId' value='${goodProperty.goodPropertyId}' onclick='findProp("${basePath}/",${goodProperty.goodPropertyId})'   class='ch_img' />套餐${propCount.count} &nbsp;
            				</c:otherwise>
            			</c:choose>
	            		
            	</c:forEach>
	            	
            	</c:if>
            	<input type="hidden" id="hgoodPropertyId" />
            	
                <ul id="propChoise"  style="display: none;">
                	<li class="checked" id="propView"> <div class="ch_img"></div></li>
                </ul>
            </div>
            <div class="des_share">
            	<div class="d_sh">
                	分享
                    <div class="d_sh_bg">
                   
                    	<a href="#"><img src="${sourcePath}/images/sh_1.gif" /></a>       
                        <a href="#"><img src="${sourcePath}/images/sh_2.gif" /></a>
                        <a href="#"><img src="${sourcePath}/images/sh_3.gif" /></a>
                        <a href="#"><img src="${sourcePath}/images/sh_4.gif" /></a>
                        <a href="#"><img src="${sourcePath}/images/sh_5.gif" /></a>
              
                    </div>
                </div>
                <div class="d_care"><a onclick="ShowDiv('MyDiv','fade')">关注商品</a></div>
            </div>
            <div class="des_join">
            	<div class="j_nums">
            		<!-- 添加到购物车的商品数量 -->
                	<input type="text" value="1" id="number" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate($(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate($(this));" class="n_btn_2" />   
                </div>
                <span class="fl"><a onclick="addGood('${basePath}/')"><img src="${sourcePath}/images/j_car.png" /></a></span>
            </div>            
        </div>    
        <!-- 提交到购物车数据结束 -->
        <div class="s_brand">
        	<div class="s_brand_img"> 
        	<p style="color: purple; font-size: large;" align="center"> ${store.storeName }</p>
        	
        	</div>
            <div class="s_brand_c"><a href="${basePath}/good/findGoodByStoreId?storeId=${good.storeId}">进入品牌专区</a></div>
        </div>    
        
        
    </div>
    
    
    <div class="content mar_20">
    	<div class="l_history">
        	<div class="fav_t">用户还喜欢</div>
        	<c:forEach items="${storeGood}" begin="1" end="5" step="1" var="storeGood">
	        	<ul>
	            	<li>
	                    <div class="img"><a href="${basePath}/good/findGood?GoodId=${storeGood.goodId}"><img src="${upload}/${storeGood.img1}" width="185" height="162" /></a></div>
	                	<div class="name"><a href="${basePath}/good/findGood?GoodId=${storeGood.goodId}">${storeGood.goodTitle}</a></div>
	                    <div class="price">
	                    	<font>￥<span>${storeGood.defaultPrice}</span></font> &nbsp; 
	                    </div>
	                </li>
	        	</ul>
        	</c:forEach>
        </div>
        <div class="l_list">        	
 
            <div class="des_border">
                <div class="des_tit">
                	<ul>
                    	<li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                        <li><a href="#p_comment">商品评论</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                	
                	<table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>商品名称：${good.goodTitle}</td>
                        <td>商品编号：${good.goodId}</td>
                       <td>类型 ：<c:forEach items="${categorys}" var="goodcate">
                      				<c:if test="${good.categoryId eq goodcate.categoryId}"> ${goodcate.categoryName}</c:if> 
                       			</c:forEach>
                       	</td>
                        <td>上架时间： <fmt:formatDate value="${good.putTime}" pattern='yyyy-MM-dd' /></td>
                      </tr>
                      <tr>
                     
                       
                        <td>颜色：<c:forEach items="${goodColor}" var="goodColor" varStatus="proStatus">
                        
                        			${goodColor} <c:if test="${!proStatus.last}">,</c:if>
                        			
                        			
                        		 </c:forEach></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><span style="color: gray; font: bold;"> 原价：${good.defaultPrice}</span> </td>
                        
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>                                               
                                            
                        
                </div>
          	</div>  
            
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
               
                   
                   	<!-- 商品详情页大图 -->
                    <p align="center">
                    
                    <c:if test='${good.bigImg1 != null}'>
                    <img src='${upload}/${good.bigImg1}' width='746' height='425' /><br /><br />
                    </c:if>
                    <c:if test='${good.bigImg2 != null}'>
                    <img src='${upload}/${good.bigImg2}' width='746' height='425' /><br /><br />
                    </c:if>
                    <c:if test='${good.bigImg3 != null}'>
                    <img src='${upload}/${good.bigImg3}' width='746' height='425' /><br /><br />
                    </c:if>
                    <c:if test='${good.bigImg4 != null}'>
                    <img src='${upload}/${good.bigImg4}' width='746' height='425' /><br /><br />
                    </c:if>
                    <c:if test='${good.bigImg5 != null}'>
                    <img src='${upload}/${good.bigImg5}' width='746' height='425' /><br /><br />
                    </c:if>
                   <c:if test='${good.bigImg6 != null}'>
                    <img src='${upload}/${good.bigImg6}' width='746' height='425' /><br /><br />
                    </c:if>
					</p>
					
                    
                </div>
          	</div>  
            
            <div class="des_border" id="p_comment">
            	<div class="des_t">商品评论</div>
                
                <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="175" class="jud_per">
                    	<p>80.0%</p>好评度
                    </td>
                    <td width="300">
                    	
                    </td>
                    <td width="185" class="jud_bg">
                    	购买过${good.goodTitle}的顾客，在收到商品才可以对该商品发表评论
                    </td>
                    <td class="jud_bg">您可对已购买商品进行评价<br /><a href="${basePath}/goodComment/toGoodComment?goodId=${good.goodId}"><img src="${sourcePath}/images/btn_jud.gif" /></a></td>
                  </tr>
                </table>
                
                
                <!-- 评论内容 显示区域 ajax 实现-->		
                <table id="commenTableId" border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
              
                </table>

                	
                    
                <div  class="pages">
                    <a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
                </div>
                
          	</div>
            
            
        </div>
    </div>
    
    
    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="${sourcePath}/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="${sourcePath}/images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                    	<a href="#">查看我的关注 >></a>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="#" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    
    
    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="${sourcePath}/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="${sourcePath}/images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;" id='cartMsg'>宝贝已成功添加到购物车</span><br />
                    	<span id="cartNum">购物车共有该宝贝（3件）</span> &nbsp; &nbsp;<span id="count"> 合计：1120元</span>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="${basePath}/user/cart/list" class="b_sure">去购物车结算</a><a href="${basePath}/Index" class="b_buy">继续购物</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-加入购物车 End-->
    
    
    
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

<script src="${sourcePath}/js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>