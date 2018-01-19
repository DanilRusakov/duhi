<?php echo $header; ?>
<div class="page">
  <div class="breadcrumb-box">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-second"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
</div>
</div>
<?php echo $footer; ?>