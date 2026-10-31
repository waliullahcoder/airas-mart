
<!-- Start Header Top -->
@include('layouts.frontend.partial.header_top') 
<!-- End Header Top -->

<header class="main-header">
    @include('layouts.frontend.partial.header_middle')
    @include('layouts.frontend.partial.header_nav')
</header>
<div class="news-ticker">
    <span class="news-label">ডেলিভারি</span>
    <div class="news-viewport">
        <div class="news-track">
                <div class="news-group">
                    <h4>{{$settings->google_map}}</h4>
                </div>
           
        </div>
    </div>
</div>
<style>
    .news-ticker {
    display: flex;
    align-items: center;
    flex: 1;
    min-width: 0;
    margin: 0 24px;
}

.news-label {
    flex-shrink: 0;
    background: #e63946;   /* brand color */
    color: #fff;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    padding: 3px 10px;
    border-radius: 3px;
    margin-right: 12px;
}

.news-viewport {
    flex: 1;
    min-width: 0;
    overflow: hidden;
    white-space: nowrap;
}

.news-track {
    display: flex;
    width: max-content;
    animation: news-marquee 20s linear infinite;
}

.news-viewport:hover .news-track {
    animation-play-state: paused;
}

.news-group {
    padding-top:10px;
    display: flex;
    flex-shrink: 0;
    min-width: 100%;          /* choto content hole-o gap hobe na */
    justify-content: space-around;
}

.news-item {
    font-size: 13px;
    padding: 0 30px;
}

.news-item::before {
    content: "•";
    margin-right: 12px;
    opacity: .6;
}

@keyframes news-marquee {
    from { transform: translateX(0); }
    to   { transform: translateX(-50%); }
}

@media (prefers-reduced-motion: reduce) {
    .news-track { animation: none; }
}
    </style>
<!-- End Header -->
