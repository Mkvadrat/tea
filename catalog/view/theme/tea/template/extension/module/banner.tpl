<section class="slider-top">
  <div id="banner<?php echo $module; ?>" class="owl-carousel owl-theme">
    <?php foreach ($banners as $banner) { ?>
      <div class="item">
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
        <div class="slider-info">
          <h1><?php echo $banner['name']; ?></h1>
          <a href="<?php echo $banner['link']; ?>">Подробнее</a>
        </div>
      </div>
    <?php } ?>
  </div>
</section>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
  loop:true,
  margin:10,
  nav:true,
  responsive:{
    0:{
      items:1
    },
    600:{
      items:1
    },
    1000:{
      items:1
    }
  }
});
--></script>


