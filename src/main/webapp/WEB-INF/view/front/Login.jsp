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
	<script type="text/javascript" src="${basePath }/static/front/js/unlock.js"></script>
	<script src='http://cdn.staticfile.org/jquery/1.10.0/jquery.min.js'></script>
    <style type="text/css">
            .err{
                display:none;
				margin-top:-20px;
				height: 25px;
			}
			.error{
				line-height: 20px;
				margin-left:0px;
				width: 316px;
				background-color: #ffebeb;
				border: 1px solid  #faccc6;
				display:block;
				height: 20px;
			}
			.error label{
				display: block;
				width: 30px;
				
			}
			.error b{
				display: block;
				height: 25px;
				width: 20px;
				position: absolute;
				background-image:url(${basePath }/static/front/images/error-icons-new.png);
				background-repeat: no-repeat;
				background-position: -100px -47px;
			}
			.error span{
				margin-left: 25px;
				display: block;
				line-height: 24px;
				color: red;
				/*word-break: break-all;*/
				word-wrap: break-word;	
			} 
			 .bar {
	            margin-left:0px;
	            height: 35px;
	           /*  background-color: lightskyblue; */
             } 
    </style>
    <script type="text/javascript">
    
  
       function checkLogin(reg,id,text){   
  		 var elementVal=$(id).val();
           if(!reg.test(elementVal)){
          	 $("#err_txt").text(text);
          	 $(id).css("border","1px solid #f64e04");
          	 $("#err").css("display","contents");
             return false;
           }
           else{
          	 $("#err_txt").text("");
          	 $("#err").css("display","none");
          	 $(id).css("border","1px solid green");
             return true; 
           }
      }
       
       $(function(){
    	   /* var userName=checkLogin(/^\w{4,30}$/,"#username","用户名错误");
    	   var userPassword=checkLogin(/^\w{6,30}$/,"#pwd","密码错误");
    	   $("#btn_log").on("click",function(){
    		   $.post("${basePath}/user/doLogin",
   					{
   						"userName":userName,
   						"userPassword":userPassword,
   					},
   					function(data){
   						if(data.code==0){
   							//清空错误提示位置
   							$("#err_txt").text("");
   							//校验通过
   							location = "${basePath}/index";
   						}else{
   							//校验不通过，显示错误提示
   							$("#err_txt").text(data);
   						}
   					}); 
     	  }); */
    	 //调用方法校验登录名，密码和验证码
      	  var use=false;
      	  var pwd=false;
      	  var ver=false;
      	  $("#username").blur(function(){
      		   use=checkLogin(/^\w{2,30}$/,"#username","用户名错误");
      	  });
      	  $("#pwd").blur(function(){
      		   pwd=checkLogin(/^\w{3,30}$/,"#pwd","密码错误");
      	  });
      	    $(".bar").slideToUnlock({
  			text : '请滑动验证',
  			succText : '验证成功',
  			successFunc:function(){
  				ver=true;
  			   }
  		    });  
      	  //$("#checkbox").on("click",function(){
      		//  if($(this).is(":checked")){        
      		//	   che=true;
      		//  }  else
      		 //    return false;
      	  //}); 
    	   $("#log_btn").click(function() {
   	     	 var log=use&&pwd&&ver;
   	     	console.log("log"+log);
	     			if (log) {
	     				$("form")[0].submit();
	     			} else
	     				$("#err_txt").text("请填写正确的登录信息！");
	     				return false;
	     		})
      }); 
    </script>
    <script>
    	$(function(){
    		var msg = "${msg}";
    		if(msg != ""){
    			$("#err").show();
    		}
    	})
    </script>
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<%-- <span class="fl">你好，请<a href="${basePath}/user/toLogin">登录</a>&nbsp; <a href="${basePath }/user/toRegist" style="color:#ff4e00;">免费注册</a>&nbsp;</span> --%>
            <span class="fl">&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="${basePath}/static/front/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End--> 
