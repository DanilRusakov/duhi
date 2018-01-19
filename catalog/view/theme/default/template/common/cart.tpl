<div class="general">
    <a href="" class="btn-cart js-btn-toggle <?php if($count_products>0){ echo 'full';}?>" data-count="<? echo $count_products; ?>">

        <span id="cart-title" class="cart-title ">В вашей корзине <br><?php echo $text_items; ?></span>
    </a>
    <div class="cart-block js-popup-block">
        <table>
            <col class="col01">
            <col class="col02">
            <col class="col03">
            <col class="col04">
            <tbody>
              <? if (isset($products)){?>
              <?php foreach ($products as $product) { ?>
                <tr id="product_row-<?php echo $product['cart_id']; ?>">
                  <td>
                    <a  href="<?php echo $product['href']; ?>" class="item-cart">
                        <span class="cart-photo center-image"><img src="<? echo $product['thumb']; ?>" alt="<? echo $product['name']; ?>" title="<? echo $product['name']; ?>"></span>
                        <span class="cart-title"><? echo $product['name']; ?><?php if ($product['option']) { ?><?php foreach ($product['option'] as $option) { ?><small>, <?php echo $option['value']; ?></small><?php } ?><?php } ?></span>
                    </a>
                  </td>
                  <td>
                    <div class="cart-count">х <?php echo $product['quantity']; ?></div>
                  </td>
                  <td>
                    <div class="cart-price"><?php echo $product['total']; ?></div>
                  </td>
                  <td>
                    <a onclick="cart.remove('<?php echo $product['cart_id']; ?>');" href="#" class="btn-action-del" ></a>
                  </td>
                </tr>
              <?php }} if(isset($totals) && $count_products!=0){ ?>
              <?php foreach($totals as $total) { ?>
                <tr class="tr-total<?php if ($total['code'] == 'coupon' || $total['code'] == 'discount_total') { ?> discount<?php } ?><?php if ($total['code'] == 'total') { ?> total<?php } ?>">
                    <td colspan="2">
                        <?php echo $total['title']; ?>
                    </td>
                    <td><?php echo $total['text']; ?></td>
                </tr>
              <?php } ?>
              <?php }else{ ?>
              Корзина пуста
              <? }?>
            </tbody>
        </table>

        <div class="cart-button" style="<?php if($count_products==0){ echo 'display: none;';} ?>"><a href="<?php echo $checkout; ?>" class="btn"><?php echo $text_checkout; ?></a>
        </div>
    </div>
  <div class="cart-overlay"></div>
</div>

<!-- <a href="" class="btn-menu-cart"><span><? echo $count_products; ?></span></a> -->

                      
