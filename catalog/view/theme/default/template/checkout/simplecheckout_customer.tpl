<div class="buyer-box" id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
  <? if ($display_header || $display_login) { ?>
  <div class="frm-title"><span><?php echo $text_checkout_customer ?></span></div>
  <!-- <div class="checkout-heading panel-heading"><span><?php echo $text_checkout_customer ?></span><?php if ($display_login) { ?><span class="checkout-heading-button"><a href="javascript:void(0)" data-onclick="openLoginBox"><?php echo $text_checkout_customer_login ?></a></span><?php } ?></div> -->
  <?php } ?>
  <div class="">
    <?php if ($display_registered) { ?>
      <div class="alert alert-success"><?php echo $text_account_created ?></div>
    <?php } ?>
    <?php if ($display_you_will_registered) { ?>
      <div class="you-will-be-registered"><?php echo $text_you_will_be_registered ?></div>
    <?php } ?>
   <!--  <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?> -->
    <form action="/" class="frm-main">
        <div class="frm-row">
            <label>ФИО <span class="req">*</span>
            </label>
            <input type="text" value="" name="customer[firstname]" id="customer_firstname" data-reload-payment-form="true">
        </div>
        <div class="simplecheckout-rule-group" data-for="customer_firstname">
                      <div style="display: none;" data-for="customer_firstname" data-rule="byLength" class="simplecheckout-error-text simplecheckout-rule" data-length-min="1" data-length-max="32" data-required="true">Имя должно быть от 1 до 32 символов!</div>
          </div>
        <div class="frm-row">
            <label>Моб. телефон <span class="req">*</span>
            </label>
            <input type="tel" id="customer_telephone" value="" placeholder="+7 (___) ___-__-__" name="customer[telephone]"  data-mask="+7(999)999-9999">
        </div>
        <div class="simplecheckout-rule-group" data-for="customer_telephone">
                      <div style="display: none;" data-for="customer_telephone" data-rule="byLength" class="simplecheckout-error-text simplecheckout-rule" data-length-min="3" data-length-max="32" data-required="true">Телефон должен быть от 3 до 32 символов!</div>
                  </div>
        <div class="frm-row">
            <label>Е-mail</label>
            <input type="email" type="email" name="customer[email]" id="customer_email" value="" placeholder="" data-reload-payment-form="true">
        </div>    
    </form>
  </div>
</div>