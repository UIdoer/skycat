<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath }/static/back/js/jquery.js"></script>
<script type="text/javascript">
    $(function(){
    	$("#email").blur(function(){
  		  flag4=checkUser(/^\w+([-+.]\w+)*@\w+([-.]\\w+)*\.\w+([-.]\w+)*$/,"#email","邮箱格式不正确！");
  	  });
  	 $("#userName").blur(function(){
  		  flag1=checkUser(/^\w{2,30}$/,"#userName","用户名格式错误！");
  	  });
  	  $("#oldPwd").blur(function(){
  		  flag2=checkUser(/^\w{3,30}$/,"#oldPwd","密码格式错误！");
  	  });
  	  $("#newPwd").blur(function(){
  		  flag2=checkUser(/^\w{3,30}$/,"#newPwd","密码格式错误！");
  	  });
  	var flag=0;
  	$("#reNewPwd").blur(function(){
  		  flag=checkRePwd(/^\w{3,30}$/,"#reNewPwd");
  		  
  	  });
  	
    	var formData = $("form").serialize();
    	$("#btnEmail").on("click",function(){
    		var email=$("#email").val();
    		var userId=${userId};
    		$.ajax({
				url:'${basePath}/user/doSendMail',
				type:'get',
				data:{"email":email,
					  "userId":userId
					},
				success:function(data){
					if (data.result==1) {
						$("#result_msg").text("");
						alert("邮箱验证发送成功！请输入收到的验证信息！");
						}else{
							$("#result_msg").text("系统未检测到您的邮箱！");
						}	
				  }
			  });
    	   });
    	$("#emailVerify").on("click",function(){
    		var strMsg=$("#strVerify").val();
    		$.ajax({
				url:'${basePath}/user/doMailVerify',
				type:'get',
				data:{"strMsg":strMsg},
				success:function(data){
					if (data.result==1) {
						$("#result_msg").text("");
						$(".textBox").removeAttr("readonly");
						alert("邮箱验证成功！");
						}else{
							$("#result_msg").text("您输入的验证信息错误！");
						}	
				  }
			  });
    	   });
    	 
    	
    		$(".tdBtn").on("click",function(){
    			var email=$('#email').val();
    			var userName=$('#userName').val();
    			var oldPwd=$('#oldPwd').val();
    			var newPwd=$('#newPwd').val();
        			if(email&&userName&&oldPwd&&newPwd!=null){
        				$.ajax({
            				url:'${basePath}/user/doRevisePwd',
            				type:'post',
            				data:{
            					"userName":userName,
            					"userPassword":oldPwd,
            					"email":email,
            					"newPwd":newPwd
            					},
            				success:function(data){
            					if (data.result==1){
            						$("#result_msg").text("");
            						alert("您已修改密码成功，快去登录吧！");
            						location="${basePath}/user/toLogin";
            						}else if(data.result==2){
            							$("#result_msg").text("您输入密码不正确！请重新输入！");
            						}
            					
            						else if(data.result==3){
            							$("#result_msg").text("您输入用户名不正确！请重新输入！");
            						}
            						else if(data.result==-1){
            							$("#result_msg").text("请先进行邮箱验证！");
            						}
            						else{
            							$("#result_msg").text("修改密码失败！");
            						}
            				  }
            			});
        			}else{
        				$("#result_msg").text("信息不能为空！");
        			}
    		});
    });
  //通用JQ方法对注册信息验证
    function checkUser(reg,id,text){   
		 var elementVal=$(id).val();
        if(!reg.test(elementVal)){
       	 $("#result_msg").text(text);
          return 0;
        }
        else{
       	 $("#result_msg").text("");
          return 1; 
        }
   }
	//对确认密码信息验证
    function checkRePwd(reg,id){    
		 var rePwdVal=$(id).val();
		 var pwd1=$("#newPwd").val()
        if(!reg.test(rePwdVal)){
       	 $("#result_msg").text("密码格式错误！");  
       	 return 0;
        }else if(rePwdVal!=pwd1){
       	 $("#result_msg").text("两次输入密码不一致，请重新输入！");
       	 return 0;
        }else{
       	 $("#result_msg").text("");
             return 1; 
        }
   }
</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>修改密码</em></span>
  </div>
  <table class="noborder">
  <tr style="color: red;" >
    <td style="text-align:right;"></td>
    <td id="result_msg"></td>
   </tr>
   <tr>
    <td style="text-align:right;">邮箱：</td>
    <td><input type="text" id="email" name="email" class="textBox" style="width: 163px;"/><button  id="btnEmail">验证</button></td>
   </tr>
   <tr>
    <td style="text-align:right;">邮箱收到的验证码：</td>
     <td><input type="text" id="strVerify" class="textBox"/>&nbsp;
    <button  id="emailVerify">点击验证</button></td>
   </tr>
   <tr>
    <td width="15%" style="text-align:right;">用户名：</td>
    <td><input type="text" id="userName" name="userName" class="textBox length-middle" readonly="readonly"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">旧密码：</td>
    <td><input type="text" id="oldPwd" name="userPassword" class="textBox length-middle" readonly="readonly"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">新密码：</td>
    <td><input type="password" name="newPwd" id="newPwd" class="textBox length-middle" readonly="readonly"/></td>
   </tr>
   <tr>
    <td style="text-align:right;">再次确认密码：</td>
    <td><input type="password" id="reNewPwd" name="rePwd" class="textBox length-middle" readonly="readonly"/></td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" class="tdBtn" value="保存"/></td>
   </tr>
  </table>
 </div>
</body>
</html>