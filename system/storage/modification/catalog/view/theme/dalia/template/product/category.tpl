<?php echo $header; 
if(isset($mfilter_json)) {
	if(!empty($mfilter_json)) { 
		echo '<div id="mfilter-json" style="display:none">' . base64_encode( $mfilter_json ) . '</div>'; 
	} 
}

$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
$background_status = false;
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/new_elements/wrapper_top.tpl'); ?>
<div id="mfilter-content-container">
  <?php if ($thumb || $description) { ?>
  <div class="category-info clearfix">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories && $theme_options->get('refine_search_style') != '2') { ?>
  <div class="refine_search_overflow text-center"><h2 class="refine_search"><?php echo $text_refine; ?></h2></div>
  <div class="category-list<?php if ($theme_options->get('refine_search_style') == '1') { echo ' category-list-text-only'; } ?>">
  	<div class="row">
  	  <?php 
  	  $class = 3; 
  	  $row = 4; 
  	  
  	  if($theme_options->get( 'refine_search_number' ) == 2) { $class = 62; }
  	  if($theme_options->get( 'refine_search_number' ) == 5) { $class = 25; }
  	  if($theme_options->get( 'refine_search_number' ) == 3) { $class = 4; }
  	  if($theme_options->get( 'refine_search_number' ) == 6) { $class = 2; }
  	  
  	  if($theme_options->get( 'refine_search_number' ) > 1) { $row = $theme_options->get( 'refine_search_number' ); } 
  	  ?>
	  <?php $row_fluid = 0; foreach ($theme_options->refineSearch() as $category) { $row_fluid++; ?>
	  	<?php 
	  	if ($theme_options->get('refine_search_style') != '1') {
	  		$width = 250;
	  		$height = 250;
	  		if($theme_options->get( 'refine_image_width' ) > 20) $width = $theme_options->get( 'refine_image_width' );
	  		if($theme_options->get( 'refine_image_height' ) > 20) $height = $theme_options->get( 'refine_image_height' );
	  		$model_tool_image = $registry->get('model_tool_image');
		  	if($category['thumb'] != '') { 
		  		$image = $model_tool_image->resize($category['thumb'], $width, $height); 
		  	} else { 
		  		$image = $model_tool_image->resize('no_image.jpg', $width, $height); 
		  	} 
	  	}
	  	?>
	  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
	  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
	  		<?php if ($theme_options->get('refine_search_style') != '1') { ?>
		  	<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
		  	<?php } ?>
		  	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	  	</div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <!-- Filter -->
  <div class="product-filter clearfix">
  	<div class="options">
  		<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  		
  		<div class="button-group display" data-toggle="buttons-radio">
  			<button id="grid" <?php if($theme_options->get('default_list_grid') == '1') { echo 'class="active"'; } ?> rel="tooltip" title="Grid" onclick="display('grid');"><i class="fa fa-th-large"></i></button>
  			<button id="list" <?php if($theme_options->get('default_list_grid') != '1') { echo 'class="active"'; } ?> rel="tooltip" title="List" onclick="display('list');"><i class="fa fa-th-list"></i></button>
  		</div>
  	</div>
  	
  	<div class="list-options">
  		<div class="sort">
  			<select onchange="location = this.value;">
  			  <?php foreach ($sorts as $sorts) { ?>
  			  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  			  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  		
  		<div class="limit">
  			<select onchange="location = this.value;">
  			  <?php foreach ($limits as $limits) { ?>
  			  <?php if ($limits['value'] == $limit) { ?>
  			  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  	</div>
  </div>
  
  <!-- Products list -->
  <div class="product-list"<?php if(!($theme_options->get('default_list_grid') == '1')) { echo ' class="active"'; } ?>>
  	<?php foreach ($products as $product) { ?>
  	<!-- Product -->
  	<div>
  		<div class="row">
  			<div class="image col-sm-3">
  				<?php if($product['special'] && $theme_options->get( 'display_text_sale' ) != '0') { ?>
  					<?php $text_sale = 'Sale';
  					if($theme_options->get( 'sale_text', $config->get( 'config_language_id' ) ) != '') {
  						$text_sale = $theme_options->get( 'sale_text', $config->get( 'config_language_id' ) );
  					} ?>
  					<?php if($theme_options->get( 'type_sale' ) == '1') { ?>
  					<?php $product_detail = $theme_options->getDataProduct( $product['product_id'] );
  					$roznica_ceny = $product_detail['price']-$product_detail['special'];
  					$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
  					<div class="sale">-<?php echo round($procent); ?>%</div>
  					<?php } else { ?>
  					<div class="sale"><?php echo $text_sale; ?></div>
  					<?php } ?>
  				<?php } elseif($theme_options->get( 'display_text_new' ) != '0' && $theme_options->isLatestProduct( $product['product_id'] )) { ?>
  					 <div class="new"><?php if($theme_options->get( 'new_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'new_text', $config->get( 'config_language_id' ) ); } else { echo 'New'; } ?></div>
  				<?php } ?>
  				
  				<?php if($product['thumb']) { ?>
  					<?php if($theme_options->get( 'lazy_loading_images' ) != '0') { ?>
  					<a href="<?php echo $product['href']; ?>"><img src="image/catalog/blank.gif" data-echo="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
  					<?php } else { ?>
  					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
  					<?php } ?>
  				<?php } else { ?>
  				<a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } ?>
  				
  				<?php if($theme_options->get( 'display_specials_countdown' ) == '1' && $product['special']) { $countdown = rand(0, 5000)*rand(0, 5000); 
  				          $product_detail = $theme_options->getDataProduct( $product['product_id'] );
  				          $date_end = $product_detail['date_end'];
  				          if($date_end != '0000-00-00' && $date_end) { ?>
  				     		<script>
  				     		$(function () {
  				     			var austDay = new Date();
  				     			austDay = new Date(<?php echo date("Y", strtotime($date_end)); ?>, <?php echo date("m", strtotime($date_end)); ?> - 1, <?php echo date("d", strtotime($date_end)); ?>);
  				     			$('#countdown<?php echo $countdown; ?>').countdown({until: austDay});
  				     		});
  				     		</script>
  				     		<div id="countdown<?php echo $countdown; ?>" class="clearfix"></div>
  					     <?php } ?>
  				<?php } ?>
  			</div>
  			
  			<div class="name-actions col-sm-4">
  			     <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
  			     <?php if($theme_options->get( 'product_list_type' ) == '4') { ?>
  			     <?php $product_detail = $theme_options->getDataProduct( $product['product_id'] ); ?>
  			     <div class="brand"><?php echo $product_detail['manufacturer']; ?></div>
  			     <?php } ?>
  			     
  			     <?php if($product['price']) { ?>
  				<div class="price">
  					<?php if (!$product['special']) { ?>
  					<?php echo $product['price']; ?>
  					<?php } else { ?>
  					<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
  					<?php } ?>
  				</div>
  				<?php } ?>
  				
  				<ul>
  				     <?php if($theme_options->get( 'display_add_to_cart' ) != '0') { ?>
  				          <?php $enquiry = false; if($config->get( 'product_blocks_module' ) != '') { $enquiry = $theme_options->productIsEnquiry($product['product_id']); }
  				          if(is_array($enquiry)) { ?>
  				          <li><a href="javascript:openPopup('<?php echo $enquiry['popup_module']; ?>', '<?php echo $product['product_id']; ?>')" data-toggle="tooltip" data-original-title="<?php echo $enquiry['block_name']; ?>"><i class="fa fa-question"></i></a></li>
  				          <?php } else { ?>
  				          <li><a onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" data-original-title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a></li>
  				          <?php } ?>
  				     <?php } ?>
  				     
  				     <?php if($theme_options->get( 'quick_view' ) == 1) { ?>
  				     <li class="quickview"><a href="index.php?route=product/quickview&amp;product_id=<?php echo $product['product_id']; ?>" data-toggle="tooltip" data-original-title="<?php if($theme_options->get( 'quickview_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'quickview_text', $config->get( 'config_language_id' ) )); } else { echo 'Quickview'; } ?>"><i class="fa fa-search"></i></a></li>
  				     <?php } ?>
  				
  					<?php if($theme_options->get( 'display_add_to_compare' ) != '0') { ?>
  					<li><a onclick="compare.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" data-original-title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?>"><i class="fa fa-exchange"></i></a></li>
  					<?php } ?>
  					
  					<?php if($theme_options->get( 'display_add_to_wishlist' ) != '0') { ?>
  					<li><a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" data-original-title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?>"><i class="fa fa-heart"></i></a></li>
  					<?php } ?>
  				</ul>
  			</div>
  			
  			<div class="desc col-sm-5">
  				<div class="description"><?php echo $product['description']; ?></div>
  			</div>
  		</div>
  	</div>
  	<?php } ?>
  </div>
  
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="product-grid"<?php if($theme_options->get('default_list_grid') == '1') { echo ' class="active"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
		  	    <?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/new_elements/product.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
  
  <div class="row pagination-results">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
  </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <p style="padding-top: 30px"><?php echo $text_empty; ?></p>
  <div class="buttons">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
<script type="text/javascript"><!--
function display(view) {

	if (view == 'list') {
		$('.product-grid').removeClass("active");
		$('.product-list').addClass("active");

		$('.display').html('<button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th-large"></i></button> <button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button>');
		
		localStorage.setItem('display', 'list');
	} else {
	
		$('.product-grid').addClass("active");
		$('.product-list').removeClass("active");
					
		$('.display').html('<button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th-large"></i></button> <button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button>');
		
		localStorage.setItem('display', 'grid');
	}
}

if (localStorage.getItem('display') == 'list') {
	display('list');
} else if (localStorage.getItem('display') == 'grid') {
	display('grid');
} else {
	display('<?php if($theme_options->get('default_list_grid') == '1') { echo 'grid'; } else { echo 'list'; } ?>');
}
//--></script> 
</div>
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/new_elements/wrapper_bottom.tpl'); ?>

            <?php if($countdowntimer_category){ ?>
			<script>
			function countdown(product_date, product_id){
				<?php if($countdowntimer_category_texttimer){ ?>
				var names = {days:      JSON.parse(JSON.stringify(<?php echo $text_countdown_days; ?>)),
                 			hours:     JSON.parse(JSON.stringify(<?php echo $text_countdown_hours; ?>)),
                			minutes:   JSON.parse(JSON.stringify(<?php echo $text_countdown_minutes; ?>)),
                 			seconds:   JSON.parse(JSON.stringify(<?php echo $text_countdown_seconds; ?>)),
				};

			    var day_name = names['days'][3];
			    var hur_name = names['hours'][3];
			    var min_name = names['minutes'][3];
			    var sec_name = names['seconds'][3];
			    <?php }else{ ?>
				    var day_name = ":";
				    var hur_name = ":";
				    var min_name = ":";
				    var sec_name = "";
			    <?php } ?>


				var today = new Date();

				var BigDay = new Date(product_date);
				var timeLeft = (BigDay.getTime() - today.getTime());

				var e_daysLeft = timeLeft / 86400000;
				<?php if($countdowntimer_category_days || $countdowntimer_category_countdays){ ?>
				var daysLeft = Math.floor(e_daysLeft);
				    <?php if($countdowntimer_category_texttimer){ ?>
					    <?php if($config_language == "en"){ ?>
					    if(parseInt(daysLeft) == 1){
					        day_name = names['days'][1];
					    }else{
					        day_name = names['days'][2];
					    }
					    <?php }else{ ?>
					    var slice_day = String(daysLeft).slice(-1);
					    if(parseInt(slice_day) == 1 && (parseInt(daysLeft) < 10 || parseInt(daysLeft) > 20)){
					        day_name = names['days'][1];
					    }else if((parseInt(slice_day) == 2 || parseInt(slice_day) == 3 || parseInt(slice_day) == 4) && (parseInt(daysLeft) < 10 || parseInt(daysLeft) > 20)){
					        day_name = names['days'][2];
					    }else{
					        day_name = names['days'][3];
					    }
					    <?php } ?>
				    <?php } ?>
				<?php }else{ ?>
				var daysLeft = 0;
				<?php } ?>

				var e_hrsLeft = (e_daysLeft - daysLeft)*24;
				var hrsLeft = Math.floor(e_hrsLeft);
				if(hrsLeft < 10){
					hrsLeft = '0'+hrsLeft;
				}
					<?php if($countdowntimer_category_texttimer){ ?>
						<?php if($config_language == "en"){ ?>
					    if(parseInt(hrsLeft) == 1){
					        hur_name = names['hours'][1];
					    }else{
					        hur_name = names['hours'][2];
					    }
					    <?php }else{ ?>
					    var slice_hours = String(hrsLeft).slice(-1);
					    if(parseInt(slice_hours) == 1 && (parseInt(hrsLeft) < 10 || parseInt(hrsLeft) > 20)){
					        hur_name = names['hours'][1];
					    }else if((parseInt(slice_hours) == 2 || parseInt(slice_hours) == 3 || parseInt(slice_hours) == 4)  && (parseInt(hrsLeft) < 10 || parseInt(hrsLeft) > 20)){
					        hur_name = names['hours'][2];
					    }else{
					        hur_name = names['hours'][3];
					    }
					    <?php } ?>
				    <?php } ?>

				var e_minsLeft = (e_hrsLeft - hrsLeft)*60;
				var minsLeft = Math.floor(e_minsLeft);
				if(minsLeft < 10){
					minsLeft = '0'+minsLeft;
				}
					<?php if($countdowntimer_category_texttimer){ ?>
						<?php if($config_language == "en"){ ?>
					    if(parseInt(minsLeft) == 1){
					        min_name = names['minutes'][1];
					    }else{
					        min_name = names['minutes'][2];
					    }
					    <?php }else{ ?>
					    var slice_min = String(minsLeft).slice(-1);
					    if(parseInt(slice_min) == 1 && (parseInt(minsLeft) < 10 || parseInt(minsLeft) > 20)){
					        min_name = names['minutes'][1];
					    }else if((parseInt(slice_min) == 2 || parseInt(slice_min) == 3 || parseInt(slice_min) == 4) && (parseInt(minsLeft) < 10 || parseInt(minsLeft) > 20)){
					        min_name = names['minutes'][2];
					    }else{
					        min_name = names['minutes'][3];
					    }
					    <?php } ?>
				    <?php } ?>

				var seksLeft = Math.floor((e_minsLeft - minsLeft)*60);
				if(seksLeft < 10){
					seksLeft = '0'+seksLeft;
				}
					<?php if($countdowntimer_category_texttimer){ ?>
						<?php if($config_language == "en"){ ?>
					    if(parseInt(seksLeft) == 1){
					        sec_name = names['seconds'][1];
					    }else{
					        sec_name = names['seconds'][2];
					    }
					    <?php }else{ ?>
					    var slice_sec = String(seksLeft).slice(-1);
					    if(parseInt(slice_sec) == 1 && (parseInt(seksLeft) < 10 || parseInt(seksLeft) > 20)){
					        sec_name = names['seconds'][1];
					    }else if((parseInt(slice_sec) == 2 || parseInt(slice_sec) == 3 || parseInt(slice_sec) == 4) && (parseInt(seksLeft) < 10 || parseInt(seksLeft) > 20)){
					        sec_name = names['seconds'][2];
					    }else{
					        sec_name = names['seconds'][3];
					    }
					    <?php } ?>
				    <?php } ?>
				    <?php if(!$countdowntimer_category_seconds && !$countdowntimer_category_texttimer){ ?>
					    min_name = '';
				    <?php } ?>

				if (BigDay.getTime() > today.getTime() ){
					document.getElementById("countdown"+product_id).innerHTML = <?php if($countdowntimer_category_days){ ?>daysLeft+day_name+<?php } ?>hrsLeft+hur_name+minsLeft+min_name<?php if($countdowntimer_category_seconds){ ?>+seksLeft+sec_name<?php } ?>;
				}
			}
			</script>
			<?php } ?>
            
<?php echo $footer; ?>