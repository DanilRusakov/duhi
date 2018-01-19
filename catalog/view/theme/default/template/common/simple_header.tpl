<?php echo $header; ?>
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
<!-- page -->
<div class="page">
  <div class="breadcrumbs-box">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <? break;} ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
 <div class="simple-content" >
<!-- <div class=""> -->
  
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row" ><?php echo $column_left; ?><!--  -->
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" ><?php echo $content_top; ?><!-- class="<?php echo $class; ?>" -->
      