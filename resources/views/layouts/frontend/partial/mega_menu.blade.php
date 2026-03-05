<div class="nav-wrapper">
    <div class="navbar">

        @foreach ($menus['mega_menus'] as $menu)
            <a href="{{ route('category.index', [$menu->category_id, $menu->category_slug,$menu->name]) }}"
               class="{{ isset($menus['sub_menus'][$menu->id]) ? 'mega-trigger' : '' }}"
               data-menu="menu-{{ $menu->id }}">

                {{ $menu->name }}

                @if(isset($menus['sub_menus'][$menu->id]))
                    <span class="caret">▾</span>
                @endif
            </a>
        @endforeach

    </div>
    <!-- GLOBAL MEGA MENU -->
    <div class="mega-wrapper">

       @foreach ($menus['mega_menus']  as $menu)
    @if(isset($menus['sub_menus'][$menu->id]))
        <div class="mega-menu" id="menu-{{ $menu->id }}">
            <div class="mega-grid">

                @foreach ($menus['sub_menus'][$menu->id]->chunk(3) as $chunk)
                    <div class="mega-column">
                        {{-- Optional heading --}}
                        {{-- <h4>{{ $menu->name }}</h4> --}}

                        @foreach ($chunk as $item)
                            <a href="{{ route('category.index', [$item->id, $item->category_slug,$item->name]) }}">
                                {{ $item->name }}
                            </a>
                        @endforeach
                    </div>
                @endforeach

            </div>
        </div>
    @endif
@endforeach


    </div>
</div>


<script>
const triggers = document.querySelectorAll('.mega-trigger');
const wrapper = document.querySelector('.mega-wrapper');
const menus = document.querySelectorAll('.mega-menu');
const navWrapper = document.querySelector('.nav-wrapper');

triggers.forEach(trigger => {
    trigger.addEventListener('mouseenter', () => {
        if (window.innerWidth <= 600) return;

        wrapper.style.display = 'block';
        menus.forEach(menu => menu.classList.remove('active'));

        const target = document.getElementById(trigger.dataset.menu);
        if (target) target.classList.add('active');
    });

    // Mobile click
    trigger.addEventListener('click', e => {
        if (window.innerWidth > 600) return;
        e.preventDefault();

        wrapper.style.display =
            wrapper.style.display === 'block' ? 'none' : 'block';

        menus.forEach(menu => menu.classList.remove('active'));
        const target = document.getElementById(trigger.dataset.menu);
        if (target) target.classList.add('active');
    });
});

navWrapper.addEventListener('mouseleave', () => {
    if (window.innerWidth > 600) {
        wrapper.style.display = 'none';
    }
});
</script>


