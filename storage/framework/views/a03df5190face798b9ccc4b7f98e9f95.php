 <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <?php $__currentLoopData = $menus['left_side']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="<?php echo e(asset($menu->image)); ?>">
                            <h5><a href="<?php echo e(route('category.index', [$menu->category_id, $menu->category_slug,$menu->name])); ?>"><?php echo e($menu->name); ?></a></h5>
                        </div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    
                </div>
            </div>
        </div>
    </section><?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/categories_section.blade.php ENDPATH**/ ?>