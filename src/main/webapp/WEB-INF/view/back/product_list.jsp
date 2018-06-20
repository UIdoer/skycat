<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${basePath }/static/back/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/static/back/js/jquery.js"></script>
<script src="${basePath }/static/back/js/public.js"></script>

<script type="text/javascript">

		function findPage(pageNum,pageSize,status){
			var str2="${status}";
			
			var str="${basePath}/storeGood/accordingStatusFindProduct?pageNum="+pageNum+"&pageSize"+pageSize+"&status="+status;
			location=str;
			//console.log(str);
			//console.log(str2);
		}
		
        function changeStatus(){
        	
			var status= $("#status").val();
			var url="${basePath}/storeGood/accordingStatusFindProduct?status="+status;
			var ca= $("#changestatuses").attr('action');
			 $("#changestatuses").attr('action',url);    //通过jquery为action属性赋值
		        $("#changestatuses").submit();
        	//$.get(url,{},function(data){});
		        //console.log(url);
		        //console.log(ca);
        }
        
        
        $(function (){
        	$("#status").val("${status}");
        });

</script>

</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i></i><em>产品列表</em></span>
    <span class="modular fr"><a href="${basePath }/storeGood/toAddProduct" class="pt-link-btn">+添加商品</a></span>
  </div>
  <div class="operate">
  
   <form id="changestatuses" name="changestatuses" method="post" action="">
   <span>按货物状态查看</span><br />
   		<select id="status" name="status"  onchange="changeStatus();">
   		<option value="5">全部</option>
    	<option value="0">正常</option>
    	<option value="1">已经下架</option>
    	<option value="2">已经删除</option>
    	<option value="3">等待审核</option>
    	<option value="4">待修改</option>
    </select>
   </form>
  </div>
  <table class="list-style Interlaced">
   <tr>
    <th>ID编号</th>
    <th>产品</th>
    <th>名称</th>
    <th>市场价</th>
    <th>库存</th>
    <th>状态</th>
    <th>操作</th>
   </tr>
   
   <c:forEach items="${goodList }" var="good">
   <tr>
    <td>
     <span>
     <input type="checkbox" class="middle children-checkbox"/>
     <i>${good.good_id }</i>
     </span>
    </td>
    <td class="center pic-area"><img src="https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/${good.img1 }" class="thumbnail"/></td>
    <td class="td-name">
      <span class="ellipsis td-name block">${good.good_title }</span>
    </td>
    <td class="center">
     <span>
      <i>￥</i>
      <em>${good.default_price }</em>
     </span>
    </td>
    <td class="center">
     <span>
      <em>${good.stock }</em>
      <i>件</i>
     </span>
    </td>
    <td class="center">
     <span>
      <c:if test="${good.status==0 }"><em>正常</em></c:if>
      <c:if test="${good.status==1 }"><em>已经下架</em></c:if>
      <c:if test="${good.status==2 }"><em>已经删除</em></c:if>
      <c:if test="${good.status==3 }"><em>等待审核</em></c:if>
      <c:if test="${good.status==4 }"><em>审核未通过</em></c:if>
     </span>
    </td>
    <td class="center">
     <c:if test="${good.status==0 or good.status==5}">
     	<a href="${basePath }/storeGood/toStoreProductDetail?goodId=${good.good_id }&goodName=${good.good_title }" title="查看" target="_blank"><img src="${basePath }/static/back/images/icon_view.gif"/></a>
     <a href="${basePath }/storeGood/toEditProduct?goodId=${good.good_id }&goodName=${good.good_title }" title="编辑"><img src="${basePath }/static/back/images/icon_edit.gif"/></a>
     <a href="${basePath }/storeGood/downProduct?goodId=${good.good_id }&status=${status}&judge=1" title="下架"><img src="${basePath }/static/back/images/icon_down.png"/></a>
     <a href="${basePath }/storeGood/downProduct?goodId=${good.good_id }&status=${status}&judge=2" title="删除"><img src="${basePath }/static/back/images/icon_drop.gif"/></a>
     </c:if>
     <c:if test="${good.status==1 or good.status==4}">
     	<a href="${basePath }/storeGood/toStoreProductDetail?goodId=${good.good_id }&goodName=${good.good_title }" title="查看" target="_blank"><img src="${basePath }/static/back/images/icon_view.gif"/></a>
     <a href="${basePath }/storeGood/toEditProduct?goodId=${good.good_id }&goodName=${good.good_title }" title="编辑"><img src="${basePath }/static/back/images/icon_edit.gif"/></a>
     <a href="${basePath }/storeGood/downProduct?goodId=${good.good_id }&status=${status}&judge=2" title="删除"><img src="${basePath }/static/back/images/icon_drop.gif"/></a>
     </c:if>
     <c:if test="${good.status==3 }"></c:if>
    </td>
   </tr>
   </c:forEach>
   
  </table>
  <!-- BatchOperation -->
 <!--  <div style="overflow:hidden;">
      Operation
	  <div class="BatchOperation fl">
	   <input type="checkbox" id="del"/>
	   <label for="del" class="btnStyle middle">全选</label>
	   <input type="button" value="批量删除" class="btnStyle"/>
	  </div> -->
	  <!-- turn page -->
	  <div class="turnPage center fr">
	  
	  <a href="javascript:;" onclick="findPage(${pageInfo.pageNum-1<1?1:pageInfo.pageNum-1},${pageInfo.pageSize},${status });">上一页</a>
        	        
      <c:forEach begin="${pageInfo.pageNum }" end="${pageInfo.pages }" var="i">
      <a href="#" <c:if test="${pageInfo.pageNum==i }">class="current_page"</c:if> onclick='findPage(${i},${pageInfo.pageSize},${status });'>${i }</a>
      </c:forEach>
      <a href="javascript:;" onclick="findPage(${pageInfo.pageNum+1>pageInfo.pages?pageInfo.pages:pageInfo.pageNum+1},${pageInfo.pageSize},${status });">下一页</a>
	  </div>
  </div>
 </div>
</body>
</html>