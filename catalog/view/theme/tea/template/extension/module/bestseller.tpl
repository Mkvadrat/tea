<section class="title">
  <h3><?php echo $heading_title; ?></h3>
</section>
<section class="sales">
  <div class="container">
    <div class="row">
      <?php foreach($products as $product){ ?>
      <div class="col-md-4">
        <div class="sales-item">
          <div class="sales-info">
            <div class="sales-img">
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="194" height="275"></a>
            </div>
            <div class="sales-desc">
              <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <p><?php echo $product['description']; ?></p>
            </div>
            <div class="more">
              <a href="<?php echo $product['href']; ?>">Подробнее</a>
            </div>
            <div class="price-sales">
              <?php if ($product['price']) { ?>
                <?php if (!$product['special']) { ?>
                <span>Цена опт: <?php echo $product['price']; ?></span>
                <?php } else { ?>
                <span>Цена опт: <?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></span>
                <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="title-sales">
            <a onclick="cart.add('<?php echo $product['product_id']; ?>');">Добавить в корзину</a>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</section>