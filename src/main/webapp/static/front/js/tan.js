(function(){
	$.extend({  
		tan:function(title,content,ok_btn,no_btn,ok,no){
	
			
			var t = $('<div class="tcover">').append(
					$('<div class="twin">').append(
							$('<h3 class="ttitle">').text(title))
					.append($('<div class="tcontent">').html(content)
					).append($('<div class="tctrl">').append(
							$('<center class="tcenter">')
							.append($('<div class="tbtn tactive ">').text(ok_btn).bind("click",function(){ok();$(".tcover").remove()} ))
							.append($('<div class="tbtn tcancel ">').text(no_btn).bind("click",function(){no();$(".tcover").remove()})
					))
			));
			t.appendTo($('body'));
			
			
		}
	});
	

	/*<div class="cover">
	<div class="win">
		<h3 class="title">添加用户</h3>
		<div class="content">
			
		</div>
		<div class="ctrl">
			<div class="center">
				<div class="btn new ">添加</div>
				<div class="btn cancel ">取消</div>
			</div>
		</div>
	</div>
</div>*/
	
	
})();