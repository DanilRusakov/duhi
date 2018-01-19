<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>" style="margin-top: 25px;">
        <?php echo $content_top; ?>
        <?php if ($config_teaser_status) { ?>
        <div class="block-v">
            <div class="container">
                    <div id="mask" class="alert" style="display:none;"></div>
                   <div class="row">
                      <div class="col-md-4 col-lg-6 col-sm-12 col-xs-12">
                        <p>До конца ликвидации осталось:</p>
                        <div class="count">
                        <script>
                            (function() {
                                var _id = "92a01eeb6947a57e30a254ffe5c3db88";
                                while (document.getElementById("timer" + _id))
                                    _id = _id + "0";
                                document.write("<div id='timer" + _id + "' style='min-width:248px;height:50px;'></div>");
                                var _t = document.createElement("script");
                                _t.src = "http://megatimer.ru/timer/timer.min.js";
                                var _f = function(_k) {
                                    var l = new MegaTimer(_id,{
                                        "view": [1, 1, 1, 1],
                                        "type": {
                                            <?php if($config_teaser_datetime) { ?>
                                            "currentType": "1",
                                            "params": {
                                                "usertime": true,
                                                "tz": 3,
                                                "utc":<?php echo (int)$config_teaser_datetime; ?>000
                                            }
                                            <?php } else { ?>
                                            "currentType": "3",
                                            "params": {
                                                "weekdays": [1, 1, 1, 1, 1, 1, 1],
                                                "usertime": true,
                                                "time": "00:00",
                                                "tz": -180,
                                                "hours": "24",
                                                "minutes": "0"
                                            }
                                            <?php } ?>
                                        },
                                        "design": {
                                            "type": "circle",
                                            "params": {
                                                "width": "1",
                                                "radius": "23",
                                                "line": "solid",
                                                "line-color": "#969494",
                                                "background": "solid",
                                                "background-color": "#e1dfdf",
                                                "direction": "direct",
                                                "number-font-family": {
                                                    "family": "Roboto",
                                                    "link": "<link href='http://fonts.googleapis.com/css?family=Roboto&subset=latin,cyrillic' rel='stylesheet' type='text/css'>"
                                                },
                                                "number-font-size": "21",
                                                "number-font-color": "#757474",
                                                "separator-margin": "8",
                                                "separator-on": false,
                                                "separator-text": ":",
                                                "text-on": false,
                                                "text-font-family": {
                                                    "family": "Open Sans",
                                                    "link": "<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic' rel='stylesheet' type='text/css'>"
                                                },
                                                "text-font-size": "16",
                                                "text-font-color": "#ffffff"
                                            }
                                        },
                                        "designId": 7,
                                        "theme": "white",
                                        "width": 248,
                                        "height": 50
                                    });
                                    if (_k != null)
                                        l.run();
                                };
                                _t.onload = _f;
                                _t.onreadystatechange = function() {
                                    if (_t.readyState == "loaded")
                                        _f(1);
                                }
                                ;
                                var _h = document.head || document.getElementsByTagName("head")[0];
                                _h.appendChild(_t);
                            }
                            ).call(this);
                        </script>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3 col-sm-6 col-xs-6">
                        <p>Заказов сегодня:</p>
                        <div class="wr"><span><?php echo $config_teaser_order_count; ?></span></div>
                    </div>
                    <div class="col-md-4 col-lg-3 col-sm-6 col-xs-6">
                        <a href="#cat" class="but-in f">Перейти к покупкам</a>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $("#content > .block-v").detach().insertBefore( $('body > #wrap > .container:first') );
            $(window).bind('scroll', function() {
                if ($(window).scrollTop() > 800) {
                    $('.block-v').addClass('fixed');
                    $('.block-v .but-in').hide();
                }
                else {
                    $('.block-v').removeClass('fixed');
                    $('.block-v .but-in').show();
                }
            });
        </script>
        <?php } ?>
        <?php if ($config_catalog_status && $categories) { ?>
        <h2 id="cat">Каталог</h2>
        <div class="row">
          <div class="col-md-12">
          <?php if ($config_catalog_menu_status) { ?>
            <div class="nav catalog_nav">
            <?php foreach ($categories as $category) { ?>
              <a href="#<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?> <span><?php echo $category['product_count']; ?></span></a>
            <?php } ?>
            </div>
          <?php } ?>
          <?php foreach ($categories as $category) { ?>
            <h2><?php echo $category['name']; ?></h2>
            <div class="row" id="<?php echo $category['category_id']; ?>">
              <?php foreach ($category['products'] as $product) { ?>
              <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="product-thumb transition">
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                  <div class="caption">
                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <p><?php echo $product['description']; ?></p>
                    <?php if ($product['rating']) { ?>
                    <div class="rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } else { ?>
                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } ?>
                      <?php } ?>
                    </div>
                    <?php } ?>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>

                  </div>
                  <div class="button-group">
                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="modal" data-target="#myModal"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          <?php } ?>
          </div>
        </div>
        <?php } ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>