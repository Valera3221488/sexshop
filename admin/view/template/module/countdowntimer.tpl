<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-product-settings" data-toggle="tab"><?php echo $tab_product_settings; ?></a></li>
            <li><a href="#tab-category-settings" data-toggle="tab"><?php echo $tab_category_settings; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><?php echo $tab_help; ?></a></li>
          </ul>
	      <div class="tab-content">
		  <div class="tab-pane active" id="tab-product-settings">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_show_in_product; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_product">
					<?php if ($countdowntimer_product) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $entry_text_timer_help; ?>"><?php echo $entry_text_timer; ?></span></label>
				<div class="col-sm-10">
					<select name="countdowntimer_product_texttimer">
					<?php if ($countdowntimer_product_texttimer) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_days_timer; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_product_days">
					<?php if ($countdowntimer_product_days) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $entry_countdays_timer_help; ?>"><?php echo $entry_countdays_timer; ?></span></label>
				<div class="col-sm-10">
					<select name="countdowntimer_product_countdays">
					<?php if ($countdowntimer_product_countdays) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_sec_timer; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_product_seconds">
					<?php if ($countdowntimer_product_seconds) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
	  </div>

	  <div class="tab-pane" id="tab-category-settings">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_show_in_category; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_category">
					<?php if ($countdowntimer_category) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $entry_text_timer_help; ?>"><?php echo $entry_text_timer; ?></span></label>
				<div class="col-sm-10">
					<select name="countdowntimer_category_texttimer">
					<?php if ($countdowntimer_category_texttimer) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_days_timer; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_category_days">
					<?php if ($countdowntimer_category_days) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $entry_countdays_timer_help; ?>"><?php echo $entry_countdays_timer; ?></span></label>
				<div class="col-sm-10">
					<select name="countdowntimer_category_countdays">
					<?php if ($countdowntimer_category_countdays) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_sec_timer; ?></label>
				<div class="col-sm-10">
					<select name="countdowntimer_category_seconds">
					<?php if ($countdowntimer_category_seconds) { ?>
						<option value="1" selected="selected"
						><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"
						><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select>
				</div>
			</div>
	  </div>

	  <div class="tab-pane" id="tab-help">
		<? echo $text_description; ?>
	  </div>
		</div>
		</form>
	  <div style="margin-top:25px;border-top:1px dashed #ccc;padding-top:15px;text-align:center;"><? echo $text_help; ?></div>
    </div>
  </div>
</div>

</div>
<?php echo $footer; ?>