<script type="text/javascript" src="<?php echo e(asset('backend/js/plugin.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/sweetalert2@11.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/jquery.dataTables.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/dataTables.buttons.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/jszip.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/pdfmake.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/vfs_fonts.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/buttons.html5.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/buttons.print.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/dataTables.bootstrap5.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/dataTables.responsive.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/responsive.bootstrap5.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/jquery.fancybox.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(asset('backend/js/script.js')); ?>"></script>
<?php if (isset($component)) { $__componentOriginal58ef761b4a8d895ed279bb45cfc348ea = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal58ef761b4a8d895ed279bb45cfc348ea = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'notify::components.notify','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('notify::notify'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal58ef761b4a8d895ed279bb45cfc348ea)): ?>
<?php $attributes = $__attributesOriginal58ef761b4a8d895ed279bb45cfc348ea; ?>
<?php unset($__attributesOriginal58ef761b4a8d895ed279bb45cfc348ea); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal58ef761b4a8d895ed279bb45cfc348ea)): ?>
<?php $component = $__componentOriginal58ef761b4a8d895ed279bb45cfc348ea; ?>
<?php unset($__componentOriginal58ef761b4a8d895ed279bb45cfc348ea); ?>
<?php endif; ?>
<?php echo notifyJs(); ?>
<?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/admin/partial/scripts.blade.php ENDPATH**/ ?>