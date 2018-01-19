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
  <div><?php echo $description; ?></div>
  <div class="sep-page"></div>
</div>
</div>
<?php echo $footer; ?>