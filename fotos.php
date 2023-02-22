<?php
include_once 'template.php';
include_once 'classes/dao/FotoDAO.php';

$anos = FotoDAO::getInstancia()->obterPastasAlbum();

?>

<div id="common-home" class="container">
	<ul class="breadcrumb">
		<li>
			<a href="">
				<i class="fa fa-home"></i>
			</a>
		</li>
		<li>
			<a href="fotos">Fotos do Bairro</a>
        </li>
	</ul>
  	<p></p>
	<div class="row">
		<div id="content" class="col-sm-12">
			
			<h2>Fotos do Bairro</h2>
			<br>
			<div class="row">
					<?php foreach($anos as $ano) { ?> 
						<div  class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-6">
							<div class="product-thumb transition">
								<div class="image">
									<a href="album?ano=<?php echo $ano->getAno(); ?>">
										<img src="<?php echo $ano->getFotoPrincipal(); ?>" title="Fotos do ano <?php echo $ano->getAno(); ?>" class="img-responsive" style="height:170px; width:269px;">
									</a>
								</div>
								<div class="caption">
									<h4 style="min-height: 30px;">
										<a href="album?ano=<?php echo $ano->getAno(); ?>" title="Fotos do ano <?php echo $ano->getAno(); ?>"><?php echo $ano->getAno(); ?></a>
									</h4>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
			</div>
			
	</div>
</div>

<script>
    register('<?php echo $_SERVER['REQUEST_URI']; ?>');
</script>

<?php include_once 'footer.php'; ?>