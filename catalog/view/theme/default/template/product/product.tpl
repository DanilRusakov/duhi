<?php echo $header; ?>

<!-- info panel -->
<div class="info-panel cnt-section">
    <div class="inner-wrap">
        <ul>
            <li>Доставка по России 0 - 600 ₽</li>
            <li>100% оригинал!</li>
            <li>Оплата при получении картой и наличными</li>
            <li>Регулярные подарки</li>
        </ul>
    </div>
</div>
<!-- /info panel -->


<div class=" page">
  <div class="breadcrumbs-box">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="product-box">
      <!-- column -->
      <div class="column">
          <div class="photo-wrap">
            <!-- <a href="<?php echo $image['popup']; ?>"> -->
              <img src="<?php echo $thumb; ?>" alt="">
            <!-- </a> -->
            <?php if($special) { ?>
            <div class="elm-discount">-<?php echo $special_percent; ?>%</div>
            <?php } ?>
          </div>

          <div class="desc-wrap">
              <div class="inner-title">
                  <h2>Гарантия оригинала</h2>
              </div>
              <?php echo $garantee; ?>
          </div>
          <div class="reviews-wrap">
              <div class="review-title">
                  Самые настоящие отзывы
              </div>
              <div class="widget-wrap">
                  <iframe src='/inwidget/index.php?width=450&inline=7&view=14&toolbar=false' data-inwidget scrolling='no' frameborder='no' style='border:none;width:100%;height:175px;overflow:hidden;'></iframe>
              </div>
          </div>
      </div>
      <!-- /column -->
      <!-- column -->
      <div class="column">
          <div class="variants-wrap" id="product">
            <?php if ($options) { ?>
                  <?php foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') { ?>
                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                    <div style="display: none"><input type="radio" id="op_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" /></div>
                    <div class="item-var">
                  <div class="var-title"><?php echo $option_value['name']; ?></div>
                  <div class="var-wrap">
                      <div class="var-wrap">
                          <div class="var-price">
                          <?php if (!$option_value['full_special']) { ?>
                            <span class="new"><?php echo $option_value['full_price']; ?></span>
                          <?php } else { ?>
                            <span class="old"><?php echo $option_value['full_price']; ?></span>
                            <span class="new"><?php echo $option_value['full_special']; ?></span>
                          <?php } ?>
                          </div>
                          <div class="var-button">
                            <a href="javascript://" onclick="$('#op_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>').click();" class="btn btn-second btn-popup-cart button-cart" ><?php echo $button_cart; ?></a>
                          </div>
                      </div>
                  </div>
                  </div>
                    <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php }else{ ?>
              <div class="item-var">
                  <div class="var-title"><?php echo $heading_title; ?></div>
                  <div class="var-wrap">
                      <div class="var-price">
                      <?php if (!$special) { ?>
                        <span class="new"><?php echo $price; ?></span>
                      <?php } else { ?>
                        <span class="old"><?php echo $price; ?></span>
                        <span class="new"><?php echo $special; ?></span>
                      <?php } ?>
                      </div>
                      <div class="var-button">
                        <a href="javascript://" class="btn btn-second btn-popup-cart button-cart" ><?php echo $button_cart; ?></a>
                      </div>
                  </div>
              </div>
              <?php } ?>
              <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          </div>
          <div class="desc-wrap mobile">
              <div class="inner-title">
                  <h2>Гарантия оригинала</h2>
              </div>
              <?php echo $garantee; ?>
          </div>

          <?php echo $option_elements; ?>

          <div class="desc-wrap">
              <h2 class="inner-title">Об аромате</h2>
              <?php echo $description; ?>
          </div>
          <div class="reviews-wrap mobile">
              <div class="review-title">
                  Самые настоящие отзывы
              </div>
              <div class="widget-wrap">
                  <iframe src='/inwidget/index.php?width=450&inline=7&view=14&toolbar=false' data-inwidget scrolling='no' frameborder='no' style='border:none;width:100%;height:175px;overflow:hidden;'></iframe>
              </div>
          </div>
          <div class="desc-wrap">
              <h3 class="inner-title">Доставка и оплата</h3>
              <? echo $delivery; ?>
          </div>
      </div>
      <!-- /column -->
  </div>
        <h2>Сертификаты</h2>
    <!-- photos box -->
    <div class="photos-box">
        <div class="items-wrap">
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
            <!-- item -->
            <div class="item-wrap">
                <a href="catalog/view/theme/default/images/sert.jpg" class="item-photo" data-fancybox="gal"><span class="photo"><img src="catalog/view/theme/default/images/sert.jpg" alt=""></span></a>
            </div>
            <!-- /item -->
        </div>
    </div>
    <!-- /photos box -->


    <h2><?php echo $text_related; ?></h2>
      <div class=" catalog-box">
        <!-- catalog box -->
        <div class="items-wrap"> <!-- <?php echo $class; ?> -->
          <?php $i = 0; ?>
          <?php foreach ($products as $product) { ?>
         <!--  <?php if ($column_left && $column_right) { ?>
          <?php $class = 'col-xs-8 col-sm-6'; ?>
          <?php } elseif ($column_left || $column_right) { ?>
          <?php $class = 'col-xs-6 col-md-4'; ?>
          <?php } else { ?>
          <?php $class = 'col-xs-6 col-sm-3'; ?>
          <?php } ?> -->
           
            
            
                <!-- item -->
                <div class="item-wrap "> <!-- class="item-wrap " -->
                    <a href="<?php echo $product['href']; ?>" class="item-product">
                        <span class="cat-photo center-image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></span>
                        <?php if ($product['special']) { ?><span class="elm-discount">-<?php echo $product['percent']; ?>%</span><?php } ?>
                        <span class="cat-title"><?php echo $product['name']; ?></span>
                        <span class="cat-price"><?php if ($product['min_price'] && $product['max_price']) { ?>
                                <?php if ($product['min_price'] == $product['max_price']) { ?>
                                <?php echo $product['max_price']; ?>
                                <?php } else { ?>
                                <?php echo $product['min_price']; ?> - <?php echo $product['max_price']; ?>
                                <?php } ?>
                            <?php } else { ?>
                            <?php if ($product['special']) { ?>
                                <?php echo $product['special']; ?>
                            <?php } else { ?>
                                <?php echo $product['price']; ?>
                            <?php } ?>
                            <?php } ?>
                        </span>
                    </a>
                </div>
                <!-- /item -->
            
        
         <?php } ?>
        </div>
      </div>
        <!-- /catalog box -->    
    </div>
    <!-- /page -->
  <div class="sep-page"></div>
  <!-- END PRODUCTBOX -->
  

