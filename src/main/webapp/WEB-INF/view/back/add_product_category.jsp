<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
$(function (){

	$("#p1Id").val("${goodProperty.p1Id}");
	$("#p2Id").val("${goodProperty.p2Id}");
	$("#p1Value").val("${goodProperty.p1Value}");
	$("#p2Value").val("${goodProperty.p2Value}");
	$("#stock").val("${goodProperty.stock}");
	$("#price").val("${goodProperty.price}");
	
	
});

</script>

</head>
<body>
<div class="wrap">
	<div class="page-title">
    <span class="modular fl"><i class="add"></i><em>规格编辑</em></span>
  </div>
<c:if test="${empty  goodProperty  }">
	<form action="${basePath }/storeGood/addProductCategory?goodId=${good.goodId}&goodName=${good.goodTitle}&gpid=${gpid}" method="post" >
</c:if>
<c:if test="${not empty  goodProperty  }">
	<form action="${basePath }/storeGood/updataProductCategory?goodId=${good.goodId}&goodName=${good.goodTitle}&gpid=${gpid}" method="post" >
</c:if>

  <table class="list-style">
  
  <tr>
    <td style="text-align:right;width:15%;">规格1类别：</td>
    <td><select id="p1Id" name="p1Id">
 			<c:forEach items="${propertys }" var="property">
 			<option value="${property.propertyId }">${property.propertyName }</option>   
 		</c:forEach>    
    </select>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">规格1：</td>
    <td><input id="p1Value" name="p1Value" type="text" class="textBox length-long"/></td>
   </tr>
    <tr>
    <td style="text-align:right;width:15%;">规格2类别：</td>
    <td><select id="p2Id" name="p2Id">
 		<c:forEach items="${propertys }" var="property">
 			<option value="${property.propertyId }">${property.propertyName }</option>   
 		</c:forEach>   
    </select> </td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">规格2：</td>
    <td><input id="p2Value" name="p2Value" type="text" class="textBox length-long"/></td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">价格：</td>
    <td><input id="price" name="price" type="text" class="textBox length-long"/></td>
   </tr>
   <tr>
    <td style="text-align:right;width:15%;">库存：</td>
    <td><input id="stock" name="stock" type="text" class="textBox length-long"/></td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" value="保存" class="tdBtn"/></td>
   </tr>
   
  </table>
  </form>
  </div>
</body>
</html>