<!--Begin Login Begin-->
<div class="log_bg">	
    <div class="top">
        <div class="logo"><a href="${basePath}/Index"><img src="${basePath }/static/front/images/logo.png" /></a></div>
    </div>
	<div class="login">
    	<div class="log_img"><img src="${basePath }/static/front/images/l_img.png" width="611" height="425" /></div>
		<div class="log_c">
        	<form action="${basePath}/user/doLogin" method="post" onsubmit="return userLogin();">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="55">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">登录</span>
                    <span class="fr">还没有商城账号，<a href="${basePath}/user/toRegist" style="color:#ff4e00;">立即注册</a></span>
                </td>
              </tr>
              <tr class="err" id="err">
                 <td ></td>
                 <td class="error">
                      <b></b>
                	<span class="err_txt" id="err_txt">${msg}</span>
                 </td>
              </tr>
              <tr height="70">
                <td>用户名</td>
                <td><input type="text" name="userName" value="" class="l_user" id="username"/></td>
              </tr>
              <tr height="70">
                <td>密&nbsp; &nbsp; 码</td>
                <td><input type="password" name="userPassword" value="" class="l_pwd" id="pwd"/></td>
              </tr>
              <tr>
                 
                 <td class="login_info">验&nbsp; &nbsp; 证</td>
                <td class="codeWith"><div class="bar"></div></td>
              </tr>
      
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="checkbox"/></label><label class="r_txt">请保存我这次的登录信息</label>
                    </span>
                    <span class="fr"><a href="${basePath}/user/toFindPwd" style="color:#ff4e00;">忘记密码</a></span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="button" value="登录" class="log_btn" id="log_btn" /></td>
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
<script type="text/javascript">
(function($) {
    function Slider(elem, options) {
        this.$container = elem;
        this.default = {
            width: this.$container.width() - 2,
            height: this.$container.height() - 2,
            bgColor: '#E8E8E8',
            progressColor: '#FFE97F',
            handleColor: '#fff',
            succColor: '#78D02E',
            text: 'slide to unlock',
            succText: 'ok!',
            textColor: '#000',
            succTextColor: '#000',
            successFunc: function() {}
        };
        this.options = $.extend({}, this.default, options);
        this.isSuccess = false;
    }
    Slider.prototype = {
        create: function() {
            var $container = this.$container;
            var options = this.options;
            initDOM();
            initStyle();

            function initDOM() {
                var template = '<div class="slide-to-unlock-bg"><span>' +
                    options.text +
                    '</span></div><div class="slide-to-unlock-progress"></div><div class="slide-to-unlock-handle"></div>';
                $container.html(template);
            }

            function initStyle() {
                $container.css({
                    position: 'relative',
                });
                $container.find('span').css({
                    lineHeight: options.height + 'px',
                    fontSize: options.height / 3.5,
                    color: options.textColor
                });
                $container.find('.slide-to-unlock-bg').css({
                    width: options.width + 'px',
                    height: options.height + 'px',
                    backgroundColor: options.bgColor,
                });
                $container.find('.slide-to-unlock-progress').css({
                    backgroundColor: options.progressColor,
                    height: options.height - 2 + 'px'
                });
                $container.find('.slide-to-unlock-handle').css({
                    backgroundColor: options.handleColor,
                    height: (options.height - 0) + 'px',
                    lineHeight: (options.height - 0) + 'px',
                    width: (Math.floor(options.width / 8)) + 'px',
                });
            }
        },
        bindDragEvent: function() {
            var that = this;
            var $container = this.$container;
            var options = this.options;
            var downX;
            var $prog = $container.find('.slide-to-unlock-progress'),
                $bg = $container.find('.slide-to-unlock-bg'),
                $handle = $container.find('.slide-to-unlock-handle');
            var succMoveWidth = $bg.width() - $handle.width();
            $handle.on('mousedown', null, mousedownHandler);

            function getLimitNumber(num, min, max) {
                if (num > max) {
                    num = max;
                } else if (num < min) {
                    num = min;
                }
                return num;
            }

            function mousedownHandler(event) {
                downX = event.clientX;
                $(document).on('mousemove', null, mousemoveHandler);
                $(document).on('mouseup', null, mouseupHandler);
            }

            function mousemoveHandler(event) {
                var moveX = event.clientX;
                var diffX = getLimitNumber(moveX - downX, 0, succMoveWidth);
                $prog.width(diffX);
                $handle.css({
                    left: diffX
                });
                if (diffX === succMoveWidth) {
                    success();
                }
                event.preventDefault();
            }

            function mouseupHandler(event) {
                if (!that.isSuccess) {
                    $prog.animate({
                        width: 0
                    }, 100);
                    $handle.animate({
                        left: 0
                    }, 100);
                }
                $(document).off('mousemove', null, mousemoveHandler);
                $(document).off('mouseup', null, mouseupHandler);
            }

            function success() {
                $prog.css({
                    backgroundColor: options.succColor,
                });
                $container.find('span').css({
                    color: options.succTextColor
                });
                that.isSuccess = true;
                $container.find('span').html(options.succText);
                $handle.off('mousedown', null, mousedownHandler);
                $(document).off('mousemove', null, mousemoveHandler);
                setTimeout(function() {
                    options.successFunc && options.successFunc();
                }, 30);
            }
        }
    };
    $.fn.extend({
        slideToUnlock: function(options) {
            return this.each(function() {
                var slider = new Slider($(this), options);
                slider.create();
                slider.bindDragEvent();
            });
        }
    });
})(jQuery);

</script>
</body>
</html>
