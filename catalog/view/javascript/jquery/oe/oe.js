/*
 * Продвинутые Опции v1.0
 * Автор: iDiY (info@idiy.club)
 */

var oe = {
	'add': function(item_id) {
		$.ajax({
			url: 'index.php?route=product/element/add',
			type: 'post',
			data: $('#'+ item_id +' input[type=\'text\'], #'+ item_id +' input[type=\'hidden\']'),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					}, 200);

					$('#cart > ul').load('index.php?route=common/cart/info ul li');

					$('#'+ item_id +' .item-cart-btn').animate({'opacity': '0'}, 150);
					setTimeout(function () {
						$('#'+ item_id +' .item-cart-btn').addClass('cart-active').html(json['incart']);
						$('#'+ item_id +' .item-cart-btn').animate({'opacity': '1'}, 150);
						var width = $(window).width();
						if (width>=1200) {$('#'+ item_id +' .item-checkout-btn').delay(750).css({'visibility': 'visible'}).animate({'opacity': '1'}, 100);}
					}, 200);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'status': function(btn_id) {
		setTimeout(function () {
			$('#'+ btn_id).load(window.location.href +' #'+ btn_id + ' > *');
		}, 300);
	}
}