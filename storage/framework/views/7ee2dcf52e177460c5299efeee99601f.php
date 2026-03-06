<footer class="footer-section">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-4 col-6">
                <div class="pb-3">
                    <a href="<?php echo e(Route('home')); ?>">
                        <img src="<?php echo e(asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo/logo.jpg')); ?>"
                            height="50" alt="<?php echo e($settings->app_name); ?>">
                    </a>
                </div>
                <p><?php echo e($settings->description); ?></p>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Other Links</h5>
                <ul class="footer-list">
                    <?php $__currentLoopData = $menus['footer_col1_menus']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li class="footer-item"><a class="footer-link" href="<?php echo e($menu->menu_url); ?>"><?php echo e($menu->name); ?></a></li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Popular</h5>
                <ul class="footer-list">
                    <?php $__currentLoopData = $menus['footer_col2_menus']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li class="footer-item"><a class="footer-link" href="<?php echo e($menu->menu_url); ?>"><?php echo e($menu->name); ?></a></li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Connect With Us</h5>
                <ul class="footer-contact">
                    <li class="footer-contact-item">
                        <i class="fa fa-map-marker-alt"></i> Address: <br>
                        <?php echo $settings->address; ?>

                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-mobile-alt"></i>&nbsp;Phone:<br><a
                            href="tel:+88<?php echo e($settings->primary_phone); ?>"><?php echo e($settings->primary_phone); ?></a>
                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-envelope"></i>&nbsp;&nbsp;<span><?php echo e($settings->primary_email); ?></span>
                    </li>
                    <li class="footer-contact-item pt-2">
                        <?php if($settings->facebook_page): ?>
                            <a class="social-link" target="_blank" href="<?php echo e($settings->facebook_page); ?>" rel="noopener">
                                <i class="fab fa-facebook"></i>
                            </a>
                        <?php endif; ?>
                        <?php if($settings->youtube): ?>
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="<?php echo e($settings->youtube); ?>" rel="noopener">
                                <i class="fab fa-youtube"></i>
                            </a>
                        <?php endif; ?>
                        <?php if($settings->instagram): ?>
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="<?php echo e($settings->instagram); ?>" rel="noopener">
                                <i class="fab fa-instagram"></i>
                            </a>
                        <?php endif; ?>
                        <?php if($settings->twitter): ?>
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="<?php echo e($settings->twitter); ?>" rel="noopener">
                                <i class="fab fa-twitter"></i>
                            </a>
                        <?php endif; ?>
                        <?php if($settings->linkedin): ?>
                            &nbsp;&nbsp;
                            <a class="social-link" target="_blank" href="<?php echo e($settings->linkedin); ?>" rel="noopener">
                                <i class="fab fa-linkedin"></i>
                            </a>
                        <?php endif; ?>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div class="footer-bottom py-3">
    <div class="container">
        <div class="copyright">Copyright © <?php echo e(date('Y')); ?> <?php echo e($settings->app_name); ?></div>
    </div>
</div>
<!-- End Footer -->

<div class="scrollTop" style="display: none;">
    <svg width="28" height="28" stroke-width="4" aria-hidden="true">
        <path d="M24.5 4.66663H3.5V6.27079H24.5V4.66663Z" fill="currentColor"></path>
        <path
            d="M14 8.19898L5.84953 16.3495L6.98385 17.4838L13.1979 11.2697L13.1979 24.5H14.8021L14.8021 11.2697L21.0162 17.4838L22.1505 16.3495L14 8.19898Z"
            fill="currentColor"></path>
    </svg>
</div>
<?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/frontend/partial/footer.blade.php ENDPATH**/ ?>