<section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 featured__controls">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <?php $__currentLoopData = $featuredProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat product-card">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg product-img" data-setbg="<?php echo e(asset($product->thumbnail)); ?>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="<?php echo e(route('product.details', $product->id)); ?>"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart  add-to-cart" data-variant_id="<?php echo e($product->variants[0]->id ?? null); ?>" data-id="<?php echo e($product->id); ?>"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="<?php echo e(route('product.details', $product->id)); ?>"><?php echo e($product->name); ?> (CODE-<?php echo e($product->id); ?>)</a></h6>
                            <h5><del>৳<?php echo e(number_format($product->sale_price)); ?></del> ৳<?php echo e(number_format($product->sale_price)); ?></h5>
                            <button class="btn btn-sm btn-danger add-to-cart"
                            data-variant_id="<?php echo e($product->variants[0]->id ?? null); ?>"
                                                            data-id="<?php echo e($product->id); ?>">🛒 Add to Cart ➕
                                                        </button>
                        </div>
                    </div>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
               
            </div>
        </div>
    </section><?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/features_section.blade.php ENDPATH**/ ?>