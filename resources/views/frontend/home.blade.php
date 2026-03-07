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
              
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <!-- End Hero -->



   
 {{-- All header --}}
@foreach($get_sub_category_all_header_product_only as $subCategory)
 <div class="category-product-section pb-4">
        <div class="container">
            <div class="section-card">
                <div class="section-header mb-3">
                    <h3 class="section-title"> {{ $subCategory->name }}</h3>
                    <a href="{{route('category.singleCategoryPage', $subCategory->id)}}" class="section-link">See All</a>
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
                                             @if($product->discount>0)
                                                <div class="discount-badge">
                                                    <span class="product-discount">{{number_format($product->discount)}}</span>
                                                </div>
                                                @endif
                                           <a href="{{route('product.details', $product->id)}}">
                                            <figure class="product-card-image ratio" style="--bs-aspect-ratio: 100%">
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
                                                    @if($product->discount>0)
                                                        <del>
                                                            <span class="Price-amount">
                                                                 {{ number_format($product->regular_price) }} <span class="Price-currencySymbol">Tk.</span>
                                                            </span>
                                                        </del>
                                                        @endif
                                <ins>
                                                            <span class="Price-amount">
                                                                 {{ $product->discount==0 ? number_format($product->regular_price): number_format($product->sale_price) }} <span class="Price-currencySymbol">Tk.</span>
                                                            </span>
                                                        </ins>
                                                </span>
                                            </div>
                                            </a>
                                            <div class="product-card-action">
                                                <button class="btn btn-sm btn-danger add-to-cart"
                                                            data-id="{{ $product->id }}">
                                                           <span>+</span>
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

@endsection
