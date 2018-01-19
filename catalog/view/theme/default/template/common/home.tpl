<?php echo $header; ?>
<?php echo $content_top; ?>
        <!-- page -->
        <div class="page">

        <?php if ($config_catalog_status && $categories) { ?>
        <h1 >Коллекции Montale</h1>
          <?php if ($config_catalog_menu_status) { ?>
          <!-- cnt menu -->
            <div class="cnt-menu-box">
                <ul>
                    <?php foreach ($categories as $category) { ?>
                      <li><a href="#<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?> <!-- <span><?php echo $category['product_count']; ?></span> --></a></li>
                    <?php } ?>
                </ul>
            </div>
          <!-- /cnt menu -->
          <?php } ?>

          <!-- catalog box -->
          
          <?php foreach ($categories as $category) { ?>
         <!--  <?echo "<pre>";print_r($category);?> -->
          <a name = "<?php echo $category['category_id']; ?>"></a>
            <div id="category-desc-<? echo $category['category_id']; ?>">
                <h2><?php echo $category['name']; ?></h2>
                <p><?php echo $category['description']; ?></p>
            </div> 
              <div class="catalog-box" id="category-<? echo $category['category_id']; ?>">
                <div class="items-wrap">
                <? $i = 0;?>
                <?php foreach ($category['products'] as $product) { ?>
                <!-- item -->  
                    <div class="item-wrap" style = "<? if($i>=4){echo 'display:none';} ?>">
                        <a href="<?php echo $product['href']; ?>"  class="item-catalog">
                            <span class="cat-photo center-image"><img src="<?php echo $product['thumb']; ?>" alt=""></span>
                            <?php if ($product['special']) { ?><span class="elm-discount">-<?php echo $product['percent']; ?>%</span><?php } ?>
                            <span class="cat-title"><?php echo $product['name']; ?></span>
                            <span class="cat-price">
                            <?php if ($product['min_price'] && $product['max_price']) { ?>
                                <?php if ($product['min_price'] == $product['max_price']) { ?>
                                <?php echo $product['max_price']; ?>
                                <?php } else { ?>
                                <?php echo $product['min_price']; ?> - <?php echo $product['max_price']; ?>
                                <?php } ?>
                            <?php } else { ?>
                            <?php if($product['special']){ ?>
                                <?php echo $product['special']; ?>
                            <?php } else { ?>
                                <?php echo $product['price']; ?>
                            <?php } ?>
                            <?php } ?>
                            </span>
                        </a>
                    </div>
                  <!-- /item -->
                <?php $i+=1;} ?>
                </div>
            </div>
            <div class="simplecheckout-button-right" style = "<? if($i<=4){echo 'display:none';} ?>">
                <button onclick="load_product('<? echo $category['category_id']; ?>')" id="button-cat-<? echo $category['category_id']; ?>" class="btn-second btn">Еще ароматы</button>
            </div><br>
          <?php } ?>
        <?php } ?>


        </div>
        <!-- /page -->
        <div class="sep-page"></div>
    </div>
    <!-- /wrap -->
 <script>
     $('button.opened').click(function(e){
           e.stopImmediatePropagation();
           alert('hi');
        });
    function load_product(category_id){
        $('button.opened').click();
        
        $('#category-'+category_id+'>div > div').attr('style','');
        $('html, body').animate({
            scrollTop: ($('#category-desc-'+category_id).first().offset().top)
        },100);
        $('#button-cat-'+category_id).attr('onclick','hide('+category_id+')');
        $('#button-cat-'+category_id).text('Свернуть');
        $('#button-cat-'+category_id).addClass('opened');

    }
    function hide(category_id){
        $('#category-'+category_id+'>div > div').attr('style','display:none;');
        $('#category-'+category_id+'>div > div:nth-child(1)').attr('style','');
        $('#category-'+category_id+'>div > div:nth-child(2)').attr('style','');
        $('#category-'+category_id+'>div > div:nth-child(3)').attr('style','');
        $('#category-'+category_id+'>div > div:nth-child(4)').attr('style','');
       
        $('#button-cat-'+category_id).attr('onclick','load_product('+category_id+')');
        $('#button-cat-'+category_id).removeClass("opened");
        $('#button-cat-'+category_id).text('Еще ароматы');
    }
    

      
</script>
<?php echo $footer; ?>