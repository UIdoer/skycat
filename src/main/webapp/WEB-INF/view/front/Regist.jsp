<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${basePath}/static/front/css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    <script type="text/javascript" src="${basePath }/static/front/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="${basePath }/static/front/js/jquery.bxslider_e88acd1b.js"></script>
 
    <script type="text/javascript" src="${basePath }/static/front/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/menu.js"></script>    
        
	<script type="text/javascript" src="${basePath }/static/front/js/select.js"></script>
    
	<script type="text/javascript" src="${basePath }/static/front/js/lrscroll.js"></script>
    
    <script type="text/javascript" src="${basePath }/static/front/js/iban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/fban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/f_ban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/mban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/bban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/hban.js"></script>
    <script type="text/javascript" src="${basePath }/static/front/js/tban.js"></script>

	<script type="text/javascript" src="${basePath }/static/front/js/lrscroll_1.js"></script>
    <style type="text/css">
           #codeImg{
               margin-bottom:-15px;
               padding:0px  10px;
            }
           .err{
                display:none;
				margin:10px;
				height: 25px;
			}
			.error{
			    width: 316px;
				line-height: 20px;
				margin-bottom: 5px;
				background-color: #ffebeb;
				border: 1px solid  #faccc6;
			    display:block;
				height: 20px; 
			}
			.error b{
				display: block;
				height: 25px;
				width: 20px;
				z-index:99;
				position: absolute; 
				background-image: url(${basePath }/static/front/images/error-icons-new.png);
				background-repeat: no-repeat;
				background-position: -100px -47px;
			}
			.error span{
				
				margin-left: 25px;
				/* display: block; */
				line-height: 24px;
				color: red;
				/* word-break: break-all; */
			    word-wrap: break-word;
			} 
    </style>
    <script type="text/javascript">
      $(function(){
    	  
    	  
    	  //验证码刷新
    	  $("#codeImg").on("click",function(){
    		 $(this).attr("src","${basePath}/keptcha.jpg?"+new Date());
    	  });
    	   $("#codeReflesh").on("click",function(){
    		  $("#codeImg").attr("src","${basePath}/keptcha.jpg?"+new Date());
    	  });
    	   
    	   var flag1=0,flag2=0,flag3=0,flag4=0,flag5=0,flag6=0,flag7=0;
       	//用户输入校验
      	  $("#username").blur(function(){
      		  flag1=checkUser(/^\w{2,30}$/,"#username","用户名错误！");
      	  });
      	  $("#pwd").blur(function(){
      		  flag2=checkUser(/^\w{3,30}$/,"#pwd","密码错误！");
      	  });
      	  $("#re_pwd").blur(function(){
      		  flag3=checkRePwd(/^\w{3,30}$/,"#re_pwd");
      		  
      	  });
      	  $("#email").blur(function(){
      		  flag4=checkUser(/^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/,"#email","邮箱格式不正确！");
      	  });
      	  $("#phone").blur(function(){
      		  flag5=checkUser(/^(1[3|5|8]{1}\d{9})$/,"#phone","手机号码错误！");
      		  
      	  });
      	 /*  $("#code").blur(function(){
      		  var code=$("#code").val();
      	      var codeImg=$("#codeImg").val();
      	      if(code!=codeImg){
      	        	 $("#reg_err").text("验证码错误！");
      	        	 $("#err").remove("display");
      	        	 $(this).css("border","1px solid #f64e04");
      	        	 console.log(code,codeImg);
      	        	 flag6=false;
      	         }else{
      	        	 $("#reg_err").text("");
      	        	 $(this).css("border","1px solid green");
      	        	 $("#err").css("display","none");
      	        	 console.log(code,codeImg);
      	        	 flag6=true; 
      	        	 
      	         }
      	  }); */
      	  $("#checkbox").on("click",function(){
      		  if($(this).is(":checked")){        
      			  flag7=1;
      		     }
      		    else
      		    	flag7=0;
      	  });
    	/*  checkReg(res);
    	 console.log(checkReg(res)); */
    	$("#btn_reg").click(function() {
    		var res=flag1&&flag2&&flag3&&flag4&&flag5&&flag7;
    			//$("input").trigger("select");
    			if (res==1) {
    				$("form")[0].submit();
    			}
    		})
      });
      
     function checkReg(res){
      if (res==1) {
    	  console.log(res);
    	  $("#rform").submit();
		} else {
			console.log(res);
			return false;
		}
		   
		}
     //通用JQ方法对注册信息验证
     function checkUser(reg,id,text){   
		 var elementVal=$(id).val();
         if(!reg.test(elementVal)){
        	 $("#reg_err").text(text);
        	 $("#err").css("display","contents");
        	 $(id).css("border","1px solid #f64e04");
           return 0;
         }
         else{
        	 $("#reg_err").text("");
        	 $("#err").css("display","none");
        	 $(id).css("border","1px solid green");
           return 1; 
         }
    }
     //对确认密码信息验证
     function checkRePwd(reg,id){    
		 var rePwdVal=$(id).val();
		 var pwd1=$("#pwd").val()
         if(!reg.test(rePwdVal)){
        	 $("#reg_err").text("密码格式错误！");  
        	 $("#err").css("display","contents");
        	 $(id).css("border","1px solid #f64e04");
        	 /* console.log(pwd1); */
        	 return 0;
         }else if(rePwdVal!=pwd1){
        	 $("#reg_err").text("两次输入密码不一致，请重新输入！");
        	 $("#err").css("display","contents");
        	 $(id).css("border","1px solid #f64e04");
        	 return 0;
        	 /* console.log(pwd1); */
         }else{
        	 $("#reg_err").text("");
        	 $("#err").css("display","none");
        	 $(id).css("border","1px solid green");
              return 1; 
         }
    }
   //保存结果的提示
    function showMsg() {
  	var msg = "${msg}";
     	if(msg != ""){
     		$('#reg_err').html(msg);
     		showResult();
     	}
	 }
     function showResult() {
         showResultDiv(true);
         window.setTimeout("showResultDiv(false);", 3000);
     }
     function showResultDiv(flag) {
         var divResult = document.getElementById("err");
         if (flag)
             divResult.style.display = "contents";
         else
             divResult.style.display = "none";
     } 
    </script>
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="${basePath}/user/doRegist">登录</a>&nbsp; <a href="${basePath}/user/toRegist" style="color:#ff4e00;">免费注册</a>&nbsp;</span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${basePath }/static/front/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="${basePath}/Index"><img src="${basePath }/static/front/images/logo.png" /></a></div>
    </div>
	<div class="regist">
    	<div class="log_img"><img src="${basePath }/static/front/images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
        	<form action="${basePath }/user/doRegist" method="post"   ><!-- onsubmit="return checkReg(this);" -->
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr">已有商城账号，<a href="${basePath}/user/toLogin" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
              <c:choose>
                <c:when test="${not empty msg}">
                <tr class="err" style="display:contents; " id="err">
                <td align="right"><font color="#ff4e00"></font>&nbsp;&nbsp;</td>
                <td class="error">
                   <b></b>
                   <span class="err_txt" id="reg_err">${msg}</span>
                </td>
              </tr>
                </c:when>
                <c:otherwise>
                <tr class="err" id="err">
                <td align="right"><font color="#ff4e00"></font>&nbsp;&nbsp;</td>
                <td class="error">
                   <b></b>
                   <span class="err_txt" id="reg_err"></span>
                </td>
              </tr>
                </c:otherwise>
              </c:choose>
          
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                <td><input type="text" name="userName" value="" class="l_user" id="username" placeholder="4-30字符" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                <td><input type="password" name="userPassword" value="" id="pwd" class="l_pwd" placeholder="6-18字符"/></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                <td><input type="password" name="reUserPassword" value="" id="re_pwd" class="l_pwd" /></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                <td><input type="text" name="email" value="" class="l_email"  id="email"/></td>
              </tr>
              <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                <td><input type="text" name="telephone" value="" id="phone" class="l_tel" /></td>
              </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input type="text" name="ucode"  id="code" class="l_ipt" />
                    <img src="${basePath}/keptcha.jpg" id="codeImg" alt="验证码" title="点击更换"/>
                    <a href="#" style="font-size:12px; font-family:'宋体';" id="codeReflesh" >换一张</a>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="checkbox"/></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="立即注册" class="log_btn" id="btn_reg" /></td>
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
