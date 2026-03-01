<link href="<?php echo e(asset('backend/css/dataTables.bootstrap5.min.css')); ?>" rel="stylesheet" />
<link href="<?php echo e(asset('backend/css/dataTables.bootstrap5.min.css')); ?>" rel="stylesheet" />
<link href="<?php echo e(asset('backend/css/buttons.dataTables.min.css')); ?>" rel="stylesheet" />
<link href="<?php echo e(asset('backend/css/responsive.bootstrap5.min.css')); ?>" rel="stylesheet" />

<link rel="stylesheet" href="<?php echo e(asset('frontend/css/fonts.googleapis.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('backend/css/jquery.fancybox.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('backend/css/animate.min.css')); ?>">
<?php echo notifyCss(); ?>
<?php echo $__env->yieldPushContent('plugin'); ?>
<link rel="stylesheet" href="<?php echo e(asset('backend/css/plugin.css')); ?>">
<style>
    :root {
        --bs-primary: <?php echo e(@$admin_setting->primary_color ?? '#249d79'); ?>;
        --bs-secondary: <?php echo e(@$admin_setting->secondary_color ?? '#415FFF'); ?>;
    }
</style>
<link rel="stylesheet" href="<?php echo e(asset('frontend/css/custom.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('backend/css/style.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('backend/css/responsive.css')); ?>">
<?php echo $__env->yieldPushContent('css'); ?>
<?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/admin/partial/styles.blade.php ENDPATH**/ ?>