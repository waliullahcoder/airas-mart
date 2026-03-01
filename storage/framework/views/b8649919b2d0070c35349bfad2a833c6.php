<section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Exclusive Collection</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php $__currentLoopData = $menus['exclusive_collection']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="<?php echo e(route('category.index', [$menu->category_id, $menu->category_slug,$menu->name])); ?>">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="<?php echo e(asset($menu->image)); ?>" alt="" loading="lazy" decoding="async">
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="<?php echo e(route('category.index', [$menu->category_id, $menu->category_slug,$menu->name])); ?>"><?php echo e($menu->name); ?></a></h5>
                            <p><?php echo $menu->description; ?></p>
                        </div>
                    </div>
                    </a>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                
                
            </div>
        </div>
    </section><?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/exclusive_section.blade.php ENDPATH**/ ?>