<!DOCTYPE html>
<html lang="ru">

<head>
    <title><?php echo $title;  ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<?php echo $og_url; ?>" />
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>" />
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>" />
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>" />
    <base href="<? echo HTTP_SERVER;?>" />
 

    
    <!-- OLD CSS and JS -->
    <!-- <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script> -->
    <!-- <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />-->
	
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
	<link href="catalog/view/theme/default/prettyPhoto/css/prettyPhoto.css" rel="stylesheet">
	<link href="catalog/view/theme/default/css/style.css" rel="stylesheet">

    <!-- New -->
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/reset.css" />
    
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/jquery-ui.min.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/jquery-ui.structure.min.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/owl.carousel.min.css" />
    <!--[if lte IE 8]><link href= "./css/ie.css" rel= "stylesheet" media= "all" /><![endif]-->
    <!--[if lt IE 9]>
        <script src="./js/html5shiv.min.js"></script>
        <script src="./js/respond.min.js"></script>
    <![endif]-->
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/js/jquery-ui.min.js"></script>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
    <script src="catalog/view/theme/default/js/owl.carousel.min.js"></script>
    <script src="catalog/view/theme/default/js/jquery.fancybox.min.js"></script>
    <!-- <script src="catalog/view/theme/default/js/jquery.maskedinput.min.js"></script> -->
    <script src="catalog/view/theme/default/js/jquery.placeholder.min.js"></script>
    <script src="catalog/view/theme/default/js/scripts.js"></script>

    <link rel="icon" type="image/vnd.microsoft.icon" href="favicon.ico">
    <link rel="shortcut icon" href="favicon.ico">

    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
   <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <link rel="stylesheet" href="catalog/view/theme/default/css/mo/style.css" />
</head>

<body>
    <!-- wrap -->
    <div class="wrap">
        <?php
          $path = "common/home";
          $url = $_SERVER['REQUEST_URI'];
          if ($url == "/" or strripos($url, $path)) {?>
          <? }else{ ?>
            <div class="decor-box inner"></div>
        <?}?>

        
        <!-- header -->
        <header class="header">
            <div class="inner-wrap">
                <div class="logo-wrap">
                    <a href="<?php echo $home; ?>" class="logo">
                        <img src="catalog/view/theme/default/images/main/logo.png" alt="">
                    </a>
                </div>
                <div class="phone-wrap">
                    <a href="tel:84957573333" class="phone">+7 (495) <span>757-33-33</span></a>
                </div>
                    <div id="cart" class="main-cart-wrap cart-wrap js-popup-wrap">
                        <?php echo $cart; ?>
                    </div>
                </div>

        </header>
        <!-- /header -->
        <!-- main menu wrap --> 
        <div class="main-menu-wrap js-popup-wrap">
            <div class="inner-wrap">
                <a href="" class="btn-action-menu js-btn-toggle"></a>
                <div class="menu-block js-popup-block">
                    <div class="menu-inner-wrap">
                        <div class="menu-wrap">
                            <div class="menu-title"><a href="#">Коллекции Montale</a>
                            </div>
                            <ul>
                               <?php foreach ($categories as $category) { ?>
                                  <li><a href="#<? echo $category['category_id'];?>" onclick="$('.main-menu-wrap .js-btn-toggle').click();"><? echo $category['name'];?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                        <div class="cart-wrap">
                            <a href="simplecheckout/" class="btn-menu-cart"><span><? echo $count_products;?></span></a>
                        </div>
                    </div>
                    <div class="phone-wrap">
                        <a href="tel:84957573333">+7 (495) <span>757-33-33</span></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /main menu wrap -->



