<div class="col-md-2 basket" id="cart">
  <div id="search" class="input-group">
    <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
    <span class="input-group-btn">
      <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
    </span>
  </div>
  <a href="<?php echo $cart; ?>">
    <img src="catalog/view/theme/tea/image/basket-icon.png" alt="basket-icon" width="22" height="19">
    <div class="number">
      <p><?php echo $count; ?></p>
    </div>
    <div class="price">
      <p>- <?php echo $price; ?></p>
    </div>
  </a>
</div>
