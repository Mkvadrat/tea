<section class="title">
  <h2><?php echo $heading_title; ?></h2>
</section>
<?php if($categories){ ?>
<section class="product">
  <div class="container">
    <div class="row">
      <?php foreach($categories as $category){ ?>
      <div class="col-xs-12 col-sm-4 col-md-3">
        <div class="product-item">
          <div class="photobox photobox_type">
            <div class="photobox__previewbox">
              <img src="<?php echo $category['image']; ?>" class="photobox__preview" width="280" height="200" alt="<?php echo $category['name']; ?>">
              <span class="photobox__label"> <a href="<?php echo $category['href']; ?>">Подробнее</a></span>
            </div>
            <div class="title-pro">
              <p><?php echo $category['name']; ?></p>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
</section>
<?php } ?>
