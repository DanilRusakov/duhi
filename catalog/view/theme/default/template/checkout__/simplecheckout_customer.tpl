<div class="simplecheckout-block" id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
 <!-- buyer box -->
  <div class="buyer-box">
      <div class="frm-title"><span>О покупателе</span>
      </div>
      <form action="/" class="frm-main">
          <div class="frm-row">
              <label>ФИО <span class="req">*</span>
              </label>
              <input type="text" value="Бочкин Андрей Леонидович">
          </div>
          <div class="frm-row">
              <label>Моб. телефон <span class="req">*</span>
              </label>
              <input type="tel" value="" placeholder="+7 (___) ___-__-__">
          </div>
          <div class="frm-row">
              <label>Е-mail</label>
              <input type="email" value="bochkin-a@mail.ru">
          </div>
          <div class="frm-row-submit">
              <input type="submit" value="Оформить">
          </div>
      </form>
  </div>
  <!-- /buyer box -->
</div>




<!-- <div class="simplecheckout-block" id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
  <?php if ($display_header || $display_login) { ?>
  <div class="checkout-heading panel-heading"><span><?php echo $text_checkout_customer ?></span><?php if ($display_login) { ?><span class="checkout-heading-button"><a href="javascript:void(0)" data-onclick="openLoginBox"><?php echo $text_checkout_customer_login ?></a></span><?php } ?></div>
  <?php } ?>
  <div class="simplecheckout-block-content">
    <?php if ($display_registered) { ?>
      <div class="alert alert-success"><?php echo $text_account_created ?></div>
    <?php } ?>
    <?php if ($display_you_will_registered) { ?>
      <div class="you-will-be-registered"><?php echo $text_you_will_be_registered ?></div>
    <?php } ?>
    <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
  </div>
</div> -->