<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                     <div class="col-lg-8 col-md-8">
                        <div class="header__top__left">
                            <ul class="top-left-list">
                                <li class="email-item">
                                    <i class="fa fa-envelope"></i> <?php echo e($settings->primary_email); ?>

                                </li>
                                <li class="marquee-item">
                                    <div class="marquee">
                                        <span>
                                            🚚 <?php echo e($settings->google_map ?? 'Please Set Marquee Message'); ?>

                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="<?php echo e($settings->facebook_page ?? '#'); ?>" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="<?php echo e($settings->twitter ?? '#'); ?>" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="<?php echo e($settings->linkedin ?? '#'); ?>" target="_blank"><i class="fa fa-linkedin"></i></a>
                                <a href="<?php echo e($settings->pinterest ?? '#'); ?>" target="_blank"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="frontend/images/language.png" alt="" loading="lazy" decoding="async">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="<?php echo e(route('auth.signupPage')); ?>"><i class="fa fa-user"></i> Signup</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .sticky-header {
    width: 100%;
    transition: all 0.3s ease;
}

.sticky-active {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    background: #fff;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
}

            </style>
        <div class="sticky-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="<?php echo e(route('home')); ?>">
                        <img src="<?php echo e(asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo.png')); ?>" 
                             alt="">
                    </a>
                </div>
            </div>

            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="<?php echo e(route('home')); ?>">Home</a></li>

                        <?php $__currentLoopData = $menus['header_parent']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li>
                            <a href="<?php echo e(route('category.index', [$menu->category_id, $menu->category_slug,$menu->name])); ?>">
                                <?php echo e($menu->name); ?>

                                <?php if(isset($menus['header_child'][$menu->id]) && $menus['header_child'][$menu->id]->count() > 0): ?>
                                    <span class="arrow_carrot-down"></span>
                                <?php endif; ?>
                            </a>

                            <?php if(isset($menus['header_child'][$menu->id])): ?>
                                <?php $__currentLoopData = $menus['header_child'][$menu->id]->chunk(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <ul class="header__menu__dropdown">
                                        <?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li>
                                                <a href="<?php echo e(route('category.singleCategoryPage', $item->id)); ?>">
                                                    <?php echo e($item->name); ?>

                                                </a>
                                            </li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </ul>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        <?php $__currentLoopData = $menus['single_page']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li>
                            <a href="<?php echo e(route('singleDetails', $menu->category_id)); ?>">
                                <?php echo e($menu->name); ?>

                            </a>
                        </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        <li><a href="<?php echo e(route('contactPage')); ?>">Contact</a></li>
                    </ul>
                </nav>
            </div>

            <div class="col-lg-3">
                <div class="header__cart">
                        <ul>
                        <li>
                            <a href="<?php echo e(route('cart.index')); ?>" class="cart-icon">
                                <i class="fa fa-shopping-bag"></i> 
                                <span class="cart-count"><?php echo e(count(session('cart', []))); ?></span>
                            </a>
                        </li>
                    </ul>

                    <?php if(Auth::check()): ?>
                        <a class="header-link" href="<?php echo e(Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard')); ?>">
                            <strong><?php echo e(Auth::user()->name); ?></strong>
                        </a>
                    <?php else: ?>
                        <a class="header-link" href="<?php echo e(route('auth.signinPage')); ?>">
                            <i class="fa fa-user"></i>
                            <span class="d-sm-inline-block d-none">Sign in</span>
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</div>

    </header><?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/header.blade.php ENDPATH**/ ?>