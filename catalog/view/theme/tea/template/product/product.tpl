<?php echo $header; ?>
  
  <section class="card">
    <div class="container">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="nav-page">
            <ul class="breadcrumbs" id="content">
              <?php			
                $count = count($breadcrumbs);
                $i=1;
                foreach ($breadcrumbs as $breadcrumb) {
                  if($i!=$count){
              ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
              <?php
                  }else{
                    echo '<li class="activ">'.$breadcrumb['text'] . '</li>'; 
                  }		
                  $i++;
                } 
              ?>
            </ul>
          </div>
          <div class="name-product">
            <h1><?php echo $heading_title; ?></h1>
          </div>
          <div class="row">
            <?php if ($thumb) { ?>
            <div class="col-md-6">
              <div class="descriptions-img">
                  <a data-fancybox="gallery" href="<?php echo $popup; ?>" ><img src="<?php echo $thumb; ?>" alt="sales" ></a>
                <div class="zoom-img">
                    <a data-fancybox="gallery" href="<?php echo $popup; ?>" ><img src="catalog/view/theme/tea/image/zoom-img.png" alt="zoom" width="18px" height="19">Увеличить изображение</a>
                </div>
              </div>
            </div>
            <?php } ?>
            
            <div class="col-md-6">
              <div class="descriptions-text">
                <?php echo $description; ?>
              </div>
              
              <div class="price-card">
                <?php if ($price) { ?>
                  <?php if (!$special) { ?>
                  <p>Цена: <?php echo $price; ?></p>
                  <?php } else { ?>
                  <p>Цена: <?php echo $special; ?> <sup><strike><?php echo $price; ?></strike></sup></p>
                  <?php } ?>
                <?php } ?>
              </div>
              
              <div id="product">
                <div class="form-group">
                  <div class="price-corr">
                    <label for="input-quantity"><?php echo $entry_qty; ?></label>
                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" />
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                  </div>
                  <div class="button-card">
                    <a id="button-cart">Добавить в корзину</a>
                    <a href="/index.php?route=information/contact">Обратный звонок</a>
                  </div>
                </div>
                <?php if ($minimum > 1) { ?>
                <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                <?php } ?>
              </div>

              <div class="stamp">
                <button onclick="Stamp()"> <img src="catalog/view/theme/tea/image/stamp.png" width="27px" height="25" alt="">Распечатать</button>
              </div>
              
              <?php if ($payment) { ?>
              <div class="bank-img">
                <?php echo $payment; ?>
              </div>
              <?php } ?>
              
              <?php if ($review_status) { ?>
              <div class="rating">
                <p>
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($rating < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } ?>
                  <?php } ?>
                  <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
                <hr>
                <!-- AddThis Button BEGIN -->
                <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                <!-- AddThis Button END -->
              </div>
              <?php } ?>
            </div>
          </div>
          
          <section class="tabs">
            <div class="tab">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-description" data-toggle="tab">Подробнее</a></li>
                <?php if ($review_status) { ?>
                <li><a href="#tab-review" data-toggle="tab">Отзывы</a></li>
                <?php } ?>
              </ul>
            </div>
            
            <div class="tab-content">
              <div class="tab-pane active tabcontent" id="tab-description">
                <?php if($description){ ?>
                <?php echo $description; ?>
                <?php }else{ ?>
                <?php echo $more; ?>
                <?php } ?>
              </div>
              <?php if ($review_status) { ?>
              <div class="tab-pane tabcontent" id="tab-review">
                <form class="form-horizontal" id="form-review">
                  <div id="review"></div>
                  <h2><?php echo $text_write; ?></h2>
                  <?php if ($review_guest) { ?>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                      <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                      <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label"><?php echo $entry_rating; ?></label>
                      &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                      <input type="radio" name="rating" value="1" />
                      &nbsp;
                      <input type="radio" name="rating" value="2" />
                      &nbsp;
                      <input type="radio" name="rating" value="3" />
                      &nbsp;
                      <input type="radio" name="rating" value="4" />
                      &nbsp;
                      <input type="radio" name="rating" value="5" />
                      &nbsp;<?php echo $entry_good; ?></div>
                  </div>
                  <?php echo $captcha; ?>
                  <div class="buttons clearfix">
                    <div class="pull-right">
                      <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
                </form>
              </div>
              <?php } ?>
            </div>
          </section>
          
          <?php if ($products) { ?>
          <section class="other-products">
            <h3>Другие продукты в той же категории:</h3>
            <div class="sales-categoru">
              <div class="row">
                <?php foreach ($products as $product) { ?>
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                  <div class="sales-item-product">
                    <div class="sales-info-product">
                      <div class="sales-img-product">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="120" height="200"></a>
                      </div>
                      <div class="sales-desc-product">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <p><?php echo $product['description']; ?></p>
                      </div>
                      <div class="more-product">
                        <a href="<?php echo $product['href']; ?>">Подробнее</a>
                      </div>
                      <div class="price-sales-product">
                        <?php if ($product['price']) { ?>
                          <?php if (!$product['special']) { ?>
                          <p>Цена: <?php echo $product['price']; ?></p>
                          <?php } else { ?>
                          <p>Цена: <?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
                          <?php } ?>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="title-sales-card">
                      <a onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Добавить в корзину</a>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
          </section>
          <?php } ?>
        </div>
      </div>
    </div>
  </section>
  
  <?php echo $content_bottom; ?>
  
  <script type="text/javascript"><!--
  $('#button-cart').on('click', function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-cart').button('loading');
      },
      complete: function() {
        $('#button-cart').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');
  
        if (json['success']) {
          $('.breadcrumbs').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
  
          setTimeout(function () {
            $('#cart a .number p').html(json['count']);
            $('#cart a .price p').html(json['price']);
          }, 100);
  
          $('html, body').animate({ scrollTop: 0 }, 'slow');
  
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      },
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
    });
  });
  //--></script>
  
  <script type="text/javascript"><!--
  $('#review').delegate('.page-number li a', 'click', function(e) {
      e.preventDefault();
  
      $('#review').fadeOut('slow');
  
      $('#review').load(this.href);
  
      $('#review').fadeIn('slow');
  });
  
  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
  
  $('#button-review').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: $("#form-review").serialize(),
      beforeSend: function() {
        $('#button-review').button('loading');
      },
      complete: function() {
        $('#button-review').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();
  
        if (json['error']) {
          $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }
  
        if (json['success']) {
          $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
  
          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').prop('checked', false);
        }
      }
    });
      grecaptcha.reset();
  });
  </script>

<script>
  $(document).ready(function() {
    $('.sidebar .sidebar-title').on('click', function () {
      $(this).toggleClass('open');
      $(this).parent().find('.ac-container').toggleClass('open');
    })
  });
</script>
<?php echo $footer; ?>
