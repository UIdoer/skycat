<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${basePath }/static/front/css/style.css" />
	<link type="text/css" rel="stylesheet" href="${basePath }/static/front/css/unlock.css" />
    <script type="text/javascript" src="${basePath }/static/front/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${basePath }/static/front/js/jquery.bxslider_e88acd1b.js"></script>
    
    <script type="text/javascript" src="${basePath }/static/front/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/menu.js"></script>      
	<script type="text/javascript" src="${basePath }/static/front/js/lrscroll.js"></script>
    
    <script type="text/javascript" src="${basePath }/static/front/js/iban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/fban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/f_ban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/mban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/bban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/hban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/tban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/unlock.js"></script>
	<script type="text/javascript" src="${basePath }/static/front/js/lrscroll_1.js"></script>
	<script src='http://cdn.staticfile.org/jquery/1.10.0/jquery.min.js'></script>
   <style type="text/css">
    	.fl_tit1{
    		float: left;
    		font-size: 20px;
    		color: #ff4e00;
    		font-weight: 700;
    	}
    	.fl_tit2{
    		float: left;
    		font-size: 20px;
    	}
    	.answer{
    		width:267px; 
    		height:38px; 
    		line-height:38px\9; 
    		overflow:hidden; 
    		/* background:url(${basePath}/static/front/images/i_u.png)  */
    		no-repeat 285px center; 
    		background-color:#FFF; 
    		color:#888888; 
    		font-size:14px; 
    		font-family:"Microsoft YaHei"; 
    		padding:0 40px 0 10px; 
    		border:1px solid #cccccc;
    	}
    	.tis{
    		font-size: 15px;
    	}
    	form {
    		margin-bottom: 0px;
    	}
    	.log_bg{
    		height: 600px;
    	}
    	.find_pwd{
    		width:520px;
    	    height:500px; 
    	    overflow:hidden; 
    	    background-color:#FFF; 
    	    float: left;
    	    display:block; 
    	    margin-top:40px; 
    	    margin-left:480px; 
    	    margin-bottom:10px; 
    	    -webkit-box-shadow:0 0 5px #e0e0e0; 
    	    -moz-box-shadow:0 0 5px #e0e0e0; 
    	    box-shadow:0 0 5px #e0e0e0; 
    	    -webkit-border-radius:5px; 
    	    -moz-border-radius:5px; 
    	    border-radius:5px;
    	}
    	.msg{
    	font-weight:700;
    	line-height:70;
    	margin-bottom:20px;
    	color: red;
    	text-align: center;
    	}
    </style>
    <script type="text/javascript">
      $(function(){
    	  $("#find_pwd").on("click",function(){
    		  var formData = $("form").serialize();
   		  /*  $.post("${basePath}/user/doFindByAnswer",
   				formData,
   		            function(data) {
						if (data.result==1) {
							$("#result_msg").text("");
							alert("恭喜你成功找回密码，快去登录吧！");
							location="${basePath}/user/toLogin" ;
							}else{
								$("#result_msg").text(data.msg);
							}	
				      }); */
				      $.ajax({
							url:'${basePath}/user/doFindByAnswer?userId=${userInfo.userId}',
							type:'post',
							data:formData,
							success:function(data){
								if (data.result==1) {
									$("#result_msg").text("");
									alert("您的密码是："+data.pwd+"  快去登录吧！");
									location="${basePath}/user/toLogin" ;
									}else{
										$("#result_msg").text(data.msg);
										alert(data.msg);
									}	
							  }
						});
   	         });
      });
    </script>
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">

	<div class="sou">
		<span class="fl_tit1">SkyCat</span>
		<span class="fl_tit2">/密保方式找回密码</span>
        <span class="fr">
        	<span class="fl">你好，请<a href="Login.html">登录</a>&nbsp; <a href="Regist.html" style="color:#ff4e00;">免费注册</a>&nbsp;</span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${basePath}/static/front/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg" >	
   <div class="find_pwd">
   <form >
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr  class="msg" valign="top">
              	<td width="100"></td>
                <td>${msg }</td>
              </tr>
              <tr height="50" valign="top">
              	<td width="100"></td>
                <td>您正在通过密保方式找回密码</td>
              </tr>
              <tr>
                 <td class="login_info">问 题1</td>
                 <c:choose>
                    <c:when test="${!empty userInfo.question1}">
                       <td class="codeWith tis" id="question1">${userInfo.question1}</td>
                    </c:when>
                    <c:otherwise><td class="codeWith tis">您没有设置问题1</td></c:otherwise>
                 </c:choose>
              </tr>
              <tr height="70">
                <td>回答1</td>
                <td><input type="text" name="answer1"  class="answer" /></td>
              </tr>
              <tr>
                 <td clas s="login_info">问 题2 </td>
                 <c:choose>
                    <c:when test="${!empty userInfo.question2}">
                       <td class="codeWith tis" id="question2">${userInfo.question2}</td>
                    </c:when>
                    <c:otherwise><td class="codeWith tis">您没有设置问题2</td></c:otherwise>
                 </c:choose>
              </tr>
              <tr height="70">
                <td>回答2</td>
                <td><input type="text" name="answer2"  class="answer" /></td>
              </tr>
              <tr>
                 <td class="login_info">问 题3 </td>
                <c:choose>
                    <c:when test="${!empty userInfo.question3}">
                       <td class="codeWith tis" id="question3">${userInfo.question3}</td>
                    </c:when>
                    <c:otherwise><td class="codeWith tis">您没有设置问题3</td></c:otherwise>
                 </c:choose>
              </tr>
              <tr height="70">
                <td>回答3</td>
                <td><input type="text" name="answer3"  class="answer" /></td>
              </tr>
              <tr>
                 <td class="login_info">&nbsp;</td>
                 <td class="codeWith tis">确认后点击验证</td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="找回密码" class="log_btn" id="find_pwd" /></td>
              </tr>
            </table>
            </form>
        </div>
   	
   </div>
</div>
<!--End Login End--> 
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="${basePath }/static/front/images/b_1.gif" width="98" height="33" /><img src="${basePath }/static/front/images/b_2.gif" width="98" height="33" /><img src="${basePath }/static/front/images/b_3.gif" width="98" height="33" /><img src="${basePath }/static/front/images/b_4.gif" width="98" height="33" /><img src="${basePath }/static/front/images/b_5.gif" width="98" height="33" /><img src="${basePath }/static/front/images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->    

</body>

</html>
