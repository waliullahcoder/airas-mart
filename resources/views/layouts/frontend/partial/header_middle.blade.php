<!-- CSS (search dropdown) -->
<style>
#search-results ul,
#mobile-search-results ul { list-style: none; margin: 0; padding: 0; }

#search-results .list-group-item,
#mobile-search-results .list-group-item {
    border-color: var(--line);
    transition: background-color .15s;
}

#search-results .list-group-item:hover,
#mobile-search-results .list-group-item:hover { background-color: var(--airas-green-50); }

#search-results img,
#mobile-search-results img { border-radius: 8px; object-fit: cover; border: 1px solid var(--line); }

#search-results strong,
#mobile-search-results strong { color: var(--ink); font-size: 13px; }

#search-results .list-group-item strong + br + small,
#mobile-search-results small { color: var(--ink-soft); }

#search-results .text-end strong,
#mobile-search-results .text-end strong { color: var(--airas-red); }

.header-logo img { height: 58px; width: auto; }

@media (max-width: 991.98px) {
    .header-logo img { height: 44px; }
    .header-middle { padding: 10px 0 8px; }
}
</style>

<div class="header-middle">
    <div class="container">

        <!-- Row 1: Hamburger / Logo / Desktop search / Cart + Account -->
        <div class="d-flex align-items-center justify-content-between gap-2 mb-2">

            <!-- Hamburger (mobile only) -->
            <button id="sidebarToggle" class="hamburger d-block d-lg-none" aria-label="Open menu">
                <span></span>
                <span></span>
                <span></span>
            </button>

            <!-- Logo -->
            <a href="{{ route('home') }}" class="header-logo logo-area">
                <img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo/logo.jpg') }}"
                     alt="{{ $settings->app_name }}">
            </a>

            <!-- Desktop Search (desktop only) -->
            <div class="d-none d-lg-block flex-grow-1 search-area">
                <form action="#" method="GET" class="search-box">
                    <input type="search" class="form-control w-100" name="query"
                           placeholder="Search product's name here" required id="product-search-input" autocomplete="off">
                    <button type="submit" class="search-submit" aria-label="Search">
                        <i class="fas fa-search"></i>
                    </button>

                    <div id="search-results" class="search-results-box"></div>
                </form>
            </div>

            <!-- Cart + Account -->
            <div class="header-actions">
                <a href="{{ route('cart.index') }}" class="header-action cart-icon" aria-label="Cart">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="cart-count">{{ count(session('cart', [])) }}</span>
                </a>

                @if(Auth::check())
                    <a class="header-action" href="{{ Auth::user()->role_status == 0 ? route('frontend.user.dashboard') : route('admin.dashboard') }}">
                        <i class="fa-regular fa-user"></i>
                        <span class="d-none d-md-inline">{{ Auth::user()->name }}</span>
                    </a>
                @else
                    <a class="header-action" href="{{ route('auth.signinPage') }}">
                        <i class="fa-regular fa-user"></i>
                        <span class="d-none d-md-inline">Sign in</span>
                    </a>
                @endif
            </div>
        </div>

        <!-- Row 2: Mobile Search only -->
        <div class="d-lg-none position-relative w-100 mb-1">
            <form action="#" method="GET" class="search-box mobile-search-area">
                <input type="search" class="form-control w-100" name="query"
                       placeholder="Search product's name here" required id="mobile-product-search-input" autocomplete="off">
                <button type="submit" class="search-submit" aria-label="Search">
                    <i class="fas fa-search"></i>
                </button>

                <div id="mobile-search-results" class="search-results-box"></div>
            </form>
        </div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header d-flex justify-content-between align-items-center">
            <span>Menu</span>
            <button id="closeSidebar">✕</button>
        </div>

        <ul>
            <li><a href="{{ route('home') }}">Home</a></li>

            @foreach($menus['middle_menus'] as $menu)
                <li>
                    <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug, $menu->name]) }}">
                        {{ $menu->name }}
                    </a>
                </li>
            @endforeach

            <div class="sidebar-header">Mega Menu</div>

            @foreach ($menus['mega_menus'] as $menu)
                <li class="{{ isset($menus['sub_menus'][$menu->id]) ? 'has-sub' : '' }}">
                    <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug, $menu->name]) }}">
                        {{ $menu->name }}
                    </a>

                    @if(isset($menus['sub_menus'][$menu->id]) && count($menus['sub_menus'][$menu->id]) > 0)
                    @php
                    $items = $menus['sub_menus'][$menu->id]->take(20);
                    @endphp
                        <ul class="sub-menu">
                            @foreach($items as $item)
                                <li>
                                    <a href="{{ route('category.singleCategoryPage', $item->id) }}">
                                        → {{ $item->name }}
                                    </a>
                                </li>
                            @endforeach
                            @if($menus['sub_menus'][$menu->id]->count() > 20)
                               <li><a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}" data-menu="menu-{{ $menu->id }}" style="padding-left:30px; color:#549a95;">
                                    Read More →
                                </a>
                                </li>
                            @endif
                        </ul>
                         
                    @endif
                </li>
            @endforeach
        </ul>
    </div>

    <!-- Sidebar Overlay -->
    <div class="sidebar-overlay" id="sidebarOverlay"></div>
</div>

   
<!-- JS -->
<script>
document.addEventListener('DOMContentLoaded', function(){

    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebarOverlay');
    const toggleBtn = document.getElementById('sidebarToggle');
    const closeBtn = document.getElementById('closeSidebar');

    toggleBtn.addEventListener('click', function(){
        sidebar.classList.add('active');
        overlay.style.display = 'block';
    });

    closeBtn.addEventListener('click', closeSidebar);
    overlay.addEventListener('click', closeSidebar);

    function closeSidebar(){
        sidebar.classList.remove('active');
        overlay.style.display = 'none';
    }

    // Submenu toggle
    document.querySelectorAll('.sidebar .has-sub > a').forEach(function(item){
        item.addEventListener('click', function(e){
            e.preventDefault();
            const parent = this.parentElement;
            const subMenu = this.nextElementSibling;

            // toggle display
            if(subMenu.style.display === 'block'){
                subMenu.style.display = 'none';
                parent.classList.remove('open');
            } else {
                subMenu.style.display = 'block';
                parent.classList.add('open');
            }
        });
    });
});
</script>


