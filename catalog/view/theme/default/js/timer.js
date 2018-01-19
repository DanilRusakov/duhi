$( document ).ready(function() {

    var ee = $(window).width();

// scripts
    $('.but-in').not('.popup').on('click', function(){
        var alias = $(this).attr('data-alias');
        var id = $(this).attr('data-id');
        var text = $(this).parent().parent().parent().find('p.text').text();
       var name = $(this).parent().parent().parent().find('.cen>div:eq(0) p').text();
       var sv = $(this).parent().parent().parent().find('.cen>div:eq(0) span').text();
        var cen = $(this).parent().parent().parent().find('.cen>div:eq(1) p').text();
       var old = $(this).parent().parent().parent().find('.cen>div:eq(1) span').text();

        var sr = $(this).parent().parent().parent().find('img').attr('src');
       // alert(text)
        $('.block').find('img').attr('src',sr);
        $('.block .col-sm-18>div p').text(name);
        $('.block .col-sm-18>div span').text(sv);
        $('.block .col-sm-18>p.text').text(text);
        $('.block .wr p').text(cen);
        $('.block .wr span').text(old);
        var lvmsg = '#lv-formLanding' + id + '-goods' ;
        $('.email').removeClass().addClass('email lv2-form lv2-form'+id+'').attr('id','lv-formLanding'+id+'');
        $('.lv-input-goods').attr('id',lvmsg).attr('value','{"' + alias + '":{"quantity":1,"sum":"1190"}}');
    });



    $('.wr span').text(function(){
               return parseInt(Math.random() * (342 - 144 + 1)+ 144);
          });

    $(window).bind('scroll', function() {
        if ($(window).scrollTop() >650) {
            $('.block-v').addClass('fixed');
            $('.block-v .but-in').hide();
           // $('.block-v .but-mob').show();
            $('.block-v .tel-mob').show();
        }
        else {
            $('.block-v').removeClass('fixed');
            $('.block-v .but-in').show();
            //$('.block-v .but-mob').hide();
            $('.block-v .tel-mob').hide();
        }
    });

    var allLinks = $('a.f,.wr-menu a,.nav a');
    allLinks.on('click',function (a) {
        a.preventDefault();
         var target = $(this).attr('href');
        if($('.block-v').hasClass('fixed')){
            $('html, body').animate({scrollTop: $(target).offset().top - 128}, 'slow');
             }else{
            $('html, body').animate({scrollTop: $(target).offset().top - 270}, 'slow');
        }
        $('.nav a').each(function(){
            $(this).click(function () {
                $(this).addClass("active");
                allLinks.not(this).removeClass("active");
            });
            });

$('.sank .nav a').each(function(){
            $(this).click(function () {
                var target = $(this).attr('href');
                $('html, body').animate({scrollTop: $(target).offset().top - 28}, 'slow');
            });
       });
            return false;
     });
    //
    if (ee >= 770) {
        $('.wr-menu').removeClass('clos');

    } else {
        $('.wr-menu').addClass('clos');
    }
    ///
    var flag = new Boolean(true);

    $('.but-mob').click(function () {
        if (flag) {
            flag = false;
            func1.call(this);
        } else {
            flag = true;
            func2.call(this);
        }
        return false;
    });

    function func1() {
        $('.wr-menu').css({display: 'block', right: '-340px'}).animate({right: '0'}, 300)
        $('.black').show();
    }

    function func2() {
        $('.wr-menu').animate({right: '-340px'}, 300);
        $('.black').hide();
    }

    $('body').click(function () {
        func2();
        flag = true;
    });
    ///
    $('.block-1 ul li a').each(function () {
        var el= $(this).parent().parent().parent().parent().find('.img');
        el.click(function(){
            el.parent().parent('li').find('a').click();
        })
    });
$('.block-6 p').each(function () {
        var el= $(this);
        el.click(function(){
            el.parent('li').find('a').click();
        })
    });

    //
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', social_tools: false});
    //

    // мобильно /////////////////////////////////////

    if (ee <= 600) {
        var viewport = document.querySelector("meta[name=viewport]");
        viewport.setAttribute('content', 'width=550');
    }

    $('a[rel*=leanModal]').leanModal({ top: 70, overlay: 0.8, closeButton: ".modal_close" });
    ///////

});