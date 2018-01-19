<footer>
  <?

  ?>
  <div class="block-7">
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          <p><?php echo $owner; ?><br><?php echo $comment; ?></p>
          <a href="<? echo $informations['4']['href']; ?>"><? echo $informations['4']['title']; ?></a><br>
          <a href="<? echo $informations['5']['href']; ?>"><? echo $informations['5']['title']; ?></a>
        </div>
        <div class="col-sm-4">
          <p><?php echo $powered; ?></p>
        </div>
        <div class="col-sm-4">
          <div class="wr">
            <p><?php echo $address; ?></p>
          </div>
        </div>
      </div>
    </div>
  </div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Корзина товаров</h4>
        </div>
        <div class="modal-body">
          <ul></ul>
        </div>
        <div class="modal-footer">
          <a href="/simplecheckout" class="button btn-primary button_oc btn"><span>Оформить заказ</span></a>
          <button id="continue" type="button" class="btn btn-default" data-dismiss="modal">Продолжить покупки</button>
        </div>
      </div>
      
    </div>
  </div>

</footer>
</div>
<script type="text/javascript" src="catalog/view/theme/default/prettyPhoto/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript">

$( document ).ready(function() {
    $('.block-6 p').each(function () {
        var el= $(this);
        el.click(function(){
            el.parent('li').find('a').click();
        })
    });

    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', social_tools: false});
});
</script>
</body></html>