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
        
    <script type="text/javascript" src="${sourcePath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${sourcePath}/js/menu.js"></script>    
        
	<script type="text/javascript" src="${sourcePath}/js/select.js"></script>
      
<title>尤洪</title>
 <script type="text/javascript">
 $(function () {
	 $("#btnPhoto").on("click",function(){
		 $("#m_des").css("display","block");
	 });
	 /* $("#btnUp").on("click",function(){
		 //var file=$("#file").val();
		 $.ajax({
				url:"${basePath}/user/doPhoto",
				type:"post", 
				data:new FormData($('#uploadForm')[0]),
				success:function(data){
				alert(data);
				}
			  });
	 }); */
 	$("#update_user").on("click",function(){
 		var formData = $("form").serialize();
 		$.ajax({
				url:"${basePath}/user/doUserUpdate",
				type:"post", 
				data:formData,
				success:function(data){
					if (data.result==1) {
						alert("修改成功！");
						}else{
							alert("修改失败请重试！");
						}
				  }
			  });
 	   }); 
});
 function getObjectURL(file) {  
     var url = null;  
     if (window.createObjectURL != undefined) {  
         url = window.createObjectURL(file);  
     }  
     else if (window.URL != undefined) {  
         url = window.URL.createObjectURL(file);  
     }  
     else if (window.webkitURL != undefined) {  
         url = window.webkitURL.createObjectURL(file);  
     }  
     return url;  
 }  
 $("#txtImagePath").change(function (event) {  
     var imgpath = getObjectURL(this.files[0]);  
     $("#BackgroundImageList").show();  
     $("#hotelLogo").attr("src", imgpath);  
 });  
</script> 
</head>
<body>  
<jsp:include page="./include/head_user_center.jsp"></jsp:include>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<jsp:include page="./include/aside_user_center.jsp"></jsp:include>
		<div class="m_right">
        	<div class="m_des">
            	<table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="115"><img src="${upload}/${userInfo.picture}" width="90" height="90"/></td>
                    <td>
                    	<div class="m_user">${userInfo.userName}</div>
                        <p>
                            等级：普通用户 <br/>
                            <font color="#ff4e00">您还差 270 积分达到 分红100</font><br />
                            上一次登录时间: 2015-09-28 18:19:47<br />
                            您还没有通过邮件认证 <a href="#" style="color:#ff4e00;">点此发送认证邮件</a>
                        </p>
                        <div class="m_notice">
                        	用户中心公告！
                        </div>
                    </td>
                  </tr>
                </table>
                <table style="float: left; padding-left: 20px;">
                  <tr>
                     <td ><button  id="btnPhoto">点击更改头像</button></td>
                  </tr>
                  <tr style="margin-top: 5px;">
                     <td><button onclick="location.href='${basePath}/user/toRevisePwd?userId=${userInfo.userId}'"> 修改密码 </button></td>
                  </tr>
                </table>	
            </div>
            <!--修改图片  -->
            <div class="m_des" id="m_des" style="z-index: 999;display: none;">
            <form action="${basePath}/user/doPhoto?userId=${userInfo.userId}"  method="post" id="uploadForm" enctype="multipart/form-data" >
            	<table border="0" style="float: left; padding-left: 20px; width:870px; line-height:22px;"  cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您现在的头像是：</td>
                  </tr>
                   <tr valign="top">
                     <c:if test="${not empty userInfo.picture}">
                         <td width="115"><img src="${upload}/${userInfo.picture}" width="90" height="90"/></td>
                     </c:if>
                     <c:if test="${empty userInfo.picture}">
                        <td>您未保存任何头像</td>
                     </c:if>
                     </tr>
                  <tr>
                     <td><input name="file" type="file" id="file"  /></td>
                  </tr>
                  <tr> 
                    <td ><input id="btnUp" type="submit" value="上传图片为我的头像"></input></td>
                   </tr>
                </table>
                </form>
              <%--   <c:if test="${path!=null}">
                   <img   src="${basePath}{path}" id='imgShow' alt='缩略图'  style="width:90,height:90;"></td> 
                </c:if>   --%>
            </div>
            <div class="mem_t">资产信息</div>
            <table border="0" class="mon_tab" style="width:870px; margin-bottom:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="33%">用户等级：<span style="color:#555555;">普通会员</span></td>
                <td width="33%">消费金额：<span>￥200元</span></td>
                <td width="33%">返还积分：<span>99R</span></td>
              </tr>
              <tr>
                <td>账户余额：<span>￥200元</span></td>
                <td>红包个数：<span style="color:#555555;">3个</span></td>
                <td>红包价值：<span>￥50元</span></td>
              </tr>
              <tr>
                <td colspan="3">订单提醒：
                	<font style="font-family:'宋体';">待付款(<span>0</span>) &nbsp; &nbsp; &nbsp; &nbsp; 待收货(<span>2</span>) &nbsp; &nbsp; &nbsp; &nbsp; 待评论(<span>1</span>)</font>
                </td>
              </tr>
            </table>

            <div class="mem_t">账号信息</div>
            
            <form>
            <table border="0" class="mon_tab" style="width:870px; margin-bottom:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">用户ID：<input name="userId" id="userId" value="${userInfo.userId }" style="color:#555555;"></input></td>
                <td width="60%">用户名：<span style="color:#555555;" >${userInfo.userName }</span></td>
              </tr>
              <tr>
                <td>密&nbsp; &nbsp; 码：<input type="password" name="userPassword" value="${userInfo.userPassword}" readonly="readonly"></input>
                     &nbsp; &nbsp;</td>
                <td>性&nbsp; &nbsp; 别：
                    <c:if test="${userInfo.sex==0}">
                       <span style="color:#555555;">男</span>
                    </c:if>
                     <c:if test="${userInfo.sex==1}">
                       <span style="color:#555555;">女</span>
                    </c:if>
                </td>
              </tr>
              <tr>
                <td>电&nbsp; &nbsp; 话：<input type="text" name="telephone" value="${userInfo.telephone}"></input></td>
                <td>邮&nbsp; &nbsp; 箱：<input type="text" name="email" value="${userInfo.email}"></input></td>
              </tr>
              <tr>
                <td>问&nbsp;题1：<input type="text" name="question1" value="${userInfo.question1}"></input></td>
                <td>答&nbsp;案1：<input type="text" name="answer1" value="${userInfo.answer1}"></input></td>
              </tr>
              <tr>
                <td>问&nbsp;题2：<input type="text" name="question2" value="${userInfo.question2}"></input></td>
                <td>答&nbsp;案2：<input type="text" name="answer2" value="${userInfo.answer2}"></input></td>
              </tr>
              <tr>
                <td>问&nbsp;题3：<input type="text" name="question3" value="${userInfo.question3}"></input></td>
                <td>答&nbsp;案3：<input type="text" name="answer3" value="${userInfo.answer3}"></input></td>
              </tr>
              <tr>
                <td>
                   <input style="margin-left: 330px;width: 80px;" type="button" id="update_user" value="保&nbsp;&nbsp;存"/>
                </td>
                <td></td>
              </tr>
            </table>
           </form>
            
        </div>
    </div>
	<!--End 用户中心 End--> 
</div>
<jsp:include page="./include/footer_user_center.jsp"></jsp:include>
</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
