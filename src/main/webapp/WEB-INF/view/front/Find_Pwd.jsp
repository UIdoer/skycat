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
    	.user_name{
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
    	.bar {
	            height: 35px;
             } 
    </style>
    <script type="text/javascript">
       $(function(){
    	   var verify=false;
    	   $(".bar").slideToUnlock({
   			text : '请滑动验证',
   			succText : '验证成功',
   			successFunc:function(){
   				verify=true;
   			   }
   		    });  
    	   $("#by_anster").on("click",function(){
    		   var uName=$("#username").val();
    		   $.post("${basePath}/user/doFindPwd1",
    				   {
    			         "userName":uName,
    			         "verify":verify
    		            },
    		            function(data) {
							if (data.num==1) {
								$("#result_msg").text("");
								location="${basePath}/user/toFindByAnswer?userId="+data.userId ;
							}else{
								$("#result_msg").text(data.msg);
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
		<span class="fl_tit2">/找回密码</span>
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

   <form action="">
            <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
                 <tr style="height:50;color: red;text-align: center;" valign="top">
              	<td width="100"></td>
                <td>
                    <span class="tis" id="result_msg">${msg }</span>
                </td>
              </tr>
              <tr height="30" valign="top">
              	<td width="100"></td>
                <td>
                    <span class="tis">请输入你需要找回密码的登录名</span>
                </td>
              </tr>
              <tr height="40">
                <td>用户名</td>
                <td><input type="text" name="userName"  class="user_name" id="username"/></td>
              </tr>
              <tr height="40">
                 <td class="login_info"> &nbsp; </td>
                 <td class="codeWith tis">请摁住鼠标左键，向右拖动完成验证。</td>
              </tr>
              <tr height="45">
                 <td class="login_info">&nbsp;</td>
                 <td class="codeWith"><div class="bar"></div></td>
              </tr>
              <tr>
                 <td class="login_info">&nbsp;</td>
                 <td class="codeWith tis">请选择验证方式</td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
              	<td><input type="button" value="个人密保验证" class="log_btn" id="by_anster"  /></td>
               <%--  <td><input value="个人密保验证" class="log_btn"  onclick="location.href='${basePath}/user/doFindPwd1'"/></td> --%>
              </tr>
               <tr height="60">
              	<td>&nbsp;</td>
                <td><input value="手机验证码验证" class="log_btn" /></td>
              </tr>
            </table>
            </form>
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
