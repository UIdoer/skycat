// JavaScript Document

$(document).ready(function() {
	$('a[href="#"]').each(function() {
		$(this).attr('href', 'javascript:void(0)')
	});
	$('.perform li').each(function() {
		var o = $(this);
		$(this).find('.s').click(function() {
			var j = $(this).index();
			o.find('.s').removeClass('on').eq(j).addClass('on');
			o.find('.info').hide().eq(j).fadeIn(500)
		})
	});
	$('.artist_l li').each(function(m) {
		$(this).find('a').css('top', -$(this).height());
		$(this).hover(function() {
			$(this).find('a').animate({
				'top': '0'
			},
			200)
		},
		function() {
			$(this).find('a').animate({
				'top': $(this).height()
			},
			{
				duration: 200,
				complete: function() {
					$(this).css('top', -$(this).parent('li').height())
				}
			})
		})
	});
	$('#calendar td').live('mouseover',
	function() {
		$('#calendar td').removeClass('hover');
		$(this).addClass('hover')
	});
	$('.category_list .item').each(function(i) {
		$(this).hover(function() {
			$('.category_list .item').removeClass('on').eq(i).addClass('on');
			$('.category_list ol').hide().eq(i).show()
		},
		function() {
			$(this).find('ol').hide();
			$(this).removeClass('on')
		})
	});
	$('.u_city_a li').each(function(i) {
		$(this).click(function() {
			if (i == 10) return false;
			$('.u_city_nav li').removeClass('on').eq(i).addClass('on');
			$('.u_city_nav p').hide().eq(i).show()
		})
	});
	var intIndexCity = 0;
	var intHoverCity = 0;
	$('.u_city_nav .more').click(function() {
		if (intIndexCity == 1) {
			$(this).removeClass('on');
			$('.s_citys').hide(200);
			intIndexCity = 0
		} else {
			$(this).addClass('on');
			$('.s_citys').show(200);
			intIndexCity = 1
		}
		return false
	});
	$('.s_citys').hover(function() {
		intHoverCity = 1
	},
	function() {
		intHoverCity = 0
	});
	$('body').bind('click',
	function() {
		if (intIndexCity == 1 && intHoverCity == 0) {
			$('.s_citys').hide(200);
			$('.u_city_nav .more').removeClass('on');
			intIndexCity = 0
		}
	});
	function scrollList() {
		if ($('.scroll_txt li').length <= 1) return;
		var temp = $('.scroll_txt li:last');
		temp.hide();
		$('.scroll_txt li:last').remove();
		$('.scroll_txt li:first').before(temp);
		temp.slideDown(500)
	}
	window.setInterval(scrollList, 5000);
	$('.live_top li').each(function(i) {
		$(this).hover(function() {
			$('.live_top li').removeClass('on').eq(i).addClass('on')
		})
	});
	$('.list_1 li').each(function(i) {
		$(this).hover(function() {
			$('.list_1 li').removeClass('on').eq(i).addClass('on')
		})
	});
	$('.vote_m dd').each(function(i) {
		$(this).click(function() {
			$('.vote_m dd').removeClass('on').eq(i).addClass('on')
		})
	});
	$('.tr_commend dl').each(function(i) {
		$(this).hover(function() {
			$('.tr_commend dl').removeClass('on').eq(i).addClass('on')
		})
	});
	$('.ticketInfo .help').hover(function() {
		$('.minTips').fadeIn('fast')
	},
	function() {
		$('.minTips').fadeOut('fast')
	});
	$('.videoList li').hover(function() {
		$(this).addClass('on')
	},
	function() {
		$(this).removeClass('on')
	});
	$('.min_tip .tab_min_b a').each(function(i) {
		$(this).click(function() {
			$('.tab_min_b a').removeClass('on').eq(i).addClass('on')
		})
	});
	$('.news_list li').hover(function() {
		$(this).addClass('on')
	},
	function() {
		$(this).removeClass('on')
	});
	$('.tr_pic_list li').hover(function() {
		$(this).addClass('on')
	},
	function() {
		$(this).removeClass('on')
	});
	$('.sift .expand').toggle(function() {
		$('#city').height(24);
		$(this).html('\u5c55\u5f00')
	},
	function() {
		$('#city').height('auto');
		$(this).html('\u6536\u7f29')
	});
	$('.buy_caption .tab_t a').each(function(i) {
		$(this).click(function() {
			$('.buy_caption .tab_t a').removeClass('on').eq(i).addClass('on');
			$('.buy_caption dl').hide().eq(i).show()
		})
	});
	$('.vocal_list li .t .c7').click(function() {
		$(this).parent().parent().find('.t').show();
		$(this).parent().hide()
	})
});
$(document).ready(function() {
	var t = false;
	var str = '';
	var speed = 500;
	var w = 211;
	var n = $('#actor2 li').length;
	var numWidth = n * 18;
	var _left = (w - (numWidth + 26)) / 2;
	var c = 0;
	$('#actor2').width(w * n);
	$('#actor2 li').each(function(i) {
		str += '<span></span>'
	});
	$('#numInner').width(numWidth).html(str);
	$('#imgPlay2 .mc').width(numWidth);
	$('#imgPlay2 .num').css('left', _left);
	$('#numInner').css('left', _left + 13);
	$('#numInner span:first').addClass('on');
	function cur(ele, currentClass) {
		ele = $(ele) ? $(ele) : ele;
		ele.addClass(currentClass).siblings().removeClass(currentClass)
	}
	$('.food_ban #imgPlay2 .next_f').click(function() {
		slide(1)
	});
	$('.food_ban #imgPlay2 .prev_f').click(function() {
		slide( - 1)
	});
	function slide(j) {
		if ($('#actor2').is(':animated') == false) {
			c += j;
			if (c != -1 && c != n) {
				$('#actor2').animate({
					'marginLeft': -c * w + 'px'
				},
				speed)
			} else if (c == -1) {
				c = n - 1;
				$("#actor2").css({
					"marginLeft": -(w * (c - 1)) + "px"
				});
				$("#actor2").animate({
					"marginLeft": -(w * c) + "px"
				},
				speed)
			} else if (c == n) {
				c = 0;
				$("#actor2").css({
					"marginLeft": -w + "px"
				});
				$("#actor2").animate({
					"marginLeft": 0 + "px"
				},
				speed)
			}
			cur($('#numInner span').eq(c), 'on')
		}
	}
	$('#numInner span').click(function() {
		c = $(this).index();
		fade(c);
		cur($('#numInner span').eq(c), 'on')
	});
	function fade(i) {
		if ($('#actor2').css('marginLeft') != -i * w + 'px') {
			$('#actor2').css('marginLeft', -i * w + 'px');
			$('#actor2').fadeOut(0,
			function() {
				$('#actor2').fadeIn(500)
			})
		}
	}
	function start() {
		t = setInterval(function() {
			slide(1)
		},
		5000)
	}
	function stopt() {
		if (t) clearInterval(t)
	}
	$("#imgPlay2").hover(function() {
		stopt()
	},
	function() {
		start()
	});
	start()
});
$(document).ready(function() {
	var isshowcity = false;
	var ishovercitys = false;
	$('.s_city .s').click(function() {
		if (isshowcity == false) {
			$('.s_c_links').show(200);
			$(this).addClass('on');
			isshowcity = true
		} else {
			$('.s_c_links').hide(200);
			$(this).removeClass('on');
			isshowcity = false
		}
		return false
	});
	$('.s_c_links').hover(function() {
		ishovercitys = true
	},
	function() {
		ishovercitys = false
	});
	$('body').bind('click',
	function() {
		if (isshowcity == true && ishovercitys == false) {
			$('.s_c_links').hide(200);
			$('.s_city .s').removeClass('on');
			isshowcity = false
		}
	})
});
$(document).ready(function() {
	$('.sd').each(function(i) {
		$(this).find('.hztitle').click(function() {
			$('.sd').eq(i).find('p').toggle()
		})
	});
	$(".hztitle").toggle(function() {
		$(this).addClass("hztitle-2")
	},
	function() {
		$(this).removeClass("hztitle-2")
	})
});
function artHeight() {
	var rh = $('.artists_r').height();
	var lh = $('.artists_l').height();
	var list = $('.artists_l .tab_min_in').height();
	var dh = rh - lh;
	if (dh > 0) {
		var h = lh + dh - 12;
		$('.artists_l').height(h)
	}
	if (rh - list < 90) {
		$('.artists_l').height('auto')
	}
}