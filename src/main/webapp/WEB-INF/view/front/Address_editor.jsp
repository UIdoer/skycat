<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<div>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/style.css" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/city-picker.css" />
	<link type="text/css" rel="stylesheet" href="${sourcePath}/css/main.css" />
    <!--[if IE 6]>
    <script src="${sourcePath}js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
        
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
	<script type="text/javascript" src="${sourcePath}/js/select.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/plug-in.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city-picker.data.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city-picker.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/city.js"></script>
                    	
            <form action="${basePath}/user/address/PopDoEditor" method="post" id="addAddress">
            <table border="0" class="add_tab" style="width:930px;margin:0 auto 20px auto"  cellspacing="0" cellpadding="0">
              <tr>
                <td width="135px" align="right">收货地址</td>
                <td colspan="3" style="font-family:'宋体';">
                	<div style="position: relative;"><!-- container -->
					  <input name="specificAddress" value="${editor.specificAddress}" style="min-width: 360px;" data-toggle="city-picker" placeholder="点击从下拉面板中选择省/市/区/县">
					</div>
                </td>
              </tr>
              <tr>
                <td align="right">详细地址</td>
                <td style="font-family:'宋体';">
                	<input type="hidden" name="addressId" value="${editor.addressId}" />
                	<input name="receiveDetail" value="${editor.receiveDetail}" type="text"  class="add_ipt" />（必填）
                </td>
              </tr>
             
              <tr>
                <td align="right">收货人姓名</td>
                <td style="font-family:'宋体';">
                <input name="receiveName" value="${editor.receiveName}" type="text"  class="add_ipt" />（必填）
                </td>
              </tr>
                <tr>
                <td align="right">手机</td>
                <td style="font-family:'宋体';">
                	<input name="receivePhone" value="${editor.receivePhone}" type="text" class="add_ipt" />（必填）
                </td>
              </tr>
               
                <tr>
                <td align="right">是否默认:</td>
                <td style="font-family:'宋体';">
                	<input type="checkbox" ${editor.receiveDetail eq '1'?'checked':''}  name="isDefault" id="setDef"/>
                	<label for="setDef">设为默认收货地址</label>
                </td>
              </tr>
             <tr style="display:none;">
             	<td></td>
             	<td>
		            	<input type="button" id="editor" class="add_b" onclick="editor()" value="确认修改" />
             	</td>
             </tr>
            </table>
            </form>
            
		<jsp:include page="./include/UserAddressJs.jsp"></jsp:include>
           
</div>