

<?php $__env->startPush('plugin'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('backend/css/jquery.minicolors.css')); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <form action="<?php echo e(Route('admin.admin-settings.update', '0')); ?>" method="POST" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <?php echo method_field('PUT'); ?>
        <div class="row g-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex flex-row align-items-center justify-content-between pe-2 py-2">
                        <h6 class="h6 mb-0 py-5px">Admin Settings</h6>
                        <button type="submit" class="btn btn-sm btn-primary">Update</button>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-4 col-6">
                                <label for="title" class="form-label"><b>Title</b></label>
                                <input type="text" id="title" name="title" placeholder="Ttitle"
                                    class="form-control" value="<?php echo e(@$data->title); ?>" required>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="primary_color" class="form-label"><b>Primary Color</b></label>
                                <input type="text" id="primary_color" name="primary_color" placeholder="Primary Color"
                                    class="form-control color" value="<?php echo e(@$data->primary_color); ?>">
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="secondary_color" class="form-label"><b>Secondary Color</b></label>
                                <input type="text" id="secondary_color" name="secondary_color"
                                    placeholder="Secondary Color" class="form-control color"
                                    value="<?php echo e(@$data->secondary_color); ?>">
                            </div>
                            <div class="col-md-4 col-6">
                                <label for="logo" class="form-label"><b>Logo</b></label>
                                <input type="file" id="logo" name="logo" class="form-control" accept="image/*"
                                    <?php echo e(file_exists(@$data->logo) ? '' : 'required'); ?>>
                                <?php if(file_exists(@$data->logo)): ?>
                                    <div class="pt-2">
                                        <img src="<?php echo e(asset($data->logo)); ?>" height="30" alt="Logo">
                                    </div>
                                <?php endif; ?>
                            </div>
                            <div class="col-md-4 col-6">
                                <label for="small_logo" class="form-label"><b>Small Logo</b></label>
                                <input type="file" id="small_logo" name="small_logo" class="form-control"
                                    accept="image/*" <?php echo e(file_exists(@$data->small_logo) ? '' : 'required'); ?>>
                                <?php if(file_exists(@$data->small_logo)): ?>
                                    <div class="pt-2">
                                        <img src="<?php echo e(asset($data->small_logo)); ?>" height="30" alt="Small Logo">
                                    </div>
                                <?php endif; ?>
                            </div>
                            <div class="col-md-4 col-6">
                                <label for="favicon" class="form-label"><b>Favicon</b></label>
                                <input type="file" id="favicon" name="favicon" class="form-control" accept="image/*"
                                    <?php echo e(file_exists(@$data->favicon) ? '' : 'required'); ?>>
                                <?php if(file_exists(@$data->favicon)): ?>
                                    <div class="pt-2">
                                        <img src="<?php echo e(asset($data->favicon)); ?>" height="30" alt="Favicon">
                                    </div>
                                <?php endif; ?>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <label for="facebook" class="form-label"><b>Facebook</b></label>
                                <input type="text" id="facebook" name="facebook" placeholder="Facebook"
                                    class="form-control" value="<?php echo e(@$data->facebook); ?>">
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <label for="twitter" class="form-label"><b>Twitter</b></label>
                                <input type="text" id="twitter" name="twitter" placeholder="Twitter"
                                    class="form-control" value="<?php echo e(@$data->twitter); ?>">
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <label for="linkedin" class="form-label"><b>Linkedin</b></label>
                                <input type="text" id="linkedin" name="linkedin" placeholder="Linkedin"
                                    class="form-control" value="<?php echo e(@$data->linkedin); ?>">
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <label for="whatsapp" class="form-label"><b>Whatsapp</b></label>
                                <input type="text" id="whatsapp" name="whatsapp" placeholder="Whatsapp"
                                    class="form-control" value="<?php echo e(@$data->whatsapp); ?>">
                            </div>
                            <div class="col-12">
                                <label for="footer_text" class="form-label"><b>Footer Text</b></label>
                                <input type="text" id="footer_text" name="footer_text" placeholder="Footer Text"
                                    class="form-control" value="<?php echo e(@$data->footer_text); ?>" required>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer pe-2 py-2 text-end">
                        <button type="submit" class="btn btn-sm btn-primary">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('js'); ?>
    <script type="text/javascript" src="<?php echo e(asset('backend/js/jquery.minicolors.min.js')); ?>"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            if ($('.color').length) {
                $(".color").each(function() {
                    $(this).minicolors();
                });
            }
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\airas-mart\resources\views/admin/admin-setting/edit.blade.php ENDPATH**/ ?>