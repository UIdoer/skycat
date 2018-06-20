<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>

<script type="text/javascript">

//下面用于多缩略图上传预览功能
function setImagePreviews1(avalue) {
    var docObj = document.getElementById("suoluetu");
    var aa = document.getElementById("aa");
    aa.innerHTML = "";
    var fileList = docObj.files;
    for (var i = 0; i < fileList.length; i++) {            
    	aa.innerHTML += "<div style='float:left' > <img id='imag" + i + "'  width='60' height='60' class='mlr5' /> </div>";
        var imgObjPreview = document.getElementById("imag"+i); 
        if (docObj.files && docObj.files[i]) {
            //火狐下，直接设img属性
           // imgObjPreview.style.display = 'block';
          //  imgObjPreview.style.width = '150px';
           // imgObjPreview.style.height = '180px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
        }
        else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            alert(imgSrc)
            var localImagId = document.getElementById("imag" + i);
            //必须设置初始大小
          //  localImagId.style.width = "150px";
           // localImagId.style.height = "180px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            }
            catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
    }  
    return true;
}




//下面用于多图片上传预览功能
function setImagePreviews2(avalue) {
    var docObj = document.getElementById("chanpinzhutu");
    var dd = document.getElementById("dd");
    dd.innerHTML = "";
    var fileList = docObj.files;
    for (var i = 0; i < fileList.length; i++) {            
        dd.innerHTML += "<div style='float:left' > <img id='bigImg" + i + "'  /> </div>";
        var imgObjPreview = document.getElementById("bigImg"+i); 
        if (docObj.files && docObj.files[i]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '150px';
            imgObjPreview.style.height = '180px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
        }
        else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            alert(imgSrc)
            var localImagId = document.getElementById("bigImg" + i);
            //必须设置初始大小
            localImagId.style.width = "150px";
            localImagId.style.height = "180px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            }
            catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
    }  
    return true;
}

$(function (){

	$("#goodTitle").val("${good.goodTitle}");
	$("#categoryId").val("${good.categoryId}");
	$("#defaultPrice").val("${good.defaultPrice}");
	<c:if test="${good.beHot==0}">$("#beHot0").attr('checked','checked');</c:if>
	<c:if test="${good.beHot==1}">$("#beHot1").attr('checked','checked');</c:if>
	<c:if test="${good.beTop==0}">$("#beTop0").attr('checked','checked');</c:if>
	<c:if test="${good.beTop==1}">$("#beTop1").attr('checked','checked');</c:if>
	<c:if test="${good.postFree==0}">$("#postFree0").attr('checked','checked');</c:if>
	<c:if test="${good.postFree==1}">$("#postFree1").attr('checked','checked');</c:if>
	$("#postFee").val("${good.postFee}");
	
	
});



function fileCountCheck(objForm){
	  if (window.File && window.FileList) {
	   var imgsCount = objForm["suoluetu"].files.length;
	   if(imgsCount > 5||imgsCount<1){
	    window.alert('缩略图不能超过5个或者低于1个，你选择了' + imgsCount + '个');
	    return false;
	   }
	   var bigImgsCount = objForm["chanpinzhutu"].files.length;
	   if(bigImgsCount > 5||bigImgsCount<1){
		    window.alert('详情图不能超过5个或者低于1个，你选择了' + bigImgsCount + '个');
		    return false;
		   }
	  }
	  else {
	   window.alert('抱歉，你的浏览器不支持FileAPI，请升级浏览器！');
	   return false;
	  }
	  return true;
	 }
	 


</script>



<%-- 
<c:forEach    begin="0"   end="${imgs.length-1 }" var="i">
	mycars[${i }]=${imgs[i] }
