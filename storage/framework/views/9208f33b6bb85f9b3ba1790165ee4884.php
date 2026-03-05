<?php $__env->startSection('content'); ?>
    <div class="hero-section">
        <div class="container">
            <div class="swiper carousel" data-items="1" data-sm-items="1" data-xs-items="1" data-autoplay="true" data-dots="true"
                data-arrows="true" data-loop="true">
                <div class="swiper-wrapper">
                    <?php $__currentLoopData = $slides; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="swiper-slide">
                            <?php if($item->link): ?>
                                <a href="<?php echo e($item->link); ?>">
                                    <img class="w-100" src="<?php echo e(asset($item->image)); ?>"
                                        srcset="<?php echo e(asset($item->mobile_image)); ?> 768w, <?php echo e(asset($item->image)); ?> 1200w"
                                        sizes="(max-width: 768px) 100vw, 1200px" alt="Slide Image">
                                </a>
                            <?php else: ?>
                                <img class="w-100" src="<?php echo e(asset($item->image)); ?>"
                                    srcset="<?php echo e(asset($item->mobile_image)); ?> 768w, <?php echo e(asset($item->image)); ?> 1200w"
                                    sizes="(max-width: 768px) 100vw, 1200px" alt="Slide Image">
                            <?php endif; ?>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
                <?php if(count($slides) > 1): ?>
                    <!-- <div class="swiper-arrow-btn swiper-button-prev">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div>
                    <div class="swiper-arrow-btn swiper-button-next">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div> -->
                <?php endif; ?>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <!-- End Hero -->


    
    <!-- End Category Wise Products -->
<!-- <div class="featured-category-section py-4">
        <div class="container">
            <div class="position-relative">
                <div class="swiper carousel" id="category-swiper" data-items="2" data-xl-items="6" data-lg-items="5"
                    data-md-items="4" data-sm-items="3" data-xs-items="3" data-margin="10" data-dots="false"
                    data-arrows="true">
                    <div class="swiper-wrapper">
                        <?php $__currentLoopData = $get_sub_categories_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="swiper-slide">
                            <a href="<?php echo e(route('category.singleCategoryPage', $item->id)); ?>" class="featured-category">
                                <div class="featured-category-img">
                                    <img src="<?php echo e(asset($item->image)); ?>" height="40" alt="">
                                </div>
                                <div class="featured-category-text"><?php echo e($item->name); ?></div>
                            </a>
                        </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                       
                    </div>
                </div>
                <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            </div>
        </div>
    </div> -->
    
    <!-- End Category Wise Products -->

    <!-- End Banner -->

   
 
<?php $__currentLoopData = $get_sub_category_trends_new_book_product_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
 <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> <?php echo e($subCategory->name); ?></h3>
                    <a href="<?php echo e(route('category.singleCategoryPage', $subCategory->id)); ?>" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             <?php if($subCategory->products->count() > 0): ?>
                               <?php $__currentLoopData = $subCategory->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount"><?php echo e(number_format($product->discount)); ?></span>
                                            </div>
                                            
                                           <a href="<?php echo e(route('product.details', $product->id)); ?>">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="<?php echo e(asset($product->thumbnail)); ?>"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        <?php echo e($product->name); ?>

                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                        <?php echo e($product->code); ?>

                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> <?php echo $product->short_description; ?>

                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 <?php echo e(number_format($product->regular_price)); ?> <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> <?php echo e(number_format($product->sale_price ?? $product->regular_price)); ?><span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="<?php echo e($product->id); ?>">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php else: ?>
                            <p class="text-muted">No products found</p>
                             <?php endif; ?>
                        </div>
                        
                       <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    <!--  End ট্রেন্ডিং বইসমূহ and নতুন প্রকাশিত বই -->

    <!-- Banner Category -->
    <div class="pb-4">
        <div class="container">
            <div class="row g-3">
                <?php $__currentLoopData = $get_sub_category_banner_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-sm-4">
                    <a href="<?php echo e(route('category.singleCategoryPage', $subCategory->id)); ?>"><img src="<?php echo e(asset($subCategory->image)); ?>" alt=""></a>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <!-- End Banner Category -->

    <!-- সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা -->
    <!-- <?php $__currentLoopData = $get_sub_category_sian_jugpuerti_nrobiul_aual_product_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
 <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> <?php echo e($subCategory->name); ?></h3>
                    <a href="<?php echo e(route('category.singleCategoryPage', $subCategory->id)); ?>" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             <?php if($subCategory->products->count() > 0): ?>
                               <?php $__currentLoopData = $subCategory->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount"><?php echo e(number_format($product->discount)); ?></span>
                                            </div>
                                            
                                           <a href="<?php echo e(route('product.details', $product->id)); ?>">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="<?php echo e(asset($product->thumbnail)); ?>"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        <?php echo e($product->name); ?>

                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                        <?php echo e($product->code); ?>

                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> <?php echo $product->short_description; ?>

                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 <?php echo e(number_format($product->regular_price)); ?> <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> <?php echo e(number_format($product->sale_price ?? $product->regular_price)); ?><span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="<?php echo e($product->id); ?>">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php else: ?>
                            <p class="text-muted">No products found</p>
                             <?php endif; ?>
                        </div>
                        
                       <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> -->
    <!-- End সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা -->


