<?php echo $header; ?>

  <section class="category">
    <div class="container">
      <div class="row sidebar">
        <div class="col-xs-12 sidebar sidebar__block">
          <?php echo $column_left; ?>
        </div>
        <div class="col-xs-12 catalog__block">
          <div class="nav-page">
            <ul id="content">
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
			<h2><?php echo $text_search; ?></h2>			
          <?php if ($products) { ?>
          <section class="list-filter list-style container-fluid">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="style-left">
                  <div class="view-item">
                    <div class="row">
                      <div class="col-md-5 col-sm-5 col-xs-6">
                        <span>Вид:</span>
                        <button type="button" id="grid-view"> <img src="catalog/view/theme/tea/image/block-list.png" width="16" height="16" alt=""> </button>
                        <button type="button" id="list-view"> <img src="catalog/view/theme/tea/image/block-list1.png" width="16" height="16" alt=""> </button>
                      </div>
                      <div class="col-md-7 col-sm-7 col-xs-6">
                        <span>Сортировка:</span>
                        <select id="input-sort" onchange="location = this.value;">
                          <?php foreach ($sorts as $sorts) { ?>
                          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                          <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        
          <div class="sales-categoru">
            <div class="row">
              <?php foreach ($products as $product) { ?>
              <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 grid">
                <div class="sales-item-product">
                  <div class="sales-info-product">
                    <div class="sales-img-product">
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" ></a>
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
              
              <?php foreach ($products as $product) { ?>
              <div class="col-md-12 list current-none-active">
                <div class="sales-item-list">
                  <div class="sales-info-list">
                    <div class="sales-img-list">
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['list_thumb']; ?>" alt="<?php echo $product['name']; ?>" ></a>
                    </div>
                    <div class="sales-desc-list">
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                      <p><?php echo $product['description']; ?></p>
                    </div>
                    <div class="more-list">
                      <a href="<?php echo $product['href']; ?>">Подробнее</a>
                    </div>
                    <div class="price-sales-list">
                      <?php if ($product['price']) { ?>
                        <?php if (!$product['special']) { ?>
                        <p>Цена: <?php echo $product['price']; ?></p>
                        <?php } else { ?>
                        <p>Цена: <?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
                        <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="title-sales-product-list">
                    <a onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Добавить в корзину</a>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          
          <section class="page-number">
            <?php echo $pagination; ?>
          </section>
          <?php } ?>
          
          <?php if (!$categories && !$products) { ?>
          <p><?php echo $text_empty; ?></p>
          <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
          <?php } ?>
          
          <?php if($description){ ?>
          <section class="test-seo">
            <?php echo $bottom_description; ?>
          </section>
          <?php } ?>
        </div>
      </div>
    </div>
  </section>
  
  <?php echo $content_bottom; ?>
  <script>
  $(document).ready(function() {
    $('.sidebar .sidebar-title').on('click', function () {
      $(this).toggleClass('open');
      $(this).parent().find('.ac-container').toggleClass('open');
    })
  });
</script>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>
