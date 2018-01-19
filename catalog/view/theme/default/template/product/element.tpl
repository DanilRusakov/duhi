<?php if ($elements) { ?>
<div class="form-group">
  <?php foreach ($elements as $element) { ?>
  <?php if ($element['type'] == 'element') { ?>
  <?php if ($element['group_title'] && $element['group_title_status']) { ?>
  <?php echo $element['group_title']; ?>
  <?php } ?>
  <?php foreach ($element['option_element_value'] as $element_value) { ?>
  <div class="option-item">
    <?php if ($element_value['images']) { ?>
    <div class="item-image">
      <?php foreach ($element_value['images'] as $image) { ?>
      <?php if ($image['thumb']) { ?>
      <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $element_value['img_title']; ?>">
        <img src="<?php echo $image['thumb']; ?>" width="<?php echo $image['width']; ?>" height="<?php echo $image['height']; ?>" title="<?php echo $element_value['img_title']; ?>" alt="<?php echo $element_value['img_title']; ?>" />
      </a>
      <?php } ?>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="item-caption">
      <?php if ($element_value['sku']) { ?>
      <span class="item-sku"><?php echo $text_sku; ?> <?php echo $element_value['sku']; ?></span>
      <?php } ?>
      <?php if ($element_value['title_status']) { ?>
      <?php echo '<'.$element_value['title_tag'].' class="item-title">'; ?>
      <?php if ($element_value['url']) { ?>
      <a href="<?php echo $element_value['url']; ?>" <?php echo $element_value['target'] ? 'target="_blank"' : ''; ?>><?php echo $element_value['title']; ?></a>
      <?php } else { ?>
      <?php echo $element_value['title']; ?>
      <?php } ?>
      <?php echo '</'.$element_value['title_tag'].'>'; ?>
      <?php } ?>
      <?php if ($element_value['description']) { ?>
      <?php echo $element_value['description']; ?>
      <?php } ?>
      <?php if ($element_value['price']) { ?>
      <div class="item-cart" id="<?php echo $product_id ?><?php echo $element_value['product_option_value_id']; ?>">
        <div class="item-price-wrapper">
          <div class="item-price"><?php echo $element_value['price']; ?></div>
          <?php if ($element_value['tax']) { ?>
          <div class="item-tax"><?php echo $text_tax; ?> <?php echo $element_value['tax']; ?></div>
          <?php } ?>
        </div>
        <?php if ($element_value['quantity_form'] && $element_value['quantity']) { ?>
        <div class="item-quantity-wrapper">
          <input type="text" name="item_quantity" value="<?php echo $element_value['minimum']; ?>" class="item-form" />
        </div>
        <?php } ?>
        <div class="item-cart-wrapper">
          <?php if ($element_value['quantity']) { ?>
          <?php if ($element_value['cart_status']) { ?>
          <button type="button" onclick="oe.add('<?php echo $product_id ?><?php echo $element_value['product_option_value_id']; ?>');" class="item-cart-btn cart-active"><?php echo $element_value['button_cart']; ?></button>
          <?php } else { ?>
          <button type="button" onclick="oe.add('<?php echo $product_id ?><?php echo $element_value['product_option_value_id']; ?>');" class="item-cart-btn"><?php echo $element_value['button_cart']; ?></button>
          <?php } ?>
          <input type="hidden" name="product_id" value="<?php echo $product_id ?>" />
          <input type="hidden" name="item_minimum" value="<?php echo $element_value['minimum']; ?>" />
          <input type="hidden" name="item_option[<?php echo $element['product_option_id']; ?>]" value="<?php echo $element_value['product_option_value_id']; ?>" />
          <?php } else { ?>
          <button type="button" disabled="disabled" class="item-cart-btn"><?php echo $element_value['button_cart']; ?></button>
          <?php } ?>
        </div>
        <div class="item-checkout-wrapper">
          <a role="button" href="<?php echo $checkout; ?>" class="item-checkout-btn"><?php echo $text_checkout; ?></a>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php } ?>
  <?php } ?>
</div>
<?php } ?>
<script type="text/javascript"><!--
  $(document).ready(function() {
    $('.item-image').each(function() {
      $(this).magnificPopup({
        delegate: 'a',
        type: 'image',
        gallery: {
          enabled:true
        }
      });
    });
  });
//--></script>