</div>
<!-- END WRAP -->


<script type="text/javascript"><!--
  $('.button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
                $('#popup-cart').dialog('open');
                    // Need to set timeout otherwise it wont update the total
                    setTimeout(function () {
                        $('#cart > a').html('<span class="cart-title ">В вашей корзине <br>' + json['total']['count'] + ' товаров на ' + json['total']['price'] + '</span>');
                    }, 100);
                        $('#cart > a').addClass( "full");

                    // $('html, body').animate({ scrollTop: 0 }, 'slow');
                    $('#popup-cart > .popup-cart-wrap ').load('index.php?route=common/cart/info .cart-block ');
                    $('#cart .cart-block ').load('index.php?route=common/cart/info .cart-block table');
                    setTimeout(function () {
                        $('#cart > div.cart-block.js-popup-block>table').after('<div class="cart-button"><a href="?route=checkout/simplecheckout" class="btn">Оформить</a></div>');
                    }, 200);
                    setTimeout(function () {
                        $('#popup-cart > div > div > div').prepend('<a href="" class="btn btn-second btn-popup-close">Продолжить покупки</a>');
                    }, 200);
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
  $('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
    grecaptcha.reset();
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});

$(document).ready(function() {
	var hash = window.location.hash;
	if (hash) {
		var hashpart = hash.split('#');
		var  vals = hashpart[1].split('-');
		for (i=0; i<vals.length; i++) {
			$('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
			$('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
			$('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
		}
	}
})
//--></script>
<?php echo $footer; ?>
