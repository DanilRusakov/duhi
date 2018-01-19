<!-- cart box -->
<div class="cart-box" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $has_error ? 'data-error="true"' : '' ?>>
<?php if ($display_header) { ?>
    <div class="checkout-heading panel-heading"><?php echo $text_cart ?></div>
<?php } ?>
<?php if ($attention) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>
    <div class="tbl-wrap">
        <table><!-- class="simplecheckout-cart" -->
            <colgroup>
                <col class="col01">
                <col class="col02">
                <col class="col03">
                <col class="col04">
                <col class="col05">
            </colgroup>
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
                <?php } ?>
                <tr>
                    <td class="first">
                        <?php if ($product['thumb']) { ?>
                        <div class="item-cart">
                            <div class="cart-photo">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                            </div>
                            <div class="cart-title"><?php echo $product['name']; ?><?php if ($product['option']) { ?><?php foreach ($product['option'] as $option) { ?><small>, <?php echo $option['value']; ?></small><?php } ?><?php } ?></div>
                        </div>
                        <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                            <span class="product-warning">***</span>
                        <?php } ?>
                        
                        <?php if ($product['reward']) { ?>
                        <small><?php echo $product['reward']; ?></small>
                        <?php } ?>
                        <?php } ?>
                    </td>
                    <?php /* ?> <td class="name">
                        <?php if ($product['thumb']) { ?>
                            <div class="image">
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                            </div>
                        <?php } ?>
                        
                    </td>
                    <td class="model"><?php echo $product['model']; ?></td> <?php */ ?>
                    <td class="quantity">
                        <div class="frm-counter" >
                            <a class="btn-action-minus" data-onclick="decreaseProductQuantity" data-toggle="tooltip" type="submit">
                            </a>
                            <a class="btn-action-plus" data-onclick="increaseProductQuantity" data-toggle="tooltip" type="submit">
                            </a>
                            <input class="" type="text" data-onchange="changeProductQuantity" <?php echo $quantity_step_as_minimum ? 'onfocus="$(this).blur()" data-minimum="' . $product['minimum'] . '"' : '' ?> name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                        </div>
                    </td>
                    <td>
                    <?php if ($product['difference'] && $product['percent']) { ?>
                    <div class="cart-price"><span class="discount">- <?php echo $product['percent']; ?>%</span> или - <?php echo $product['difference']; ?></div>
                    <?php }else{ ?>
                    <div class="cart-price"><?php echo $product['price']; ?></div>
                    <?php } ?>
                    </td>
                    <td class="cart-price-total"><?php echo $product['total']; ?></td>
                    <td><a href="javascript://" class="btn-action-del added" data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key'] ?>"></a></td>
                </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher_info) { ?>
                    <tr>
                        <td class="image"></td>
                        <td class="name"><?php echo $voucher_info['description']; ?></td>
                        <td class="model"></td>
                        <td class="quantity">
                            <div class="input-group btn-block" style="max-width: 200px;">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" data-onclick="decreaseProductQuantity" data-toggle="tooltip" type="submit">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </span>
                                <input class="form-control" type="text" value="1" disabled size="1" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" data-onclick="removeGift" data-gift-key="<?php echo $voucher_info['key']; ?>" type="button">
                                        <i class="fa fa-times-circle"></i>
                                    </button>
                                </span>
                            </div>
                        </td>
                        <td class="price"><?php echo $voucher_info['amount']; ?></td>
                        <td class="total"><?php echo $voucher_info['amount']; ?></td>
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
    <?php if ($total['code'] == 'total') { ?>
        <?php if (isset($modules['coupon'])) { ?>
            <tr class="tr-total promo">
                <td colspan="4"><?php echo $entry_coupon; ?>
                    <input placeholder="введите код" class="" type="text" data-onchange="reloadAll" name="coupon" value="<?php echo $coupon; ?>" style="margin-left: 25px !important;" />
            <?php if (isset($modules['coupon']) || (isset($modules['reward']) && $points > 0) || isset($modules['voucher'])) { ?>
            <div class="submit">
                <a class="btn btn-second" id="simplecheckout_button_cart" data-onclick="reloadAll"><? echo $button_update; ?></a>
            </div>
            </td>
            <?php } ?>
            <td></td>
           </tr>
        <?php } ?>
    <?php } ?>
    <tr class="tr-total<?php if ($total['code'] == 'coupon' || $total['code'] == 'discount_total') { ?> discount<?php } ?><?php if ($total['code'] == 'total') { ?> total<?php } ?>" id="total_<?php echo $total['code']; ?>">
        <td colspan="3"><?php echo $total['title']; ?></td>
        <td class="simplecheckout-cart-total-value"><?php echo $total['text']; ?></td>
        <td>
            <?php if ($total['code'] == 'coupon') { ?>
                <a href="javascript://" class="btn-action-del added" data-onclick="removeCoupon" title="<?php echo $button_remove; ?>"></a>
            <?php } ?>
            <?php if ($total['code'] == 'voucher') { ?>
                <a href="javascript://" class="btn-action-del added" data-onclick="removeVoucher" title="<?php echo $button_remove; ?>"></a>
            <?php } ?>
            <?php if ($total['code'] == 'reward') { ?>
                <a href="javascript://" class="btn-action-del added" data-onclick="removeReward" title="<?php echo $button_remove; ?>"></a>
            <?php } ?>
        </td>
    </tr>
<?php } ?>
<?php if (isset($modules['reward']) && $points > 0) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_reward; ?>&nbsp;<input class="form-control" type="text" name="reward" data-onchange="reloadAll" value="<?php echo $reward; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_voucher; ?>&nbsp;<input class="form-control" type="text" name="voucher" data-onchange="reloadAll" value="<?php echo $voucher; ?>" /></span>
    </div>
<?php } ?>
</tbody>
</table>


<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
    <div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>
<?php if (!$display_model) { ?>
    <style>
    .simplecheckout-cart col.model,
    .simplecheckout-cart th.model,
    .simplecheckout-cart td.model {
        display: none;
    }
    </style>
<?php } ?>
</div>