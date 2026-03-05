@extends('layouts.frontend.app')

@section('content')
    <div class="hero-section">
        <div class="container">
            <div class="swiper carousel" data-items="1" data-sm-items="1" data-xs-items="1" data-autoplay="true" data-dots="true"
                data-arrows="true" data-loop="true">
                <div class="swiper-wrapper">
                    @foreach ($slides as $item)
                        <div class="swiper-slide">
                            @if ($item->link)
                                <a href="{{ $item->link }}">
                                    <img class="w-100" src="{{ asset($item->image) }}"
                                        srcset="{{ asset($item->mobile_image) }} 768w, {{ asset($item->image) }} 1200w"
                                        sizes="(max-width: 768px) 100vw, 1200px" alt="Slide Image">
                                </a>
                            @else
                                <img class="w-100" src="{{ asset($item->image) }}"
                                    srcset="{{ asset($item->mobile_image) }} 768w, {{ asset($item->image) }} 1200w"
                                    sizes="(max-width: 768px) 100vw, 1200px" alt="Slide Image">
                            @endif
                        </div>
                    @endforeach
                </div>
                @if (count($slides) > 1)
                    <div class="swiper-arrow-btn swiper-button-prev">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div>
                    <div class="swiper-arrow-btn swiper-button-next">
                        <svg width="11" height="16" viewBox="0 0 11 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.7637 0.333588C10.1815 0.741772 10.1815 1.42208 9.77223 1.83026L3.5905 7.99554L9.7637 14.1608C10.1815 14.5775 10.1815 15.2493 9.7637 15.666C9.3459 16.0827 8.67231 16.0827 8.25451 15.666L1.16897 8.59931C0.836434 8.26767 0.836434 7.73192 1.16897 7.40027L8.25451 0.333588C8.67231 -0.0831001 9.3459 -0.0831001 9.7637 0.333588Z"
                                fill="#333333"></path>
                        </svg>
                    </div>
                @endif
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <!-- End Hero -->


    
    <!-- End Category Wise Products -->
<div class="featured-category-section py-4">
        <div class="container">
            <div class="position-relative">
                <div class="swiper carousel" id="category-swiper" data-items="2" data-xl-items="6" data-lg-items="5"
                    data-md-items="4" data-sm-items="3" data-xs-items="3" data-margin="10" data-dots="false"
                    data-arrows="true">
                    <div class="swiper-wrapper">
                        @foreach ($get_sub_categories_all as $item)
                        <div class="swiper-slide">
                            <a href="{{route('category.singleCategoryPage', $item->id) }}" class="featured-category">
                                <div class="featured-category-img">
                                    <img src="{{ asset($item->image) }}" height="40" alt="">
                                </div>
                                <div class="featured-category-text">{{ $item->name }}</div>
                            </a>
                        </div>
                        @endforeach
                       
                    </div>
                </div>
                @include('layouts.frontend.partial.svgbutton')
            </div>
        </div>
    </div>
    
    <!-- End Category Wise Products -->

    <!-- End Banner -->

   
 {{-- ট্রেন্ডিং বইসমূহ and নতুন প্রকাশিত বই --}}
@foreach($get_sub_category_trends_new_book_product_only as $subCategory)
 <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> {{ $subCategory->name }}</h3>
                    <a href="{{route('category.singleCategoryPage', $subCategory->id)}}" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             @if($subCategory->products->count() > 0)
                               @foreach($subCategory->products as $product)
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount">{{number_format($product->discount)}}</span>
                                            </div>
                                            
                                           <a href="{{route('product.details', $product->id)}}">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="{{ asset($product->thumbnail) }}"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        {{ $product->name }}
                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                        {{ $product->code }}
                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> {!! $product->short_description !!}
                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 {{ number_format($product->regular_price) }} <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> {{ number_format($product->sale_price ?? $product->regular_price) }}<span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="{{ $product->id }}">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                             @else
                            <p class="text-muted">No products found</p>
                             @endif
                        </div>
                        
                       @include('layouts.frontend.partial.svgbutton')
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach

    <!--  End ট্রেন্ডিং বইসমূহ and নতুন প্রকাশিত বই -->

    <!-- Banner Category -->
    <div class="pb-4">
        <div class="container">
            <div class="row g-3">
                @foreach($get_sub_category_banner_only as $subCategory)
                <div class="col-sm-4">
                    <a href="{{route('category.singleCategoryPage', $subCategory->id)}}"><img src="{{ asset($subCategory->image) }}" alt=""></a>
                </div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- End Banner Category -->

    <!-- সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা -->
    @foreach($get_sub_category_sian_jugpuerti_nrobiul_aual_product_only as $subCategory)
 <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> {{ $subCategory->name }}</h3>
                    <a href="{{route('category.singleCategoryPage', $subCategory->id)}}" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             @if($subCategory->products->count() > 0)
                               @foreach($subCategory->products as $product)
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount">{{number_format($product->discount)}}</span>
                                            </div>
                                            
                                           <a href="{{route('product.details', $product->id)}}">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="{{ asset($product->thumbnail) }}"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        {{ $product->name }}
                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                        {{ $product->code }}
                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> {!! $product->short_description !!}
                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 {{ number_format($product->regular_price) }} <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> {{ number_format($product->sale_price ?? $product->regular_price) }}<span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="{{ $product->id }}">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                             @else
                            <p class="text-muted">No products found</p>
                             @endif
                        </div>
                        
                       @include('layouts.frontend.partial.svgbutton')
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach
    <!-- End সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা -->

