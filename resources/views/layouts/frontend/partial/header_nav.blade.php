<div class="header-nav d-lg-block d-none">
        <div class="container">
            <nav class="main-menu">
                <ul class="menu-list">

                    {{-- Home --}}
                    <li class="menu-item">
                        <a class="menu-link {{ request()->routeIs('home') ? 'active' : '' }}"
                        href="{{ route('home') }}">
                            <span>হোম</span>
                        </a>
                    </li>

                    {{-- Dynamic Menus --}}
                    @foreach ($menus['middle_menus'] as $menu)
                       <li class="menu-item">
                        <a class="menu-link
                        {{ request()->routeIs('category.index') 
                            && request()->route('menu') == $menu->name 
                            ? 'active' : '' }}"
                        href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}">
                            <span>{{ $menu->name }}</span>
                        </a>
                    </li>


                    @endforeach

                </ul>

               @include('layouts.frontend.partial.mega_menu')

            </nav>
        </div>
    </div>

    
    
