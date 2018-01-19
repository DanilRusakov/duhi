<!-- cart box -->
<div class="cart-box" id="simplecheckout_cart">
    <div class="tbl-wrap">
        <table>
            <col class="col01">
            <col class="col02">
            <col class="col03">
            <col class="col04">
            <col class="col05">
            <tbody>
                <?php foreach ($products as $product) { ?>
                <?php if (!empty($product['recurring'])) { ?>
                    <tr>
                        <td class="simplecheckout-recurring-product" style="border:none;"><img src="<?php echo $additional_path ?>catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;" />
                            <span style="float:left;line-height:18px; margin-left:10px;">
                            <strong><?php echo $text_recurring_item ?></strong>
                            <?php echo $product['profile_description'] ?>
                            </span>
                        </td>
                    </tr>
                <? } ?>
                    <tr>
                        <?php if ($product['thumb']) { ?>
                            <td class="first">
                                <div class="item-cart">

                                    <div class="cart-photo">
                                        <img src="<? echo $product['thumb']; ?>" alt="">
                                    </div>
                                    <div class="cart-title"><? echo $product['name']; ?>
                                        <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                                            <span class="product-warning">***</span>
                                        <?php } ?>
                                    </div>
                                </div>
                            </td>
                        <? } ?>
                        <td>
                            <div class="frm-counter">
                                <button class="btn-action-minus" data-onclick="decreaseProductQuantity" data-toggle="tooltip" type="submit"></button>
                                <button class="btn-action-plus" data-onclick="increaseProductQuantity" data-toggle="tooltip" type="submit">
                                </button>
                                <!-- <a data-onclick="decreaseProductQuantity" href="" class="btn-action-plus"></a>
                                <a data-onclick="increaseProductQuantity" href="" class="btn-action-minus"></a> -->
                                <input type="text" value="<?php echo $product['quantity']; ?>" data-onchange="changeProductQuantity" <?php echo $quantity_step_as_minimum ? 'onfocus="$(this).blur()" data-minimum="' . $product['minimum'] . '"' : '' ?> name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>">
                            </div>
                        </td>
                        <td>
                            <!-- <div class="cart-price"><span class="discount">- 20%</span> или - 8 750 ₽</div> -->
                        </td>
                        <td>
                            <div class="cart-price-total"><?php echo $product['total']; ?></div>
                        </td>
                        <td>
                            <a href="" class="btn-action-del added"></a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
    <table class="tbl-total">
        <col class="col01">
            <col class="col02">
                <col class="col03">
                    <col class="col04">
                        <col class="col05">
                            <tbody>
                                <?php foreach ($totals as $total) { ?>
                                    <tr class="tr-total">
                                        <td colspan="3"><?php echo $total['title']; ?></td>
                                        <td><?php echo $total['text']; ?></td>
                                        <td></td>
                                    </tr>
                                    <span class="simplecheckout-cart-total-remove">
                                    <?php if ($total['code'] == 'coupon') { ?>
                                        <i data-onclick="removeCoupon" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
                                    <?php } ?>
                                    <?php if ($total['code'] == 'voucher') { ?>
                                        <i data-onclick="removeVoucher" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
                                    <?php } ?>
                                    <?php if ($total['code'] == 'reward') { ?>
                                        <i data-onclick="removeReward" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
                                    <?php } ?>
                                </span>
                                <? } ?>
                                    <!-- <tr class="tr-total discount">
                                        <td colspan="3">Скидка</td>
                                        <td>- 4 500 ₽</td>
                                        <td></td>
                                    </tr> -->
                                    <tr class="tr-total promo">
                                        <td colspan="4">
                                            Есть промо-код?
                                            <input type="text" value="#гдеоригинал">
                                            <div class="submit">
                                                <a href="" class="btn btn-second"><?php echo $button_update; ?></a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <!-- <tr class="tr-total total">
                                        <td colspan="3">Итого </td>
                                        <td><?php echo $cart_total ?></td>
                                        <td></td>
                                    </tr> -->
                            
                            </tbody>
    </table>
</div>
<!-- /cart box -->
<script>
    function change_count_product(id,quantity){
        alert(id+"  "+quantity);
    }
   
</script>




