<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $nastr; ?>" data-toggle="tooltip" title="<?php echo $button_nastr; ?>" class="btn btn-primary"><?php echo $button_nastr; ?></a></div>
        <?php if ($logintrue === true) { ?>
        <div class="pull-right">
        <form method="POST" name="form-new" action="https://admin.jivosite.com/integration/login" target="_blank">
          <input type="hidden" name="partnerId" value="store.pe-art.ru">
          <input type="hidden" name="lang" value="<?php echo $jivlang; ?>">
          <input type="hidden" name="token" value="<?php echo $jtoken; ?>">
          <input type="submit" class="btn btn-primary" value="<?php echo $button_newwind; ?>" title="<?php echo $button_newwind2; ?>">&nbsp
        </form>
        </div>
        <?php } ?>
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        
          <?php if ($error_jiverror) { ?>
              <div class="text-danger"><?php echo $error_jiverror; ?></div>
          <?php } ?>
           <div class="center-block text-center">
          <?php if ($logintrue === true) { ?>
          <iframe name="my_frame" width="100%" height="1000"></iframe>
    <form method="POST" name="form" action="https://admin.jivosite.com/integration/login" target="my_frame">
      <input type="hidden" name="partnerId" value="store.pe-art.ru">
      <input type="hidden" name="lang" value="<?php echo $jivlang; ?>">
      <input type="hidden" name="token" value="<?php echo $jtoken; ?>">
    </form>
<script>
document.form.submit();
</script>
        <?php } else { ?>
        <br/>
          <a href="<?php echo $nastr; ?>" data-toggle="tooltip" title="<?php echo $button_setup; ?>" class="btn btn-primary"><?php echo $button_setup; ?></a>
        <br/><br/><br/>
        <?php } ?>
          </div>
        <div class="pull-left"><?php echo $entry_donate; ?></div>
        <div class="pull-right"><?php echo $entry_cop; ?></div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>