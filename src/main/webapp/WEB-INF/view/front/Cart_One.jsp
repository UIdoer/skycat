<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
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
	<script type="text/javascript" src="${sourcePath}/js/select.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>              
	<script type="text/javascript" src="${sourcePath}/js/n_nav.js"></script>   
    <script type="text/javascript" src="${sourcePath}/js/select.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    <script type="text/javascript" src="${sourcePath}/js/shade.js"></script>
    
<title>尤洪</title>
</head>
<body>  
<jsp:include page="./include/head_user_center.jsp"></jsp:include>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<jsp:include page="./include/aside_user_center.jsp"></jsp:include>
		<div class="m_right">
         <div class="content mar_20" style="width:930px">
	    	<img src="${sourcePath}/images/img1.jpg">        
	    </div>
		<div class="content mar_20" style="width:930px">
    	<table border="0" class="car_tab" style="width:100%; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tbody><tr>
            <td class="car_th" width="220">商品名称</td>
            <td class="car_th">属性</td>
            <td class="car_th">购买数量</td>
            <td class="car_th">小计</td>
            <td class="car_th">返还积分</td>
            <td class="car_th">操作</td>
          </tr>
          <tr>
            <td>
            	<div class="c_s_img"><img src="${sourcePath}/images/c_1.jpg" width="73" height="73"></div>
                Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
            </td>
            <td align="center">颜色：灰色</td>
            <td align="center">
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this));" class="car_btn_1">
                	<input type="text" value="1" name="" class="car_ipt">  
                    <input type="button" value="" onclick="addUpdate1(jq(this));" class="car_btn_2">
                </div>
            </td>
            <td align="center" style="color:#ff4e00;">￥620.00</td>
            <td align="center">26R</td>
            <td align="center"><a onclick="ShowDiv('MyDiv','fade')">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          <tr class="car_tr">
            <td>
            	<div class="c_s_img"><img src="${sourcePath}/images/c_2.jpg" width="73" height="73"></div>
                Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
            </td>
            <td align="center">颜色：灰色</td>
            <td align="center">
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this));" class="car_btn_1">
                	<input type="text" value="1" name="" class="car_ipt">  
                    <input type="button" value="" onclick="addUpdate1(jq(this));" class="car_btn_2">
                </div>
            </td>
            <td align="center" style="color:#ff4e00;">￥620.00</td>
            <td align="center">26R</td>
            <td align="center"><a href="#">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          <tr>
            <td>
            	<div class="c_s_img"><img src="${sourcePath}/images/c_3.jpg" width="73" height="73"></div>
                Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
            </td>
            <td align="center">颜色：灰色</td>
            <td align="center">
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this));" class="car_btn_1">
                	<input type="text" value="1" name="" class="car_ipt">  
                    <input type="button" value="" onclick="addUpdate1(jq(this));" class="car_btn_2">
                </div>
            </td>
            <td align="center" style="color:#ff4e00;">￥620.00</td>
            <td align="center">26R</td>
            <td align="center"><a href="#">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          <tr class="car_tr">
            <td>
            	<div class="c_s_img"><img src="${sourcePath}/images/c_4.jpg" width="73" height="73"></div>
                Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
            </td>
            <td align="center">颜色：灰色</td>
            <td align="center">
            	<div class="c_num">
                    <input type="button" value="" onclick="jianUpdate1(jq(this));" class="car_btn_1">
                	<input type="text" value="1" name="" class="car_ipt">  
                    <input type="button" value="" onclick="addUpdate1(jq(this));" class="car_btn_2">
                </div>
            </td>
            <td align="center" style="color:#ff4e00;">￥620.00</td>
            <td align="center">26R</td>
            <td align="center"><a href="#">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
          </tr>
          <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	<label class="r_rad"><input type="checkbox" name="clear" checked="checked"></label><label class="r_txt">清空购物车</label>
                <span class="fr">商品总价：<b style="font-size:22px; color:#ff4e00;">￥2899</b></span>
            </td>
          </tr>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="#"><img src="${sourcePath}/images/buy1.gif"></a>&nbsp; &nbsp; <a href="#"><img src="${sourcePath}/images/buy2.gif"></a>
            </td>
          </tr>
        </tbody></table>
        
    </div>

            
        </div>
    </div>
	<!--End 用户中心 End--> 
    <jsp:include page="./include/footer_user_center.jsp"></jsp:include> 
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
