<?php echo $header; ?>

  <section class="card">
    <div class="container">
      <div class="row sidebar">
        <div class="col-md-12">
          <div class="nav-page">
            <ul>
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
          <div class="wrapper-text">
            <?php if ($categories) { ?>
            <p><strong><?php echo $text_index; ?></strong>
              <?php foreach ($categories as $category) { ?>
              &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
              <?php } ?>
            </p>
            <?php foreach ($categories as $category) { ?>
            <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
            <?php if ($category['manufacturer']) { ?>
            <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
            <div class="row">
              <?php foreach ($manufacturers as $manufacturer) { ?>
              <div class="col-sm-3"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
              <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons clearfix">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </section>

<?php echo $footer; ?>