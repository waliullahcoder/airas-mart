<!-- CSS -->
<style>
#search-results ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

#search-results li:hover {
    background-color: #f8f9fa;
}

#search-results img {
    border-radius: 4px;
}
</style>
<div class="header-middle">
        <div class="container">
            <div class="header-middle-wrapper">
                <div class="logo-area d-flex align-items-center">
                    <!-- MOBILE HEADER START -->
                    <div class="d-lg-none">
                       <button id="mobileMenuBtn" class="hamburger">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                        <!-- MOBILE HEADER END -->
                    </div>
                    <a href="{{ Route('home') }}">
                        <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo/logo.jpg') }}"
                            height="50" alt="{{ $settings->app_name }}">
                    </a>
                </div>

                <!-- Search Area -->
                <div class="search-area d-lg-block d-none position-relative">
                    <form action="#" method="GET" id="product-search-form">
                        <div class="search-wrapper">
                            <input type="search" class="search-input form-control" name="query"
                                placeholder="Type your product..." required id="product-search-input">
                           
                            <div id="search-results" class="bg-white border shadow-sm"
                         style="position:absolute; top:100%; left:0; right:0; display:none; z-index:2000; max-height:350px; overflow-y:auto; border-radius:5px;">
                    </div>
                        </div>
                    </form>
                </div>
                <!-- End Search Area Area -->


                <div class="action-area">
                    <div class="header-links">
                        <a href="{{ route('cart.index') }}" class="cart-icon">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="cart-count">{{ count(session('cart', [])) }}</span>
                        </a>
                        @if (Auth::check())
                        <a class="header-link" href="{{ Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard') }}">
                           <strong> {{ Auth::user()->name }} </strong>
                        </a>
                        @else
                        <a class="header-link" href="{{route('auth.signinPage') }}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                fill="none">
                                <g clip-path="url(#clip0_3111_32739)">
                                    <path
                                        d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z"
                                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                        stroke-linejoin="round"></path>
                                    <path
                                        d="M20.5901 22C20.5901 18.13 16.7402 15 12.0002 15C7.26015 15 3.41016 18.13 3.41016 22"
                                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                        stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="clip0_3111_32739">
                                        <rect width="24" height="24" fill="white"></rect>
                                    </clipPath>
                                </defs>
                            </svg>
                         
                            <span class="d-sm-inline-block d-none">
                                Sign in
                            </span>
                        </a>
                        @endif
                </div>
            </div>
        </div>
    </div>

    <!-- MOBILE MENU START -->
    <div class="mobile-menu" id="mobileMenu">
        <ul>
            <li><a href="{{ route('home') }}">হোম</a></li>
            @foreach ($menus['middle_menus'] as $menu)
            <li><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">
                            <span>{{ $menu->name }}</span>
                        </a>
                    </li>
            @endforeach
            
            {{-- <li><a href="#">জেনারেল বই</a></li>
            <li class="has-sub">
                <a href="#">একাডেমিক ▾</a>
                <ul class="sub-menu">
                    <li><a href="#">স্কুল</a></li>
                    <li><a href="#">কলেজ</a></li>
                </ul>
            </li> --}}

           
        </ul>
    </div>
</div>


<script>
const mobileBtn = document.getElementById('mobileMenuBtn');
const mobileMenu = document.getElementById('mobileMenu');

mobileBtn.addEventListener('click', () => {
    mobileMenu.style.display =
        mobileMenu.style.display === 'block' ? 'none' : 'block';
});

/* accordion */
document.querySelectorAll('.has-sub > a').forEach(item => {
    item.addEventListener('click', e => {
        e.preventDefault();
        const sub = item.nextElementSibling;
        sub.style.display = sub.style.display === 'block' ? 'none' : 'block';
    });
});
</script>
<!-- MOBILE MENU END -->

<!-- JS -->


