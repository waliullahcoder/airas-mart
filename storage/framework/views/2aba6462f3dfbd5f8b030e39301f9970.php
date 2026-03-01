<section class="hero">
         <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <?php $__currentLoopData = $menus['left_side']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><a href="<?php echo e(route('category.index', [$menu->category_id, $menu->category_slug,$menu->name])); ?>"><?php echo e($menu->name); ?></a></li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Items Search
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5><?php echo e($settings->primary_phone ?? '+8801617-475475'); ?></h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg"
                        data-setbg="<?php echo e(asset(file_exists($settings->page_heading_bg) ? $settings->page_heading_bg : 'frontend/images/banner-1.png')); ?>">
                    </div>

                </div>
            </div>
        </div>
    </section><?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/left_menu_and_banner.blade.php ENDPATH**/ ?>