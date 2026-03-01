

<?php $__env->startSection('content'); ?>
       <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <?php $__currentLoopData = $latests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                               
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <?php $__currentLoopData = $latests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
                                
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <?php $__currentLoopData = $toprated; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                    <?php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     ?>
                                        (<?php echo e($avgRating > 0 ? $avgRating : '0.0'); ?> / 5
                                        · <?php echo e($reviewCount); ?> <?php echo e($reviewCount == 1 ? 'review' : 'reviews'); ?>)
                                    </span>
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <?php $__currentLoopData = $toprated; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                            <?php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     ?>
                                        (<?php echo e($avgRating > 0 ? $avgRating : '0.0'); ?> / 5
                                        · <?php echo e($reviewCount); ?> <?php echo e($reviewCount == 1 ? 'review' : 'reviews'); ?>)
                                    </span>
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                               <?php $__currentLoopData = $reviewedproducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                        
                                   

                                    <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                        <?php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     ?>
                                        (<?php echo e($avgRating > 0 ? $avgRating : '0.0'); ?> / 5
                                        · <?php echo e($reviewCount); ?> <?php echo e($reviewCount == 1 ? 'review' : 'reviews'); ?>)
                                    </span>
                                
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                            <div class="latest-prdouct__slider__item">
                               <?php $__currentLoopData = $reviewedproducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('product.details', $product->id)); ?>" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img class="product-img" src="<?php echo e(asset($product->thumbnail)); ?>" alt="" loading="lazy" decoding="async">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><?php echo e($product->name); ?></h6>
                                        <span>৳<?php echo e(number_format($product->sale_price)); ?></span>
                                        <span class="text-muted" style="color:#ff8707;font-size:11px;">
                                            <?php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                     ?>
                                        (<?php echo e($avgRating > 0 ? $avgRating : '0.0'); ?> / 5
                                        · <?php echo e($reviewCount); ?> <?php echo e($reviewCount == 1 ? 'review' : 'reviews'); ?>)
                                    </span>
                                    </div>
                                </a>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.frontend.appHome', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\airas-mart\resources\views/frontend/home.blade.php ENDPATH**/ ?>