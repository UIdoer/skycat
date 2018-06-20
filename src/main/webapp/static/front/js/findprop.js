function findProp(path,propId){
		$.post(path+"goodProperty/toFindProperty",{'goodPropertyId':propId},
			   function(data){
			console.log(data);
			console.log(data.good_Property);
			$("#propView").html("颜色:"+data.good_Property.p1Value  +"   "+
								"属性:"+data.good_Property.p2Value  +"   "+
								"库存:"+data.good_Property.stock    +"   "+
								"价格:"+data.good_Property.price);
			
			$("#price").html(data.good_Property.price+"元");
			$("#hprice").val(data.good_Property.price);
			$("#hgoodPropertyId").val(propId);
		} 
	);	
		$("#propChoise").css('display','block');
		
}
