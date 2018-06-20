<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<c:set var="sourcePath" value="${pageContext.request.contextPath}/static/front"></c:set>
<script>

	$("#add").click(function(){
		var pramas = $("#addAddress").serialize();
		$.post(
				"${basePath}/user/address/add",
				pramas,
				function(data){
					$.Pro(data.msg,{EndOn:function(){
						location.href = "${basePath}/user/address/list";
					}});
					
				}
			)
	});
	
	
	function setDefault(addressId,addressName,ele){
		$.Pop('确定将 "'+addressName+'" \n设置为默认收货地址?','confirm',function(){
			
			$.post(
				"${basePath}/user/address/setDefault",
				{"addressId":addressId}
				,function(data){
					$.Pro(data.msg)
					$("#msg").text(data.msg).show();
					if(data.flag){
						$(".setDefault").show();
						$(ele).hide();
						$(".default").hide();
						$(".default_"+addressId).show();
						$(".address_"+addressId).prependTo($("#addressList"));
					}
				}
			)
			
		})
	}
	function deleteAddress(addressId,addressName){
		$.Pop('确定删除 "'+addressName+'" 收货地址?','confirm',function(){
			$.post(
				"${basePath}/user/address/delete",
				{"addressId":addressId}
				,function(data){
					$.Pro(data.msg)
					if(data.flag){
						$(".address_"+addressId).remove();
					}
				}
			)
			
		})
	}
	
</script>