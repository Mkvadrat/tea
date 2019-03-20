<?php echo $header; ?>

<section class="card">
  <div class="container">
    <div class="row sidebar">
      <div class="col-xs-12 sidebar sidebar__block">
          <?php echo $column_left; ?>
      </div>
      <div class="col-xs-12 catalog__block">
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
          <?php echo $description; ?>
        </div>
      </div>
    </div>
  </div>
</section>
    <script>
  $(document).ready(function() {
    $('.sidebar .sidebar-title').on('click', function () {
      $(this).toggleClass('open');
      $(this).parent().find('.ac-container').toggleClass('open');
    })
  });
</script>
<?php echo $footer; ?>