{{-- //জনপ্রিয় লেখক --}}
<div class="author-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">জনপ্রিয় লেখক</h3>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="4" data-xs-items="3" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                            @foreach ($get_sub_category_writer_only as $item)
                            <div class="swiper-slide">
                                <a href="{{route('category.singleCategoryPage', $item->id)}}" class="author-card">
                                    <img src="{{ asset($item->image) }}">
                                    <p class="author-card-text">{{ $item->name }}</p>
                                </a>
                            </div>
                            @endforeach
                           
                        </div>
                    </div>
                     @include('layouts.frontend.partial.svgbutton')
                </div>
            </div>
        </div>
    </div>
    {{-- END//জনপ্রিয় লেখক --}}

    {{-- আতর ও সুগন্ধি পণ্য --}}
    @foreach($get_sub_category_atar_sugondhi_product_only as $subCategory)
 <div class="category-product-section pb-4" style="display:none;">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> {{ $subCategory->name }}</h3>
                    <a href="{{route('category.singleCategoryPage', $subCategory->id)}}" class="section-link">সবগুলো দেখুন</a>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="6" data-lg-items="5" data-md-items="4"
                        data-sm-items="3" data-xs-items="2" data-margin="5" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                             @if($subCategory->products->count() > 0)
                               @foreach($subCategory->products as $product)
                            <div class="swiper-slide">
                                <div class="p-sm-2 p-1">
                                    <div class="product-card-wrapper">
                                        <div class="product-card">
                                            <div class="discount-badge">
                                                <span class="product-discount">{{number_format($product->discount)}}</span>
                                            </div>
                                            
                                           <a href="{{route('product.details', $product->id)}}">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 150%">
                                                <img class="object-fit-contain product-img" src="{{ asset($product->thumbnail) }}"
                                                    alt="">
                                            </figure>
                                            <div class="product-card-content">
                                                <h6 class="h6 product-card-title truncate-text" style="--lines: 2;">
                                                        {{ $product->name }}
                                                    
                                                </h6>
                                                <p class="product-card-title truncate-text"
                                                        style="--lines: 2;">
                                                       {{ $product->code }}
                                                </p>
                                                <p class="product-card-author truncate-text" style="--lines: 2;"> {!! $product->short_description !!}
                                                </p>
                                                <span class="product-card-price">
                                                    <del>
                                                         <span class="Price-amount">
                                                                 {{ number_format($product->regular_price) }} <span class="Price-currencySymbol">৳</span>
                                                            </span>
                                                    </del>
                                                    <ins>
                                                        <span class="Price-amount"> {{ number_format($product->sale_price ?? $product->regular_price) }}<span class="Price-currencySymbol">৳</span>
                                                        </span>
                                                    </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="{{ $product->id }}">
                                                            Add to Cart
                                                        </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                             @else
                            <p class="text-muted">No products found</p>
                             @endif
                        </div>
                        
                       @include('layouts.frontend.partial.svgbutton')
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach
    {{-- END//আতর ও সুগন্ধি পণ্য --}}


    {{-- অন্যান্য পণ্য --}}
     <div class="category-section pb-4" style="display:none;">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">অন্যান্য পণ্য</h3>
                </div>
                <div class="position-relative">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="3" data-xs-items="2" data-margin="20" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                            @foreach($get_sub_category_others_only as $item)
                            <div class="swiper-slide">
                                <a href="{{route('category.singleCategoryPage', $item->id)}}" class="category-card2">
                                    <div class="category-card2-image ratio"
                                        style="--bs-aspect-ratio: 100%; width: 80px;">
                                        <img class="object-fit-contain" src="{{ asset($item->image) }}" alt="">
                                    </div>
                                    <div class="category-card2-text">{{ $item->name }}</div>
                                </a>
                            </div>
                            @endforeach
                           
                        </div>
                    </div>
                    @include('layouts.frontend.partial.svgbutton')
                </div>
            </div>
        </div>
    </div>
    {{-- end অন্যান্য পণ্য --}}

    {{-- ব্র্যান্ডসমূহ --}}
    <div class="brand-section pb-4" style="display:none;">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title">ব্র্যান্ডসমূহ</h3>
                </div>
                <div class="position-relative mb-3">
                    <div class="swiper carousel" data-items="2" data-xl-items="7" data-lg-items="6" data-md-items="5"
                        data-sm-items="3" data-xs-items="2" data-margin="20" data-dots="false" data-arrows="true">
                        <div class="swiper-wrapper">
                     @foreach($get_sub_category_brand_only as $item)
                            <div class="swiper-slide">
                                <a href="{{route('category.singleCategoryPage', $item->id)}}" class="brand-card">
                                    <div class="brand-card-image ratio" style="--bs-aspect-ratio: 100%;">
                                        <img class="object-fit-contain" src="{{ asset($item->image) }}" alt="">
                                    </div>
                                    <div class="brand-card-text">{{ $item->name }}</div>
                                </a>
                            </div>
                            @endforeach
                            
                        </div>
                        @include('layouts.frontend.partial.svgbutton')
                    </div>
                </div>
            </div>
        </div>
    </div>
   {{-- END ব্র্যান্ডসমূহ --}}
@endsection
