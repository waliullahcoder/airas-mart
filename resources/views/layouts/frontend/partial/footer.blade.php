<!-- Service strip -->
<div class="service-strip">
    <div class="container">
        <div class="row g-0">
            <div class="col-6 col-lg-3">
                <div class="service-item">
                    <span class="service-icon"><i class="fas fa-leaf"></i></span>
                    <div><strong>Better Products</strong><span class="service-text">Carefully selected quality</span></div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="service-item">
                    <span class="service-icon"><i class="fas fa-truck-fast"></i></span>
                    <div><strong>Home Delivery</strong><span class="service-text">Order online, get it at your door</span></div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="service-item">
                    <span class="service-icon"><i class="fas fa-shield-halved"></i></span>
                    <div><strong>Secure Payment</strong><span class="service-text">bKash, Nagad &amp; Cash on delivery</span></div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="service-item">
                    <span class="service-icon"><i class="fas fa-headset"></i></span>
                    <div><strong>Customer Support</strong><span class="service-text">We are here to help</span></div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer-section">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-12 col-12">
                <a href="{{ Route('home') }}" class="footer-logo-plate">
                    <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo/logo.jpg') }}"
                        alt="{{ $settings->app_name }}">
                </a>
                <p class="footer-about">{{ $settings->description }}</p>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Other Links</h5>
                <ul class="footer-list">
                
                    @foreach ($menus['footer_col1_menus'] as $menu)
                    <li class="footer-item"><a class="footer-link" href="{{ route('info.page', $menu->id) }}">{{ $menu->name }}</a></li>
                    @endforeach
                    
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Social Network Links</h5>
                <ul class="footer-list">
                    @foreach ($menus['footer_col2_menus'] as $menu)
                    <li class="footer-item"><a class="footer-link" target="_blank" href="{{$menu->menu_url}}">{{ $menu->name }}</a></li>
                    @endforeach
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-6">
                <h5 class="footer-title">Connect With Us</h5>
                <ul class="footer-contact">
                    <li class="footer-contact-item">
                        <i class="fa fa-map-marker-alt"></i>&nbsp;
                        {!! $settings->address !!}
                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-mobile-alt"></i>&nbsp;&nbsp;
                        <a href="tel:+88{{ $settings->primary_phone }}">{{ $settings->primary_phone }}</a>
                    </li>
                    <li class="footer-contact-item">
                        <i class="fa fa-envelope"></i>&nbsp;&nbsp;<span>{{ $settings->primary_email }}</span>
                    </li>
                    <li class="footer-contact-item">
                        @if ($settings->facebook_page)
                            <a class="social-link" target="_blank" href="{{ $settings->facebook_page }}" rel="noopener">
                                <i class="fab fa-facebook"></i> ফেইজবুক লিঙ্ক 
                            </a>
                        @endif
                    </li>
                    <li class="footer-contact-item">
                       @if ($settings->youtube)
                            <a class="social-link" target="_blank" href="{{ $settings->youtube }}" rel="noopener">
                                <i class="fab fa-youtube"></i> ইউটিউব লিঙ্ক
                            </a>
                        @endif
                    </li>
                    
                    <li class="footer-contact-item">
                        @if ($settings->instagram)
                            <a class="social-link" target="_blank" href="{{ $settings->instagram }}" rel="noopener">
                                <i class="fab fa-instagram"></i> ইনস্টাগ্রাম লিঙ্ক
                            </a>
                        @endif
                        </li>
                    <li class="footer-contact-item">
                        @if ($settings->twitter)
                            <a class="social-link" target="_blank" href="{{ $settings->twitter }}" rel="noopener">
                                <i class="fab fa-twitter"></i> টুইটার লিঙ্ক
                            </a>
                        @endif
                        </li>
                    <li class="footer-contact-item">
                        @if ($settings->linkedin)
                            <a class="social-link" target="_blank" href="{{ $settings->linkedin }}" rel="noopener">
                                <i class="fab fa-linkedin"></i> লিঙ্কড ইন লিঙ্ক
                            </a>
                        @endif
                        </li>
                    <li class="footer-contact-item">
                        @if ($settings->whatsapp)
                            <a class="social-link" target="_blank" href="{{ $settings->whatsapp }}" rel="noopener">
                                <i class="fab fa-whatsapp"></i> ওয়াটসাপ্র লিঙ্ক
                            </a>
                        @endif
                        </li>
                    <li class="footer-contact-item">
                        @if ($settings->pinterest)
                            <a class="social-link" target="_blank" href="{{ $settings->pinterest }}" rel="noopener">
                                <i class="fab fa-pinterest"></i> পিনটারেস্ট লিঙ্ক
                            </a>
                        @endif
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div class="footer-bottom py-3">
    <div class="container">
        <div class="copyright">Copyright © {{ date('Y') }} {{ $settings->app_name }}</div>
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
