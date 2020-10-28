<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-paynet-api" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-paynet-api" class="form-horizontal">

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-paynet-code"><?php echo $entry_paynet_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_code" value="<?php echo $paynet_code; ?>" placeholder="<?php echo $entry_paynet_code; ?>" id="input-paynet-code" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-paynet-user"><?php echo $entry_paynet_user; ?></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_user" value="<?php echo $paynet_user; ?>" placeholder="<?php echo $entry_paynet_user; ?>" id="input-paynet-user" class="form-control" />
              <?php if ($error_user) { ?>
              <div class="text-danger"><?php echo $error_user; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-paynet-user-pass"><?php echo $entry_paynet_user_pass; ?></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_user_pass" value="<?php echo $paynet_user_pass; ?>" placeholder="<?php echo $entry_paynet_user_pass; ?>" id="input-paynet-user-pass" class="form-control" />
              <?php if ($error_user_pass) { ?>
              <div class="text-danger"><?php echo $error_user_pass; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-paynet-sec-key"><?php echo $entry_paynet_sec_key; ?></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_sec_key" value="<?php echo $paynet_sec_key; ?>" placeholder="<?php echo $entry_paynet_sec_key; ?>" id="input-paynet-sec-key" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-mode"><?php echo $entry_paynet_mode; ?></label>
            <div class="col-sm-10">
              <select name="paynet_mode" id="input-mode" class="form-control">
                <?php if ($paynet_method == 'true') { ?>
                <option value="true" selected="selected"><?php echo $text_true; ?></option>
                <?php } else { ?>
                <option value="true"><?php echo $text_true; ?></option>
                <?php } ?>
                <?php if ($paynet_method == 'false') { ?>
                <option value="false" selected="selected"><?php echo $text_false; ?></option>
                <?php } else { ?>
                <option value="false"><?php echo $text_false; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_total" value="<?php echo $paynet_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-10">
              <select name="paynet_order_status_id" id="input-order-status" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $paynet_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="paynet_geo_zone_id" id="input-geo-zone" class="form-control">
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $paynet_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="paynet_status" id="input-status" class="form-control">
                <?php if ($paynet_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="paynet_sort_order" value="<?php echo $paynet_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
