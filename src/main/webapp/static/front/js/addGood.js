function addGood(path){
	var price = $("#hprice").val();
	var goodPropertyId = $("#hgoodPropertyId").val();
	var number = $("#number").val();
	console.log(price);
	console.log(goodPropertyId);
	console.log(number);
	
	$.post(path+"user/cart/addGoodToCart",{'number':number,'price':price,'goodPropertyId':goodPropertyId},function(data){
		
		var i = data.msg;
		if(i>0 || i!=""){
			var num=data.number;
			var count = data.total;
			$("#cartMsg").html("宝贝已成功添加到购物车");
			$("#cartNum").html('购物车共有该宝贝('+num+')件');
			$("#count").html('合计：'+count+'元');
			
		}else{
			$("#cartMsg").html("添加到购物车失败，请重新登录后添加");
			$("#cartNum").html('');
			$("#count").html('');	
		}
		ShowDiv_1('MyDiv1','fade1');
	})
	
	
	
	
}