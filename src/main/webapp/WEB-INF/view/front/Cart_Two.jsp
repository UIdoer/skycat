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
    	<img src="${sourcePath}/images/img2.jpg" style="margin:0 auto;width:791px;" >        
    </div>
           	<div class="content mar_20" style="width:930px">
    	<div class="two_bg">
        	<div class="two_t" style="width: 896px;height: 30px;line-height: 17px;">
            	<span class="fr"><a href="#">修改</a></span>商品列表
            </div>
            <table border="0" class="car_tab" style="width:928px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="car_th" width="550">商品名称</td>
                <td class="car_th" width="140">属性</td>
                <td class="car_th" width="150">购买数量</td>
                <td class="car_th" width="130">小计</td>
                <td class="car_th" width="140">返还积分</td>
              </tr>
              <tr>
                <td>
                    <div class="c_s_img"><img src="${sourcePath}/images/c_1.jpg" width="73" height="73"></div>
                    Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                </td>
                <td align="center">颜色：灰色</td>
                <td align="center">1</td>
                <td align="center" style="color:#ff4e00;">￥620.00</td>
                <td align="center">26R</td>
              </tr>
              <tr class="car_tr">
                <td>
                    <div class="c_s_img"><img src="${sourcePath}/images/c_2.jpg" width="73" height="73"></div>
                    Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                </td>
                <td align="center">颜色：灰色</td>
                <td align="center">1</td>
                <td align="center" style="color:#ff4e00;">￥620.00</td>
                <td align="center">26R</td>
              </tr>
              <tr>
                <td>
                    <div class="c_s_img"><img src="${sourcePath}/images/c_3.jpg" width="73" height="73"></div>
                    Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml
                </td>
                <td align="center">颜色：灰色</td>
                <td align="center">1</td>
                <td align="center" style="color:#ff4e00;">￥620.00</td>
                <td align="center">26R</td>
              </tr>
              <tr>
                <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                    商品总价：￥1899.00 ； 返还积分 56R  
                </td>
              </tr>
            </tbody></table>
            
            <div class="two_t">
            	<span class="fr"><a href="#">修改</a></span>收货人信息
            </div>
            <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="p_td" width="160">商品名称</td>
                <td width="395">海贼王</td>
                <td class="p_td" width="160">电子邮件</td>
                <td width="395">12345678@qq.com</td>
              </tr>
              <tr>
                <td class="p_td">详细信息</td>
                <td>四川省成都市武侯区</td>
                <td class="p_td">邮政编码</td>
                <td>6011111</td>
              </tr>
              <tr>
                <td class="p_td">电话</td>
                <td></td>
                <td class="p_td">手机</td>
                <td>18600002222</td>
              </tr>
              <tr>
                <td class="p_td">标志建筑</td>
                <td></td>
                <td class="p_td">最佳送货时间</td>
                <td></td>
              </tr>
            </tbody></table>

            
            <div class="two_t">
            	配送方式
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="car_th" width="80"></td>
                <td class="car_th" width="200">名称</td>
                <td class="car_th" width="370">订购描述</td>
                <td class="car_th" width="150">费用</td>
                <td class="car_th" width="135">免费额度</td>
                <td class="car_th" width="175">保价费用</td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="ch" checked="checked"></td>
                <td align="center" style="font-size:14px;"><b>申通快递</b></td>
                <td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="ch"></td>
                <td align="center" style="font-size:14px;"><b>城际快递</b></td>
                <td>运费固定</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="ch"></td>
                <td align="center" style="font-size:14px;"><b>邮局平邮</b></td>
                <td>运费固定</td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center">不支持保价</td>
              </tr>
              <tr>
              	<td colspan="6">
                	<span class="fr"><label class="r_rad"><input type="checkbox" name="baojia"></label><label class="r_txt">配送是否需要保价</label></span>
                </td>
              </tr>
            </tbody></table> 
            
            <div class="two_t">
            	支付方式
            </div>
            <ul class="pay">
                <li class="checked">余额支付<div class="ch_img"></div></li>
                <li>银行亏款/转账<div class="ch_img"></div></li>
                <li>货到付款<div class="ch_img"></div></li>
                <li>支付宝<div class="ch_img"></div></li>
            </ul>
            
            <div class="two_t">
            	商品包装
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="car_th" width="80"></td>
                <td class="car_th" width="490">名称</td>
                <td class="car_th" width="180">费用</td>
                <td class="car_th" width="180">免费额度</td>
                <td class="car_th" width="180">图片</td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="pack" checked="checked"></td>
                <td><b style="font-size:14px;">不要包装</b></td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center"></td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="pack"></td>
                <td><b style="font-size:14px;">精品包装</b></td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center"><a href="#" style="color:#ff4e00;">查看</a></td>
              </tr>
            </tbody></table> 
            
            <div class="two_t">
            	祝福贺卡
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td class="car_th" width="80"></td>
                <td class="car_th" width="490">名称</td>
                <td class="car_th" width="180">费用</td>
                <td class="car_th" width="180">免费额度</td>
                <td class="car_th" width="180">图片</td>
              </tr>
              <tr>
              	<td align="center"><input type="checkbox" name="wish" checked="checked"></td>
                <td><b style="font-size:14px;">不要贺卡</b></td>
                <td align="center">￥15.00</td>
                <td align="center">￥0.00</td>
                <td align="center"></td>
              </tr>
              <tr>
              	<td align="center" style="border-bottom:0; padding-bottom:0;"><input type="checkbox" name="wish"></td>
                <td style="border-bottom:0; padding-bottom:0;"><b style="font-size:14px;">祝福贺卡</b></td>
                <td align="center" style="border-bottom:0; padding-bottom:0;">￥15.00</td>
                <td align="center" style="border-bottom:0; padding-bottom:0;">￥0.00</td>
                <td align="center" style="border-bottom:0; padding-bottom:0;"><a href="#" style="color:#ff4e00;">查看</a></td>
              </tr>
              <tr valign="top">
              	<td align="center"></td>
                <td colspan="4">
                	<span class="fl"><b style="font-size:14px;">祝福语：</b></span>
                    <span class="fl"><textarea class="add_txt" style="width:860px; height:50px;"></textarea></span>
                </td>
              </tr>
            </tbody></table> 
            
            <div class="two_t">
            	其他信息
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td width="145" align="right" style="padding-right:0;"><b style="font-size:14px;">使用红包：</b></td>
                <td>
                	<span class="fl" style="margin-left:50px; margin-right:10px;">选择已有红包</span>
                    <input type="hidden" name="city"><div class="jslct" style="z-index: 0;"><div class="jslct_t"><em>请选择</em></div><dl style="width: 69px; overflow-x: hidden; overflow-y: auto; display: none;"><dd val="0" class="noborder jslcted" style="width: 61px;">请选择</dd><dd val="1" style="width: 61px;">50元</dd><dd val="2" style="width: 61px;">30元</dd><dd val="3" style="width: 61px;">20元</dd><dd val="4" style="width: 61px;">10元</dd></dl></div>
                    <span class="fl" style="margin-left:50px; margin-right:10px;">或者输入红包序列号</span>
                    <span class="fl"><input type="text" value="" class="c_ipt" style="width:220px;">
                    <span class="fr" style="margin-left:10px;"><input type="submit" value="验证红包" class="btn_tj"></span>
                </span></td>
			  </tr>
              <tr valign="top">
                <td align="right" style="padding-right:0;"><b style="font-size:14px;">订单附言：</b></td>
                <td style="padding-left:0;"><textarea class="add_txt" style="width:860px; height:50px;"></textarea></td>
              </tr>
              <tr>
              	<td align="right" style="padding-right:0;"><b style="font-size:14px;">缺货处理：</b></td>
                <td>
                	<label class="r_rad"><input type="checkbox" name="none" checked="checked"></label><label class="r_txt" style="margin-right:50px;">等待所有商品备齐后再发</label>
                    <label class="r_rad"><input type="checkbox" name="none"></label><label class="r_txt" style="margin-right:50px;">取下订单</label>
                    <label class="r_rad"><input type="checkbox" name="none"></label><label class="r_txt" style="margin-right:50px;">与店主协商</label>
                </td>
              </tr>
            </tbody></table>
            
            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td align="right">
                	该订单完成后，您将获得 <font color="#ff4e00">1815</font> 积分 ，以及价值 <font color="#ff4e00">￥0.00</font> 的红包 <br>
                    商品总价: <font color="#ff4e00">￥1815.00</font>  + 配送费用: <font color="#ff4e00">￥15.00</font>
                </td>
              </tr>
              <tr height="70">
                <td align="right">
                	<b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">￥2899</span></b>
                </td>
              </tr>
              <tr height="70">
                <td align="right"><a href="#"><img src="${sourcePath}/images/btn_sure.gif"></a></td>
              </tr>
            </tbody></table>

            
        	
        </div>
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
