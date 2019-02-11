<?php echo $header; ?>
	
	<section class="card">
		<div class="container">
			<div class="row sidebar">
				<div class="col-md-4 sidebar">
					<div class="sidebar">
						<?php echo $column_left; ?>
					</div>
				</div>
				<div class="col-md-8">
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
					<div class="wrapper-text">
						<h2>Статья не найдена!</h2>
					</div>
				</div>
			</div>
		</div>
    </section>

<?php echo $footer; ?>