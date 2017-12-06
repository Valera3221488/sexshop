<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div>
        <div class="col-md-4 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
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
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p><?php echo $product['description']; ?></p>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>

			<?php if ($product['special_end'] && $countdowntimer_category) { ?>
			<span class="countdown" id="countdownblock<?php echo $product['product_id']?>">
				<?php echo $text_countdown; ?> <div id="countdown<?php echo $product['product_id']?>"></div>
			</span>
            <script>
            setInterval(function(){ countdown("<?php echo $product['special_end'];  ?>", <?php echo $product['product_id']?>); }, 50);
            </script>
			<?php } ?>
            
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>

              <!-- Button fastorder -->
              <div class="button-gruop">
                <?php echo $product['fastorder']; ?>
              </div><!-- END :  button fastorder -->
            
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

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
