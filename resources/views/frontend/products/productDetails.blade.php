

@extends('layouts.frontend.app')

@section('content')
<style>
.small-thumb {
    transition: 0.3s;
    border: 2px solid transparent;
}

.small-thumb:hover {
    transform: scale(1.05);
}
.product-card img{
    width:20%
}
.gap-2{
    gap:0px !important;
}
.active-thumb {
    border: 2px solid #dc3545;
}
</style>
<div class="product-details-page py-4">
    <div class="container">

        <!-- TOP SECTION -->
        <div class="row g-4">

            <!-- PRODUCT CARD (JS TARGET FOR FLYING IMAGE) -->
            <div class="col-lg-9">
                <div class="product-card">

                    <div class="row g-4">
                     <!-- LEFT : PRODUCT IMAGE -->
                    <div class="col-lg-4">
                        <div class="bg-white border rounded p-3">

                            <!-- MAIN IMAGE -->
                            <div class="text-center mb-3">
                                <img id="productThumbnail"
                                    class="img-fluid rounded product-img"
                                    src="{{ asset($product->thumbnail) }}"
                                    alt="{{ $product->name }}"
                                    style="cursor:pointer; max-height:500px; width:100%; object-fit:contain;"
                                    data-bs-toggle="modal"
                                    data-bs-target="#imageModal">
                            </div>

                            <!-- SMALL THUMBNAILS -->
                            <div class="d-flex justify-content-center gap-2 flex-wrap">

                                {{-- Default Thumbnail --}}
                                <img src="{{ asset($product->thumbnail) }}"
                                    class="img-thumbnail small-thumb active-thumb"
                                    width="70"
                                    style="cursor:pointer;"
                                    onclick="changeImage(this)">
                                {{-- Extra Images --}}
                                @foreach($product->images->take(4) as $image)
                                    <img src="{{ asset($image->image) }}"
                                        class="img-thumbnail small-thumb"
                                        width="70"
                                        style="cursor:pointer;"
                                        onclick="changeImage(this)">
                                @endforeach

                            </div>

                        </div>
                    </div>
                    <!-- IMAGE ZOOM MODAL -->
                    <div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content bg-white rounded shadow-lg border-0">
                                <div class="modal-header border-0">
                                    <h5 class="modal-title">{{ $product->name }}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-center p-3">
                                    <img id="modalImage"
                                        src="{{ asset($product->thumbnail) }}"
                                        class="img-fluid rounded"
                                        style="max-height:80vh; width:auto;">
                                </div>
                                <div class="modal-footer justify-content-between border-0">
                                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <div>
                                        <button class="btn btn-sm btn-primary" id="zoomIn">+</button>
                                        <button class="btn btn-sm btn-primary" id="zoomOut">-</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                    function changeImage(element) {

                        // Change main image
                        let mainImage = document.getElementById('productThumbnail');
                        mainImage.src = element.src;

                        // Change modal image also
                        document.getElementById('modalImage').src = element.src;

                        // Active border remove
                        document.querySelectorAll('.small-thumb').forEach(img => {
                            img.classList.remove('active-thumb');
                        });

                        // Active border add
                        element.classList.add('active-thumb');
                    }
                    </script>
                    <script>
                    let zoomLevel = 1;
                    const modalImage = document.getElementById('modalImage');

                    document.getElementById('zoomIn').addEventListener('click', () => {
                        zoomLevel += 0.1;
                        modalImage.style.transform = `scale(${zoomLevel})`;
                    });

                    document.getElementById('zoomOut').addEventListener('click', () => {
                        if(zoomLevel > 0.2) zoomLevel -= 0.1;
                        modalImage.style.transform = `scale(${zoomLevel})`;
                    });
                    </script>


                        <!-- RIGHT : PRODUCT DETAILS -->
                        <div class="col-lg-8">
                            <div class="bg-white border rounded p-3">

                                <h2 class="mb-2">{{ $product->name }}</h2>

                                <!-- BADGES -->
                                <div class="mb-2">
                                    @if($product->best_seller)
                                        <span class="badge bg-success">Best Seller</span>
                                    @endif
                                    @if($product->new_arrival)
                                        <span class="badge bg-primary">New Arrival</span>
                                    @endif
                                    @if($product->trending)
                                        <span class="badge bg-warning text-dark">Trending</span>
                                    @endif
                                </div>

                                <!-- RATING -->
                                @php
                                    $avgRating   = round($product->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $product->reviews->count();          // total users
                                @endphp

                                <div class="mb-2 text-warning">
                                    @for($i = 1; $i <= 5; $i++)
                                        @if($i <= floor($avgRating))
                                            ★
                                        @elseif($i - $avgRating < 1)
                                            ☆
                                        @else
                                            ☆
                                        @endif
                                    @endfor

                                    <span class="text-muted">
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                </div>


                                <!-- SHORT DESCRIPTION -->
                                <div class="mb-3 text-muted">
                                    {!! $product->short_description !!}
                                </div>

                                <!-- PRICE -->
                                <div class="mb-4">
                                    @if($product->sale_price > 0)
                                        <h3 class="text-danger">
                                            {{ number_format($product->sale_price, 2) }} ৳
                                            <del class="fs-6 text-muted ms-2">
                                                {{ number_format($product->regular_price, 2) }} ৳
                                            </del>
                                        </h3>
                                    @else
                                        <h3 class="text-danger">
                                            {{ number_format($product->regular_price, 2) }} ৳
                                        </h3>
                                    @endif
                                </div>

                                <!-- ACTION BUTTONS -->
                                <div class="d-flex gap-2 mb-4" style="gap:0.5rem !important">
                                    <button class="btn btn-danger add-to-cart"
                                            data-id="{{ $product->id }}" {{$product->variants->sum('stock')>0 ? '' : 'disabled'}}>
                                        Add to Cart
                                    </button>
                                    {{-- <button class="btn btn-outline-secondary">
                                        Wishlist
                                    </button> --}}
                                    @php
                                        $alreadyWishlisted = auth()->check() &&
                                            auth()->user()->wishlists()->where('product_id', $product->id)->exists();
                                    @endphp
                                    @if($alreadyWishlisted)
                                        <button class="btn btn-sm btn-danger" disabled>
                                            ❤️ Wishlisted
                                        </button>
                                    @else
                                        <form action="{{ route('wishlist.store', $product->id) }}"
                                            method="POST"
                                            class="d-inline">
                                            @csrf
                                            <button class="btn btn-outline-danger btn-sm"{{$product->variants->sum('stock')>0 ? '' : 'disabled'}}>
                                                🤍 Add to Wishlist
                                            </button>
                                        </form>
                                    @endif

                                </div>

                                <!-- META INFO -->
                                <table class="table table-sm">
                                    <tr>
                                        <th width="150">SKU</th>
                                        <td>{{ $product->sku ?? 'N/A' }}</td>
                                    </tr>
                                    <tr>
                                        <th>CODE NUMBER</th>
                                        <td>{{ $product->code }}</td>
                                    </tr>
                                    <tr>
                                        <th>Product Type</th>
                                        <td>{{ ucfirst($product->product_type) }}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td>
                                            @if($product->variants->sum('stock')>0)
                                                <span class="text-success">In Stock</span>
                                            @else
                                                <span class="text-danger">Out of Stock</span>
                                            @endif
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Stock</th>
                                        <td>{{ $product->variants->sum('stock') }}</td>
                                    </tr>
                                    <tr>
                                        <th>Author</th>
                                        <td>{{$product->authors->pluck('name')->implode(', ')}}</td>
                                    </tr>
                                    <tr>
                                        <th>Publication</th>
                                        <td>{{$product->publication->name ?? 'N/A'}}</td>
                                    </tr>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- RELATED PRODUCTS -->
            <div class="col-lg-3">
                <div class="bg-white border rounded p-3">
                    <h6 class="mb-3">Related Products</h6>

                    @foreach($relatedProducts ?? [] as $item)
                        <div class="d-flex mb-3">
                            <img src="{{ asset($item->thumbnail) }}"
                                 class="me-2 rounded"
                                 width="60"
                                 alt="">
                            <div>
                                <a href="{{ route('product.details', $item->id) }}"
                                   class="small fw-semibold d-block">
                                    {{ $item->name }}
                                </a>
                                <p>{{ $item->code }}</p><br>
                                <span class="text-danger small">
                                    {{ number_format($item->sale_price ?? $item->regular_price, 2) }} ৳
                                </span>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>

        </div>
        <!-- END TOP -->

        <!-- BOTTOM SECTION -->
        <div class="row mt-5">
            <div class="col-12">

                <div class="bg-white border rounded">

                    <!-- TABS -->
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#description">
                                Description
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#information">
                                Information
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#reviews">
                                Reviews ({{ $product->reviews->count() }})
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content p-4">

                        <div class="tab-pane fade show active" id="description">
                            {!! $product->description !!}
                        </div>

                        <div class="tab-pane fade" id="information">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Category</th>
                                    <td>{{ $product->category->name??'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Authors</th>
                                    <td>{{ $product->authors->pluck('name')->implode(', ') }}</td>
                                </tr>
                                <tr>
                                    <th>Publication</th>
                                    <td>{{ $product->publication->name ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Barcode</th>
                                    <td>{{ $product->barcode }}</td>
                                </tr>
                            </table>
                        </div>

                        

                            {{-- REVIEW LIST --}}
                        <div class="tab-pane fade" id="reviews">
                            <h6 class="mb-3">
                                Customer Reviews ({{ $product->reviews->count() }})
                            </h6>
                            @forelse($product->reviews as $review)
                                <div class="border-bottom pb-2 mb-3">
                                    <strong>{{ $review->user->name }}</strong>

                                    <div class="text-warning">
                                        @for($i=1;$i<=5;$i++)
                                            {{ $i <= $review->rating ? '★' : '☆' }}
                                        @endfor
                                    </div>

                                    <p class="mb-0 text-muted">
                                        {{ $review->review }}
                                    </p>
                                </div>
                            @empty
                                <p class="text-muted">No reviews yet.</p>
                            @endforelse

                            {{-- REVIEW FORM --}}
                            @auth
                                @if($review_count == 0)
                                <hr>
                                <h6>Write a Review</h6>

                                <form method="POST" action="{{ route('review.store', $product->id) }}">
                                    @csrf

                                    <div class="mb-2">
                                        <label class="form-label">Rating</label>
                                        <select name="rating" class="form-select" required>
                                            <option value="">Select Rating</option>
                                            @for($i=5;$i>=1;$i--)
                                                <option value="{{ $i }}">{{ $i }} Star</option>
                                            @endfor
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Review</label>
                                        <textarea name="review" rows="3"
                                                class="form-control"
                                                placeholder="Write your experience..."></textarea>
                                    </div>

                                    <button class="btn btn-primary btn-sm">
                                        Submit Review
                                    </button>
                                </form>
                                @endif
                            @else
                                <p class="text-muted mt-3">
                                    Please <a href="{{ route('login') }}">login</a> to write a review.
                                </p>
                            @endauth
                        </div>

                            {{-- REVIEW LIST \\\\--}}


                            
                    </div>

                </div>

            </div>
        </div>

    </div>
</div>
@endsection
