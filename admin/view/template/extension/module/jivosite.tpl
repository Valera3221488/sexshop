<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pp-layout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pp-layout" class="form-horizontal">
          <?php if ($error_jiverror) { ?>
              <div class="text-danger"><?php echo $error_jiverror; ?></div>
          <?php } ?>
          <input type="hidden" name="jivosite_partnerId" value="store.pe-art.ru" />
          <input type="hidden" name="jivosite_partnerPassword" value="" />
          <input type="hidden" name="jivosite_siteUrl" value="<?php echo $entry_siteUrl; ?>" />
          <input type="hidden" name="jivosite_userDisplayName" value="<?php echo $entry_userDisplayName; ?>" />
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="entry-email"><span data-toggle="tooltip" title="<?php echo $entry_helpm; ?>"><?php echo $entry_email; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="jivosite_email" value="<?php echo $jivosite_email; ?>" placeholder="<?php echo $entry_email; ?>" id="entry-email" class="form-control"/>
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="entry-userPassword"><span data-toggle="tooltip" title="<?php echo $entry_helpp; ?>"><?php echo $entry_userPassword; ?></span></label>
            <div class="col-sm-10">
              <input type="password" name="jivosite_userPassword" value="<?php echo $jivosite_userPassword; ?>" placeholder="<?php echo $entry_userPassword; ?>" id="entry-userPassword" class="form-control"/>
              <?php if ($error_userPassword) { ?>
              <div class="text-danger"><?php echo $error_userPassword; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="jivosite_status" id="input-status" class="form-control">
                <?php if ($jivosite_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
        <div class="pull-left"><?php echo $entry_donate; ?></div>
        <div class="pull-right"><?php echo $entry_cop; ?></div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>