<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>

<div id="addressList">
<c:forEach items="${UserAddress}" var="address">
		<c:if test="${address.isDefault eq '1'}">
			<div class="address address_${address.addressId}">
				<p class="default default_${address.addressId}" style="${address.isDefault eq '0'?'display:none;':'display:block;'}color:#ff4e00;">默认地址</p>
            	<div class="a_close"><img  onclick="deleteAddress(${address.addressId},'${address.receiveName} , ${address.receiveDetail}')" src="${sourcePath}/images/a_close.png" /></div>
            	 <table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td>收货人：${address.receiveName} ${address.receivePhone} 收货地址：${address.receiveDetail}</td>
	                  </tr>
                </table>
                <p align="right" >
                	<span onclick="setDefault(${address.addressId},'${address.receiveName} , ${address.receiveDetail}',this)"   class="link setDefault" style="${address.isDefault eq '1'?'display:none;':''}color:#ff4e00;">设为默认</span>
                	&nbsp; &nbsp; &nbsp; &nbsp; <a href="${basePath}/user/address/editor?addressId=${address.addressId}" style="color:#ff4e00;">编辑</a>&nbsp; &nbsp; &nbsp; &nbsp; 
                </p>

            </div>
        </c:if>
     </c:forEach>
	
      <c:forEach items="${UserAddress}" var="address">
      	<c:if test="${address.isDefault eq '0'}">
			<div class="address address_${address.addressId}">
				<p class="default default_${address.addressId}" style="${address.isDefault eq '0'?'display:none;':'display:block;'}color:#ff4e00;">默认地址</p>
            	<div class="a_close"><img  onclick="deleteAddress(${address.addressId},'${address.receiveName} , ${address.receiveDetail}')" src="${sourcePath}/images/a_close.png" /></div>
            	 <table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td>收货人：${address.receiveName} ${address.receivePhone} 收货地址：${address.receiveDetail}</td>
	                  </tr>
                </table>
                <p align="right" >
                	<span onclick="setDefault(${address.addressId},'${address.receiveName} , ${address.receiveDetail}',this)"   class="link setDefault" style="${address.isDefault eq '1'?'display:none;':''}color:#ff4e00;">设为默认</span>
                	&nbsp; &nbsp; &nbsp; &nbsp; <a href="${basePath}/user/address/editor?addressId=${address.addressId}" style="color:#ff4e00;">编辑</a>&nbsp; &nbsp; &nbsp; &nbsp; 
                </p>

            </div>
          </c:if>
     </c:forEach>
</div>