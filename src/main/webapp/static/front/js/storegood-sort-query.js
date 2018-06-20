
function defaultSort(path,storeId){
	
	$("#defualt-key").addClass("now");
	$("#newGood-key").removeClass("now");
	$("#price-key").removeClass("now");
	location = path+'good/findGoodByStoreId?storeId='+storeId
}

function priceSort(path,storeId){
	$("#defualt-key").removeClass("now");
	$("#newGood-key").removeClass("now");
	$("#price-key").addClass("now");
	var sort = $("#price-key").attr("data-sort");
	if(sort == "desc"){
		$("#price-key").attr("data-sort","asc");
		location = path+'good/findGoodByStoreId?storeId='+storeId+'&condition=price-key'+'&sort=desc'
		
		
	}else if(sort=="asc"){
		$("#price-key").attr("data-sort","desc")
		location = path+'good/findGoodByStoreId?storeId='+storeId+'&condition=price-key&sort=asc'
	
	}
}
function newGood(path,storeId){
	$("#defualt-key").removeClass("now");
	$("#price-key").removeClass("now");
	$("#newGood-key").addClass("now");
	var sort = $("#newGood-key").attr("data-sort");
	if(sort=="desc"){
		$("#newGood-key").attr("data-sort","asc")	
		location = path+'good/findGoodByStoreId?storeId='+storeId+'&condition=newGood-key&sort=desc'
			
	}else if(sort=="asc"){
		$("#newGood-key").attr("data-sort","desc")
		location = path+'good/findGoodByStoreId?storeId='+storeId+'&condition=newGood-key&sort=asc'
		
	}
}