<!-- <div class="author-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">জনপ্রিয় লেখক</h3>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="4" data-xs-items="3" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                            <?php $__currentLoopData = $get_sub_category_writer_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <a href="<?php echo e(route('category.singleCategoryPage', $item->id)); ?>" class="author-card">
                                    <img src="<?php echo e(asset($item->image)); ?>">
                                    <p class="author-card-text"><?php echo e($item->name); ?></p>
                                </a>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                           
                        </div>
                    </div>
                     <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                </div>
            </div>
        </div>
    </div> -->
    

    
    <?php $__currentLoopData = $get_sub_category_atar_sugondhi_product_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
 <!-- <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> <?php echo e($subCategory->name); ?></h3>
                    <a href="<?php echo e(route('category.singleCategoryPage', $subCategory->id)); ?>" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             <?php if($subCategory->products->count() > 0): ?>
                               <?php $__currentLoopData = $subCategory->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount"><?php echo e(number_format($product->discount)); ?></span>
                                            </div>
                                            
                                           <a href="<?php echo e(route('product.details', $product->id)); ?>">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="<?php echo e(asset($product->thumbnail)); ?>"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        <?php echo e($product->name); ?>

                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                       <?php echo e($product->code); ?>

                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> <?php echo $product->short_description; ?>

                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 <?php echo e(number_format($product->regular_price)); ?> <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> <?php echo e(number_format($product->sale_price ?? $product->regular_price)); ?><span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="<?php echo e($product->id); ?>">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php else: ?>
                            <p class="text-muted">No products found</p>
                             <?php endif; ?>
                        </div>
                        
                       <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> -->
    


    
     <div class="category-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">অন্যান্য পণ্য</h3>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="3" data-xs-items="2" data-margin="20" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                            <?php $__currentLoopData = $get_sub_category_others_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <a href="<?php echo e(route('category.singleCategoryPage', $item->id)); ?>" class="category-card2">
                                    <div class="category-card2-image ratio"
                                        style="--bs-aspect-ratio: 100%; width: 80px;">
                                        <img class="object-fit-contain" src="<?php echo e(asset($item->image)); ?>" alt="">
                                    </div>
                                    <div class="category-card2-text"><?php echo e($item->name); ?></div>
                                </a>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                           
                        </div>
                    </div>
                    <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                </div>
            </div>
        </div>
    </div>
    

    
    <!-- <div class="brand-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">ব্র্যান্ডসমূহ</h3>
                </div>
                <div class="position-relative mb-3">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="3" data-xs-items="2" data-margin="20" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                     <?php $__currentLoopData = $get_sub_category_brand_only; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="swiper-slide">
                                <a href="<?php echo e(route('category.singleCategoryPage', $item->id)); ?>" class="brand-card">
                                    <div class="brand-card-image ratio" style="--bs-aspect-ratio: 100%;">
                                        <img class="object-fit-contain" src="<?php echo e(asset($item->image)); ?>" alt="">
                                    </div>
                                    <div class="brand-card-text"><?php echo e($item->name); ?></div>
                                </a>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            
                        </div>
                        <?php echo $__env->make('layouts.frontend.partial.svgbutton', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
   
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.frontend.app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\airas-mart\resources\views/frontend/home.blade.php ENDPATH**/ ?>