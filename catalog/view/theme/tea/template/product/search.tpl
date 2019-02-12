<?php echo $header; ?>

  <section class="category">
    <div class="container">
      <div class="row sidebar">
        <div class="col-md-4 sidebar">
          <?php echo $column_left; ?>
        </div>
        <div class="col-md-8">
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
          <div class="name-product" id="content">
            <h1><?php echo $heading_title; ?></h1>
            <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
            <div class="row">
              <div class="col-sm-4">
                <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
              </div>
              <div class="col-sm-3">
                <select name="category_id" class="form-control">
                  <option value="0"><?php echo $text_category; ?></option>
                  <?php foreach ($categories as $category_1) { ?>
                  <?php if ($category_1['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_1['children'] as $category_2) { ?>
                  <?php if ($category_2['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                  <?php } ?>
                  <?php foreach ($category_2['children'] as $category_3) { ?>
                  <?php if ($category_3['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <div class="col-sm-3">
                <label class="checkbox-inline">
                  <?php if ($sub_category) { ?>
                  <input type="checkbox" name="sub_category" value="1" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="sub_category" value="1" />
                  <?php } ?>
                  <?php echo $text_sub_category; ?></label>
              </div>
            </div>
            <p>
              <label class="checkbox-inline">
                <?php if ($description) { ?>
                <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="description" value="1" id="description" />
                <?php } ?>
                <?php echo $entry_description; ?></label>
            </p>
            <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
            <h2><?php echo $text_search; ?></h2>
          </div>
          
          <?php if ($products) { ?>
          <section class="list-style">
            <div class="style-left">
              <div class="view-item">
                <p>Вид:</p>
                <button type="button" id="grid-view"> <img src="catalog/view/theme/tea/image/block-list.png" width="16" height="16" alt=""> </button>
                <button type="button" id="list-view"> <img src="catalog/view/theme/tea/image/block-list1.png" width="16" height="16" alt=""> </button>

                <p>Сортировка:</p>
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
            <div class="style-right">
              <p>Показать:</p>
              <select id="input-limit" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </section>
        
          <div class="sales-categoru">
            <div class="row">
              <?php foreach ($products as $product) { ?>
              <div class="col-md-4 grid">
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
                        <p>Цена опт: <?php echo $product['price']; ?></p>
                        <?php } else { ?>
                        <p>Цена опт: <?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
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
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['list_thumb']; ?>" alt="<?php echo $product['name']; ?>" width="200" height="320"></a>
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
                        <p>Цена опт: <?php echo $product['price']; ?></p>
                        <?php } else { ?>
                        <p>Цена опт: <?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
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
        </div>
      </div>
    </div>
  </section>
  
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