<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>站点设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="settings"></i><em>发货消息</em></span>
  </div>
  
  <form action="${basePath }/message/sendSalesPromotionMsg" method="post">
  <table class="noborder">
   <tr>
    <td style="width:15%;text-align:right;"><b>消息标题：</b></td>
    <td><input name="messageTitle" type="text" class="textBox length-long"/>${msg }</td>
   </tr>
   
    <td style="text-align:right;"><b>促销信息：</b></td>
    <td>
     <textarea name="messageInfo" class="textarea"></textarea>
    </td>
   </tr>
   <tr>
    <td  style="text-align:right;"></td>
    <td><input type="submit" value="保存" class="tdBtn"/></td>
   </tr>
  </table>
  </form>
  
 </div>
</body>
</html>