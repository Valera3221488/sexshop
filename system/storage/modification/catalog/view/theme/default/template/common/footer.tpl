<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

 
        <?php if (isset($jivosite_status)) { ?>
          <!-- BEGIN JIVOSITE CODE {literal} -->
          <script type='text/javascript'>
          (function(){ var widget_id = '<?php echo $jivosite_widget_id; ?>';var d=document;var w=window;function l(){
          var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();
          function jivo_onLoadCallback() {
          <?php if ($jlogged) { ?>
            //var date = new Date(0);document.cookie = "jv_client_name_<?php echo $jivosite_widget_id; ?>=; path=/; expires=" + date.toUTCString();
            jivo_api.setContactInfo({
                "name": "<?php echo $jname; ?>",
                "email": "<?php echo $jemail; ?>",
                "phone": "<?php echo $jtel; ?>",
                "description": "<?php echo $jdesc; ?>"
            }); 
          <?php } ?>
          }

          </script>
          <!-- {/literal} END JIVOSITE CODE -->
        <?php } ?>

      

    <script>
      function showForm(data){
        $.ajax({
          url: 'index.php?route=product/fastorder/getForm',
          type: 'post',
          data: {product_name: data['product_name'], price: data['price'] ,product_id: data['product_id'], product_link: data['product_link']},

          beforeSend: function() {
          },
          complete: function() {
          },
          success: function(result) {
            $('#fastorder-form-container'+data['product_id']).html(result);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
    };
    </script>
			
</body></html>