</c:forEach> --%>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="add"></i><em>编辑/添加产品</em></span>
    <span class="modular fr"><a href="product_list.html" class="pt-link-btn">产品列表</a></span>
  </div>
  
  <!-- ****************************************************************************** -->
  <c:if test="${empty good }">
  <form action="${basePath }/storeGood/AddProduct" method="post" enctype="multipart/form-data" onsubmit="return fileCountCheck(this);">
  <table class="list-style">
  
   <tr>
    <td style="text-align:right;width:15%;">产品名称：</td>
    <td><input id="goodTitle" name="goodTitle" type="text" class="textBox length-long"/></td>
   </tr>
   
   <tr>
    <td style="text-align:right;">产品分类：</td>
    <td>
     <select id="categoryId" name="categoryId" class="textBox">
     <c:forEach	items="${categoryList }" var="category">
     	<optgroup label="${category.categoryName }">
     	<c:forEach items="${category.sonCategory }" var="sonCategory">
     		<option  value="${sonCategory.categoryId }">${sonCategory.categoryName }</option>
     	</c:forEach>
     	</optgroup>
     </c:forEach>
     </select>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">市场价：</td>
   
    <td>
     <input id="defaultPrice" name="defaultPrice" type="text" class="textBox length-short"/>
      
     <span>元</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">是否参加热销：</td>
    <td>
     <input type="radio" id="beHot0" name="beHot" value="0"  />
     <span>参加</span>&emsp;
      <input type="radio" id="beHot1" name="beHot" value="1"  />
     <span>不参加</span>
    </td>
   </tr>
   
    <tr>
    <td style="text-align:right;">是否参加直通车：</td>
    <td>
     <input type="radio" id="beTop0" name="beTop" value="0"  />
     <span>参加</span>&emsp;
     <input type="radio" id="beTop1" name="beTop" value="1" />
     <span>不参加</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">是否包邮：</td>
    <td>
     <input type="radio" id="postFree0" name="postFree" value="0"  />
     <span>包邮</span>&emsp;
     <input type="radio" id="postFree1" name="postFree" value="1" />
     <span>不包邮</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">邮费价格：</td>
    <td><input id="postFee" name="postFee" type="text" class="textBox length-short"/>
    <span>元</span>
    </td>
   </tr>
   
   
   <tr>
    <td style="text-align:right;">产品缩图片：</td>
    <td>
     <input name="imgs" type="file" multiple="multiple" id="suoluetu" class="hide" onchange="javascript:setImagePreviews1();" accept="image/*"/>
     <label for="suoluetu" class="labelBtnAdd">+</label>
     <div id="aa">
     
     </div>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">图片详情：</td>
    <td>
     <input name="bigImgs" type="file"  multiple="multiple" id="chanpinzhutu" class="hide" onchange="javascript:setImagePreviews2();" accept="image/*" />
     <label for="chanpinzhutu" class="labelBtn2">本地上传(最多选择5张)</label>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td>
     <div id="dd" ></div>
    </td>
   </tr>
   
   
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" value="保存商品" class="tdBtn"/></td>
   </tr>
  </table>
  </form>
  </c:if>
  <!-- ******************************************************************
  **************************************************************************** -->
  <c:if test="${!empty good }">
  <form action="${basePath }/storeGood/UpdataProduct?gId=${good.goodId}&sId=${good.storeId}" method="post" enctype="multipart/form-data"  onsubmit="return fileCountCheck(this);" >
  
  <table class="list-style">
  
   <tr>
    <td style="text-align:right;width:15%;">产品名称：</td>
    <td><input id="goodTitle" name="goodTitle" type="text" class="textBox length-long"/></td>
   </tr>
   
   <tr>
    <td style="text-align:right;">产品分类：</td>
    <td>
     <select id="categoryId" name="categoryId" class="textBox">
     <c:forEach	items="${categoryList }" var="category">
     	<optgroup label="${category.categoryName }">
     	<c:forEach items="${category.sonCategory }" var="sonCategory">
     		<option  value="${sonCategory.categoryId }">${sonCategory.categoryName }</option>
     	</c:forEach>
     	</optgroup>
     </c:forEach>
     </select>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">市场价：</td>
    <td>
     <input id="defaultPrice" name="defaultPrice" type="text" class="textBox length-short"/>
     <span>元</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">是否参加热销：</td>
    <td>
     <input type="radio" id="beHot0" name="beHot" value="0"  />
     <span>参加</span>&emsp;
      <input type="radio" id="beHot1" name="beHot" value="1"  />
     <span>不参加</span>
    </td>
   </tr>
   
    <tr>
    <td style="text-align:right;">是否参加直通车：</td>
    <td>
     <input type="radio" id="beTop0" name="beTop" value="0"  />
     <span>参加</span>&emsp;
     <input type="radio" id="beTop1" name="beTop" value="1" />
     <span>不参加</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">是否包邮：</td>
    <td>
     <input type="radio" id="postFree0" name="postFree" value="0"  />
     <span>包邮</span>&emsp;
     <input type="radio" id="postFree1" name="postFree" value="1" />
     <span>不包邮</span>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">邮费价格：</td>
    <td><input id="postFee" name="postFee" type="text" class="textBox length-short"/>
    <span>元</span>
    </td>
   </tr>
   
   
   <tr>
    <td style="text-align:right;">产品缩图片：</td>
    <td>
     <input name="imgs" type="file" multiple="multiple" id="suoluetu" class="hide" onchange="javascript:setImagePreviews1();"  accept="image/*"/>
     <label for="suoluetu" class="labelBtnAdd">+</label>
     <div id="aa">
      <c:if test="${good.img1!=null }">
     <div style="float:left" > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img1 }" id='imag1'  width='60' height='60' class='mlr5' />
      </div>
     </c:if>
     <c:if test="${good.img2!=null }">
     <div style="float:left" > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img2 }" id='imag2'  width='60' height='60' class='mlr5' />
      </div>
     </c:if>
     <c:if test="${good.img3!=null }">
     <div style="float:left" > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img3 }" id='imag3'  width='60' height='60' class='mlr5' />
      </div>
     </c:if>
     <c:if test="${good.img4!=null }">
     <div style="float:left" > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img4 }" id='imag4'  width='60' height='60' class='mlr5' />
      </div>
     </c:if>
     <c:if test="${good.img5!=null }">
     <div style="float:left" > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img5 }" id='imag5'  width='60' height='60' class='mlr5' />
      </div>
     </c:if>
     </div>
    </td>
   </tr>
   
   <tr>
    <td style="text-align:right;">图片详情：</td>
    <td>
     <input name="bigImgs" type="file"  multiple="multiple" id="chanpinzhutu" class="hide" onchange="javascript:setImagePreviews2();"  accept="image/*" />
     <label for="chanpinzhutu" class="labelBtn2">本地上传(最多选择5张)</label>
    </td>
   </tr>
   <tr>
    <td style="text-align:right;"></td>
    <td>
     <div id="dd" >
     <c:if test="${good.bigImg1!=null }">
     <div  > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.bigImg1 }" id='imag1'   />
      </div>
     </c:if>
     <c:if test="${good.bigImg2!=null }">
     <div  > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.bigImg2 }" id='imag2'   />
      </div>
     </c:if>
     <c:if test="${good.bigImg3!=null }">
     <div  > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.bigImg3 }" id='imag3'   />
      </div>
     </c:if>
     <c:if test="${good.bigImg4!=null }">
     <div  > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.bigImg4 }" id='imag4'   />
      </div>
     </c:if>
     <c:if test="${good.bigImg5!=null }">
     <div  > 
     <img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.bigImg5 }" id='imag5'   />
      </div>
     </c:if>
     </div>
    </td>
   </tr>
   
   
   <tr>
    <td style="text-align:right;"></td>
    <td><input type="submit" value="保存商品" class="tdBtn"/></td>
   </tr>
   
  </table>
  </form>
  </c:if>
 <!-- *********************************************** -->
  <!--  <form onsubmit="return fileCountCheck(this);">
 <input type="file" name="mulUp[]" multiple="multiple" required="required" />
 <input type="submit" />
  </form>
  <script type="text/javascript">
 function fileCountCheck(objForm){
  if (window.File && window.FileList) {
   var fileCount = objForm["mulUp[]"].files.length;
   if(fileCount > 10){
    window.alert('文件数不能超过10个，你选择了' + fileCount + '个');
   }
   else {
    window.alert('符合规定');
   }
  }
  else {
   window.alert('抱歉，你的浏览器不支持FileAPI，请升级浏览器！');
  }
  return false;
 }
  </script> -->
 <!-- *********************************************** -->
 </div>
</body>
</html>