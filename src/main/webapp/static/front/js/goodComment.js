 //定义全局变量，总记录数
/* var totalRecord,currentPage;*/
 //点击页面时，实现页码跳转
function findGoodComment(pageNum,goodId,path){
	$.post(path+"goodComment/findGoodComment",{'pageNum':pageNum,'goodId':goodId},function(data){
		commentView(data.currentPage,goodId,path);
		commentPage(data.currentPage,goodId,path);
	});
}

function commentView(currentPage,goodId,path){
	 //清空table表格
    $("#commenTableId").empty();
    //获取json串中返回的结果集（库表中的数据）
    var comment=currentPage.list;
    //参数1：要遍历的comment集合，参数2:每次遍历的回调函数
    //回调函数：参数1：索引，参数2：当前对象
    $.each(comment,function(index,item){
    	//把解析的数据放到表格中展示，以下的DOM解析表格
        var headImgTd=$("<td width='160'></td>").append("<img src='https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"+item.user.picture+"' width='20' height='20' align='absmiddle' &nbsp; />"+item.user.userName)
        var voloumTd;
       var date =  new Date(item.comTime) 
        if(item.comGrade==0){
        	 voloumTd =$("<td width='180'></td>").append("评价等级：<font color='#999999'>好评</font> <br />")
        }
        if(item.comGrade==1){
        	 voloumTd =$("<td width='180'></td>").append("评价等级：<font color='#999999'>中评</font> <br />")
        }
        if(item.comGrade==2){
        	 voloumTd =$("<td width='180'></td>").append("评价等级：<font color='#999999'>差评</font> <br />")
        }
        
        var decrTd = $("<td></td>")
        .append(item.comText+" <br /><font color='#999999'> "+date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()+"</font>")
        
        var imgTd=$("<td></td>")
        if(item.img1!=null){
        	imgTd.append("<img src='https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"+item.img1+" ' width='50' height='50' />")
        }
        if(item.img2!=null){
        	imgTd.append("<img src='https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"+item.img2+"'  width='50' height='50' />")
        } 
        if(item.img3!=null){
        	imgTd.append("<img src='https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"+item.img3+" ' width='50' height='50' />")
        }
        if(item.img4!=null){
        	imgTd.append("<img src='https://skycat-1251718931.cos.ap-guangzhou.myqcloud.com/upload/"+item.img4+"'  width='50' height='50' />")
        } 
       
        var tabTr = $("<tr valign='top'></tr>").append(headImgTd).append(voloumTd).append(decrTd).append(imgTd).appendTo("#commenTableId");	   	
    });
}

function commentPage(currentPage,goodId,path){
	$(".pages").empty();
	var pre = $("<a class='p_pre'></a>").append("上一页");
	pre.click(function(){
		if(currentPage.pageNum>0){
			findGoodComment(currentPage.pageNum-1,goodId,path);
		}
	});
	$(".pages").append(pre)
	$.each(currentPage.navigatepageNums,function(index,item){
		var allPage = $("<a ></a>").append(item);
		if(currentPage.pageNum==item){
			allPage.addClass("cur");
		}
		allPage.click(function(){
			findGoodComment(item,goodId,path);
		});
		
		$(".pages").append(allPage);
		
	});
	
	var next = $("<a  class='p_pre'></a>").append("下一页");
	
	next.click(function(){
		if(currentPage.pageNum<currentPage.pages){
			findGoodComment(currentPage.pageNum+1,goodId,path);
		}
	});
	
	$(".pages").append(next);
	
	
	
	
	
	
}
