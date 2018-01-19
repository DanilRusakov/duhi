$(document).ready(function(){


	//placeholder
	$('input, textarea').placeholder();

	//phone masked
	// $('input[type="tel"]').mask("+7 (999) 999-99-99",{placeholder:"+7 (___) ___-__-__"});
	
	//popup block
	$('.js-popup-wrap .js-btn-toggle').on('click touchstart', function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active')
		} else {
			$('.js-popup-wrap:not(.no-close) .js-btn-toggle').removeClass('active');
			$(this).addClass('active');
		}
		return false;
	})
	$(document).on('click touchstart', function(event) {
		$(this).parents('.js-popup-wrap').children('.js-btn-toggle').removeClass('active');
	})
	$(document).click(function(event) {
	    if ($(event.target).closest(".js-popup-block").length) return;
	    $('.js-popup-wrap:not(.no-close) .js-btn-toggle').removeClass('active');
	    event.stopPropagation();
	});


	
	//tabs
	$('.tabs-nav').each(function() {
		$('#tab'+$(this).find('.active').attr('data-tab')).addClass('active');
	})
	$('.tabs-nav a').on('click', function() {
		if ($(this).hasClass('active')) {} else {
			$('.tab-block').removeClass('active');
			$(this).parents('.tabs-nav').find('.active').removeClass('active');
			$(this).addClass('active');
			$('.tabs-nav').each(function() {
				$('#tab'+$(this).find('.active').attr('data-tab')).addClass('active');
			})
		}
		return false;
	})


	//placeholder
	$('input, textarea').placeholder();

	//phone masked
	// $('input[type="tel"]').mask("+7 (999) 999-99-99",{placeholder:"+7 (___) ___-__-__"});
	
	//popup block
	// $('.js-popup-wrap .js-btn-toggle').on('click touchstart', function() {
	// 	if ($(this).hasClass('active')) {
	// 		$(this).removeClass('active')
	// 	} else {
	// 		$('.js-popup-wrap:not(.no-close) .js-btn-toggle').removeClass('active');
	// 		$(this).addClass('active');
	// 	}
	// 	return false;
	// })
	$(document).on('click touchstart', function(event) {
		$(this).parents('.js-popup-wrap').children('.js-btn-toggle').removeClass('active');
	})
	$(document).click(function(event) {
	    if ($(event.target).closest(".js-popup-block").length) return;
	    $('.js-popup-wrap:not(.no-close) .js-btn-toggle').removeClass('active');
	    event.stopPropagation();
	});


	//counter   
	// $('.frm-counter .btn-action-minus').on('click', function(){
	//     var cnt=$(this).parents('.frm-counter').find('input').val();
	//     cnt=parseInt(cnt);
	//     if (cnt>0) {
	//         $(this).parents('.frm-counter').find('input').val(cnt-1);
	//     }
	//     return false;
	// })
	// $('.frm-counter .btn-action-plus').on('click', function(){
	//     var cnt=$(this).parents('.frm-counter').find('input').val();
	//     $(this).parents('.frm-counter').find('input').val(cnt-1+2);
	//     return false;
	// })


	
	//tabs
	$('.tabs-nav').each(function() {
		$('#tab'+$(this).find('.active').attr('data-tab')).addClass('active');
	})
	$('.tabs-nav a').on('click', function() {
		if ($(this).hasClass('active')) {} else {
			$('.tab-block').removeClass('active');
			$(this).parents('.tabs-nav').find('.active').removeClass('active');
			$(this).addClass('active');
			$('.tabs-nav').each(function() {
				$('#tab'+$(this).find('.active').attr('data-tab')).addClass('active');
			})
		}
		return false;
	})



	//popup cart
	$('#popup-cart').dialog({
		autoOpen: false,
		modal: true,
		resizable: false,
		draggable: false,
		width: 704,
		show: { effect: "fade", duration: 400 },
		hide: { effect: "fade", duration: 400 },
		dialogClass: 'popup-cart',
		title: 'Ваша корзина'
	})
	// open popup after adding product
	// $('.btn-popup-cart, .item-catalog').on('click', function() {
	// 	$('#popup-cart').dialog('open');
	// 	return false;
	// })
	$('.btn-popup-close').on('click', function() {
		$('#popup-cart').dialog('close');
		return false;
	})
	$('.item-wrap>a>div').remove()


	//main slider
	$('.decor-box .sl-item').each(function() {
		var picUrl = $(this).find('.bg-photo').attr('src');
		$(this).css('background-image', 'url('+picUrl+')');
		$(this).find('.bg-photo').hide();
	})
	if ($('.decor-box .sl-item').size()>1) {
		$('.decor-box .slider').owlCarousel({
			items: 1,
			loop: true,
			nav: false,
			dots: false,
			smartSpeed: 1000,
			fluidSpeed: 1000,
			autoplaySpeed: 1000,
			navSpeed: 1000,
			dotsSpeed: 1000,
			dragEndSpeed: 1000,
			responsiveRefreshRate: 100,
			autoHeight: false,
			autoplay: true,
			autoplayTimeout: 5000,
		})
	}
		//main menu mobile
	if ($(window).scrollTop()>="100") $(".main-menu-wrap .btn-action-menu").addClass('show');
	$(window).scroll(function(){
		if ($(window).scrollTop()<="100") $(".main-menu-wrap .btn-action-menu").removeClass('show')
		else $(".main-menu-wrap .btn-action-menu").addClass('show');
	});
	//main menu desktop
	var lastScrollTop = 0;
	$(window).scroll(function(event){
		var st = $(this).scrollTop();
		if (st > lastScrollTop){
		   $('.wrap').removeClass('menu-show');
		} else {
			if ($(window).scrollTop()>="200") {$('.wrap').addClass('menu-show')} else {
				$('.wrap').removeClass('menu-show');
			}
		}
		lastScrollTop = st;
	});
	
});
 $(window).load(function() {
      $('[data-fancybox]').fancybox({
      	onComplete: function() {
			$('.fancybox-button--left').each(function() {
				$(this).attr('title', 'Предыдущая');
			})
			$('.fancybox-button--play').each(function() {
				$(this).attr('title', 'Слайдшоу (P)');
			})
			$('.fancybox-button--right').each(function() {
				$(this).attr('title', 'Следующая');
			})
			$('.fancybox-button--fullscreen').each(function() {
				$(this).attr('title', 'На весь экран (F)');
			})
			$('.fancybox-button--thumbs').each(function() {
				$(this).attr('title', 'Предосмотр (G)');
			})
			$('.fancybox-button--close').each(function() {
				$(this).attr('title', 'Закрыть (Esc)');
			})
      	}
      })
});