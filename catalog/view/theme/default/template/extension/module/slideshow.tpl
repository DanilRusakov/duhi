<div class="decor-box" id="slideshow<?php echo $module; ?>">
<div class="slider-wrap">
  <div class="slider">
  <?php foreach ($banners as $banner) { ?>
    <div class="sl-item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="bg-photo" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="bg-photo" />
    <?php } ?>
    </div>
  <?php } ?>
  </div>
</div>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').detach().insertBefore( $('body > .wrap > header') );
/*$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});*/
--></script>