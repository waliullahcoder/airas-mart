<div class="header-top d-md-block d-none" style="background: linear-gradient(135deg, #000000, #1a0033, #4b0082);">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div class="text-sm">Welcome to AIRAS MART</div>
            <div class="top-header-links">
                @foreach ($menus['top_menus'] as $menu)
                <a target="_blank" href="{{ $menu->menu_url }}">
                    <span>{{ $menu->name }}</span> </a>
                <div class="devider"></div>
                @endforeach
            </div>
        </div>
    </div>
</div>