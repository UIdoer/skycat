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
