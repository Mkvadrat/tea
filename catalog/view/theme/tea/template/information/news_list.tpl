<?php echo $header; ?>
	
	<section class="category">
	  <div class="container">
		<div class="row sidebar">
		  <div class="col-md-4 col-sm-5 col-xs-12 sidebar">
			<div class="sidebar">
				<?php echo $column_left; ?>
			</div>
		  </div>
		  <div class="col-md-8 col-sm-7 col-xs-12">
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
			<div class="desc-product">
				<?php echo $description_blog; ?>
			</div>
			<div class="blog">
			  <div class="row">
				<?php if($news_list){ ?>
				<?php foreach($news_list as $news){ ?>
				<div class="col-md-12">
				  <div class="blog-item">
					<div class="row">
					  <div class="col-md-5 col-sm-12 col-xs-12">
						<div class="blog-img">
						  <a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" width="300" height="200" alt="blog"></a>
						</div>
					  </div>
					  <div class="col-md-7 col-sm-12 col-xs-12">
						<div class="blog-desk">
						  <a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a>
						  <p><?php echo $news['description']; ?></p>
						  <a href="<?php echo $news['href']; ?>" class="blog-info">Подробнее</a>
						</div>
					  </div>
					</div>
				  </div>
				</div>
				<?php } ?>
				<?php }else{ ?>
				<p><?php echo $text_empty; ?></p>
				<div class="buttons">
					<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
				</div>
				<?php } ?>
			  </div>
			</div>
			<section class="page-number">
				<?php echo $pagination; ?>
			</section>
			<section class="test-seo">
				<?php echo $seo_blog; ?>
			</section>
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