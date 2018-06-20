$(function(){
	var tabBtn = $('.tab_btn b');
	var tabBtnParent = tabBtn.parent();
	var btnLine = $(".tab_btn p");
	btnLine.css({width:tabBtn.eq(0).outerWidth()})
	tabBtn.bind("click",function(){ 
		$(this).addClass("cur").siblings().removeClass("cur");
		
	});
	tabBtn.bind("mouseenter",function(){
		$(this).addClass("color").siblings().removeClass("color");
		var offLeft = tabBtnParent.offset().left;
		var lineLeft = $(this).offset().left - offLeft;
		btnLine.stop().animate({
			left:lineLeft,
			width:$(this).outerWidth()
		},200);
	});
	tabBtn.bind("mouseout",function(){
		var offLeft = tabBtnParent.offset().left;
		var lineLeft = tabBtnParent.find(".cur").offset().left - offLeft;
		console.log(tabBtnParent.find(".cur").index());
		var lineWidth = tabBtnParent.find(".cur").outerWidth();
		tabBtnParent.find(".cur").addClass("color").siblings().removeClass("color");
		btnLine.stop().animate({
			left:lineLeft,
			width:lineWidth
		},500);
	});
	
	var conBtn = $('.toggle_conditions_btn');
	var condition = $('.conditions');
	conBtn.bind('click',function(){
		$(this).find('b').toggleClass("up_arrow");
		condition.slideToggle(200);
	});
	
	
});
	
