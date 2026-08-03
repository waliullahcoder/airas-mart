@extends('layouts.frontend.app')

@section('content')
<style>
 .payment-section {
    margin-top: 25px;
}

.payment-heading {
    font-size: 20px;
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 16px;
}

.checkout-box {
    background: linear-gradient(180deg, #ffffff, #f8fafc);
    border: 1px solid #e5e7eb;
    border-radius: 20px;
    padding: 22px;
    box-shadow: 0 16px 40px rgba(15, 23, 42, 0.08);
}

.checkout-title {
    font-size: 18px;
    font-weight: 800;
    color: #111827;
    margin-bottom: 18px;
}

.checkout-title span {
    display: block;
    font-size: 13px;
    font-weight: 500;
    color: #6b7280;
    margin-top: 3px;
}

.method-option {
    position: relative;
    display: flex;
    align-items: center;
    gap: 14px;
    width: 100%;
    padding: 14px 15px;
    margin-bottom: 12px;
    background: #fff;
    border: 1.5px solid #e5e7eb;
    cursor: pointer;
    transition: all 0.25s ease;
}

.method-option:hover {
    border-color: #2563eb;
    box-shadow: 0 10px 24px rgba(37, 99, 235, 0.08);
    transform: translateY(-1px);
}

.method-option input {
    display: none;
}

.radio-ui {
    width: 20px;
    height: 20px;
    border: 2px solid #cbd5e1;
    border-radius: 50%;
    flex: 0 0 20px;
    position: relative;
}

.method-option input:checked + .radio-ui {
    border-color: #2563eb;
}

.method-option input:checked + .radio-ui::after {
    content: "";
    width: 10px;
    height: 10px;
    background: #2563eb;
    border-radius: 50%;
    position: absolute;
    inset: 3px;
}

.method-option:has(input:checked) {
    border-color: #2563eb;
    background: #eff6ff;
}

.method-icon {
    width: 42px;
    height: 42px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-weight: 800;
    font-size: 18px;
    flex: 0 0 42px;
    box-shadow: 0 8px 18px rgba(0,0,0,0.12);
}

.method-icon.bkash {
    background: #e2136e;
}

.method-icon.nagad {
    background: #f5821f;
}

.method-icon.rocket {
    background: #8b2fc9;
}

.method-icon.cod {
    background: #2e7d32;
}

.method-icon.card {
    background: #1a1f71;
    font-size: 10px;
}

.method-info {
    display: flex;
    flex-direction: column;
    flex: 1;
    min-width: 0;
}

.method-info strong {
    font-size: 15px;
    color: #111827;
    margin-bottom: 2px;
}

.method-info small {
    font-size: 12px;
    color: #6b7280;
    line-height: 1.4;
}

.popular-badge {
    background: #e2136e;
    color: #fff;
    font-size: 11px;
    font-weight: 700;
    padding: 4px 9px;
    border-radius: 999px;
    white-space: nowrap;
}

.pay-btn {
    width: 100%;
    border: none;
    margin-top: 12px;
    padding: 15px 18px;
    border-radius: 16px;
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: #fff;
    font-size: 16px;
    font-weight: 800;
    cursor: pointer;
    box-shadow: 0 14px 28px rgba(37, 99, 235, 0.25);
    transition: all 0.25s ease;
}

.pay-btn span {
    display: block;
    font-size: 12px;
    font-weight: 500;
    opacity: 0.9;
    margin-top: 2px;
}

.pay-btn:hover {
    transform: translateY(-1px);
    box-shadow: 0 18px 36px rgba(37, 99, 235, 0.32);
}

.trust-strip {
    margin-top: 14px;
    padding: 10px 12px;
    background: #f1f5f9;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 7px;
    color: #475569;
}

.trust-strip small {
    font-size: 12px;
}

/* Responsive */
@media (max-width: 575px) {
    .checkout-box {
        padding: 16px;
        border-radius: 16px;
    }

    .checkout-title {
        font-size: 16px;
    }

    .method-option {
        gap: 10px;
        padding: 12px;
        border-radius: 14px;
    }

    .method-icon {
        width: 38px;
        height: 38px;
        border-radius: 12px;
        flex-basis: 38px;
    }

    .method-info strong {
        font-size: 14px;
    }

    .method-info small {
        font-size: 11px;
    }

    .popular-badge {
        display: none;
    }

    .pay-btn {
        padding: 13px 15px;
        font-size: 15px;
    }
}   

/*-------*/
.order-summary-card {
    background: #ffffff;
    padding: 22px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 18px 45px rgba(15, 23, 42, 0.08);
}

.order-summary-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    margin-bottom: 18px;
}

.order-summary-header h4 {
    margin: 0;
    font-size: 22px;
    font-weight: 800;
    color: #111827;
}

.order-summary-header p {
    margin: 4px 0 0;
    font-size: 13px;
    color: #6b7280;
}

.item-count {
    background: #eff6ff;
    color: #2563eb;
    font-size: 12px;
    font-weight: 700;
    padding: 7px 12px;
    border-radius: 999px;
    white-space: nowrap;
}

.order-table-wrap {
    border: 1px solid #eef2f7;
    border-radius: 16px;
    overflow: hidden;
}

.order-table {
    margin-bottom: 0;
}

.order-table thead th {
    background: #f8fafc;
    color: #475569;
    font-size: 13px;
    font-weight: 800;
    border-bottom: 1px solid #e5e7eb;
    padding: 13px 14px;
}

.order-table tbody td {
    padding: 14px;
    font-size: 14px;
    color: #111827;
    border-color: #f1f5f9;
}

.product-name {
    font-weight: 700;
    color: #111827;
    line-height: 1.4;
}

.qty-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 32px;
    height: 28px;
    padding: 0 10px;
    background: #f1f5f9;
    color: #0f172a;
    border-radius: 999px;
    font-weight: 800;
    font-size: 13px;
}

.summary-total-box {
    margin-top: 18px;
    background: linear-gradient(180deg, #f8fafc, #ffffff);
    border: 1px solid #e5e7eb;
    border-radius: 18px;
    padding: 16px;
}

.summary-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    padding: 9px 0;
    color: #475569;
    font-size: 14px;
}

.summary-row strong {
    color: #111827;
    font-size: 15px;
}

/* .summary-row.discount span,
.summary-row.discount strong {
    color: #dc2626;
} */

.summary-divider {
    height: 1px;
    background: #e5e7eb;
    margin: 10px 0;
}

.grand-total {
    padding-top: 12px;
}

.grand-total span {
    font-size: 17px;
    font-weight: 800;
    color: #111827;
}

.grand-total strong {
    font-size: 24px;
    color: #16a34a;
    font-weight: 900;
}

/* Responsive */
@media (max-width: 575px) {
    .order-summary-card {
        padding: 16px;
        border-radius: 18px;
    }

    .order-summary-header {
        align-items: flex-start;
    }

    .order-summary-header h4 {
        font-size: 19px;
    }

    .order-table-wrap {
        overflow-x: auto;
    }

    .order-table {
        min-width: 540px;
    }

    .grand-total strong {
        font-size: 20px;
    }
}

/*----------*/


.delivery-box{
    margin-top:15px;
    margin-bottom:10px;
}

.delivery-title{
    font-weight:700;
    margin-bottom:12px;
}

.delivery-option{
    display:flex;
    align-items:center;
    gap:12px;
    border:1px solid #e5e7eb;
    padding:14px;
    border-radius:14px;
    margin-bottom:10px;
    cursor:pointer;
    transition:.3s;
}

.delivery-option:hover{
    border-color:#0d6efd;
    background:#f8fbff;
}

.delivery-option input{
    display:none;
}

.radio-ui{
    width:20px;
    height:20px;
    border:2px solid #cbd5e1;
    border-radius:50%;
    position:relative;
}

.delivery-option input:checked + .radio-ui{
    border-color:#0d6efd;
}

.delivery-option input:checked + .radio-ui:after{
    content:'';
    width:10px;
    height:10px;
    background:#0d6efd;
    border-radius:50%;
    position:absolute;
    top:3px;
    left:3px;
}

.delivery-price{
    margin-left:auto;
    font-weight:700;
    color:#198754;
}

@media(max-width:576px){

.delivery-option{
    padding:10px;
}

.delivery-price{
    font-size:13px;
}

}
</style>
<div class="container py-5">
    <form action="{{ route('checkout.placeOrder') }}" method="POST">
        @csrf

        <div class="row">

            {{-- LEFT : CART / INVOICE --}}
            <div class="col-lg-7">
            <div class="order-summary-card mb-4">
                <div class="order-summary-header">
                    <div>
                        <h4>🧾 Order Summary</h4>
                        <p>আপনার অর্ডারের বিস্তারিত</p>
                    </div>
                    <span class="item-count">{{ count($cart) }} Items</span>
                </div>

                <div class="order-table-wrap">
                    <table class="table order-table align-middle">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th class="text-center">Qty</th>
                                <th class="text-end">Price</th>
                                <th class="text-end">Total</th>
                            </tr>
                        </thead>

                        <tbody>
                            @php $subtotal = 0; @endphp

                            @foreach($cart as $item)
                                @php
                                    $line = $item['price'] * $item['qty'];
                                    $subtotal += $line;
                                @endphp

                                <tr>
                                    <td>
                                        <div class="product-name">
                                            {{ $item['name'] }}
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <span class="qty-badge">{{ $item['qty'] }}</span>
                                    </td>
                                    <td class="text-end">
                                        ৳{{ number_format($item['price'],2) }}
                                    </td>
                                    <td class="text-end fw-bold">
                                        ৳{{ number_format($line,2) }}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

               @php
                    $discount = (
                        $settings->discount_type=='percent'
                        ? $subtotal * $settings->discount/100
                        : $settings->discount
                    );

                    $tax = $subtotal * $settings->tax/100;

                    $delivery = 80; // default dhaka

                    $total = $subtotal - $discount + $tax + $delivery;
                @endphp


                <input type="hidden" name="subtotal" value="{{ $subtotal }}">
                <input type="hidden" name="discount" value="{{ $discount }}">
                <input type="hidden" name="tax" value="{{ $tax }}">
                <input type="hidden" id="delivery_charge" name="delivery_charge" value="80">
                <input type="hidden" id="final_total" name="total" value="{{ $total }}">


                <div class="summary-total-box">

                    <div class="summary-row">
                        <span>Subtotal</span>
                        <strong>৳{{ number_format($subtotal,2) }}</strong>
                    </div>

                    <div class="summary-row">
                        <span>
                            Discount
                            {{ $settings->discount_type=='percent'
                                ? '('.$settings->discount.'%)'
                                : '' }}
                        </span>

                        <strong class="text-danger">
                            -৳{{ number_format($discount,2) }}
                        </strong>
                    </div>

                    <div class="summary-row">
                        <span>Tax ({{$settings->tax}}%)</span>
                        <strong>৳{{ number_format($tax,2) }}</strong>
                    </div>


                    {{-- Delivery Charge --}}

                    <div class="delivery-box">

                        <h6 class="delivery-title">
                            🚚 Delivery Charge
                        </h6>

                        <label class="delivery-option active">

                            <input
                                type="radio"
                                name="delivery_type"
                                value="80"
                                checked>

                            <span class="radio-ui"></span>

                            <div>
                                <strong>ঢাকার ভিতরে</strong>
                                <small>Delivery Charge</small>
                            </div>

                            <span class="delivery-price">
                                ৳80
                            </span>

                        </label>


                        <label class="delivery-option">

                            <input
                                type="radio"
                                name="delivery_type"
                                value="120">

                            <span class="radio-ui"></span>

                            <div>
                                <strong>ঢাকার বাইরে</strong>
                                <small>Delivery Charge</small>
                            </div>

                            <span class="delivery-price">
                                ৳120
                            </span>

                        </label>

                    </div>


                    <div class="summary-row">
                        <span>Delivery Charge</span>

                        <strong id="delivery_amount">
                            ৳80.00
                        </strong>
                    </div>


                    <div class="summary-divider"></div>

                    <div class="summary-row grand-total">
                        <span>Total Payable</span>

                        <strong id="grandTotal">
                            ৳{{ number_format($total,2) }}
                        </strong>
                    </div>

                </div>
            </div>
        </div>

            {{-- RIGHT : CUSTOMER + PAYMENT --}}
            <div class="col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-body">

                        {{-- CUSTOMER INFO --}}
                        @if(!auth()->check())
                            <h5 class="mb-3">👤 Customer Information</h5>

                            <div class="mb-2">
                                <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                            </div>

                            <div class="mb-2">
                                <input type="number" name="phone" class="form-control" placeholder="Mobile No." required>
                            </div>

                            <div class="mb-3">
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                            </div>
                            <p>If you have an account, please continue to <a href="{{ route('auth.signinPage') }}" style="color:green">Login</a></p>
                        @endif
                        
                        

                        {{-- PAYMENT METHOD --}}
                        <div class="payment-section">
                            <h5 class="payment-heading">💳 Payment Method</h5>

                            <div class="checkout-box">
                                <div class="checkout-title">
                                    পেমেন্ট পদ্ধতি বেছে নিন
                                    <span>Choose payment method</span>
                                </div>

                                
                                <label class="method-option">
                                    <input type="radio" name="payment_method" value="cod" checked>
                                    <span class="radio-ui"></span>
                                    <span class="method-icon cod">✓</span>
                                    <span class="method-info">
                                        <strong>Cash on Delivery</strong>
                                        <small>বই পেলে টাকা দিন</small>
                                    </span>
                                </label>

                                <label class="method-option selected">
                                    <input type="radio" name="payment_method" value="bkash">
                                    <span class="radio-ui"></span>
                                    <span class="method-icon bkash">৳</span>
                                    <span class="method-info">
                                        <strong>bKash <span style="font-size:12px;">01916304877(Personal)</span></strong>
                                        <small>মোবাইল ব্যাংকিং — সবচেয়ে জনপ্রিয়</small>
                                    </span>
                                    <span class="popular-badge">Popular</span>
                                </label>

                                <label class="method-option">
                                    <input type="radio" name="payment_method" value="nagad">
                                    <span class="radio-ui"></span>
                                    <span class="method-icon nagad">N</span>
                                    <span class="method-info">
                                        <strong>Nagad</strong>
                                        <small>মোবাইল ব্যাংকিং</small>
                                    </span>
                                </label>

                                <label class="method-option">
                                    <input type="radio" name="payment_method" value="rocket">
                                    <span class="radio-ui"></span>
                                    <span class="method-icon rocket">R</span>
                                    <span class="method-info">
                                        <strong>Rocket</strong>
                                        <small>ডাচ-বাংলা ব্যাংক</small>
                                    </span>
                                </label>

                                <label class="method-option">
                                    <input type="radio" name="payment_method" value="card">
                                    <span class="radio-ui"></span>
                                    <span class="method-icon card">VISA</span>
                                    <span class="method-info">
                                        <strong>Card payment</strong>
                                        <small>Visa / Mastercard</small>
                                    </span>
                                </label>

                                <button type="button" class="pay-btn border-0" data-bs-toggle="modal" data-bs-target="#paymentModal">
                                    এখনই পেমেন্ট করুন
                                    <span>Pay now</span>
                                </button>

                                <div class="trust-strip">
                                    <span>🔒</span>
                                    <small>256-bit SSL encrypted · Safe & secure</small>
                                </div>
                            </div>
                        </div>

                        {{-- PLACE ORDER --}}
                        <br><button type="submit" class="btn btn-success w-100 btn-lg">
                            🛒 Place Order
                        </button>

                    </div>
                </div>
            </div>

        </div>
    </form>
</div>

<!--Payment Modal-->
<style>
    .pay-btn{
    width:100%;
    background:linear-gradient(135deg,#ff6b00,#ff9500);
    color:#fff;
    border-radius:12px;
    padding:15px;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}

.pay-btn span{
    display:block;
    font-size:13px;
    opacity:.85;
}

.pay-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(0,0,0,.2);
}

.list-group-item{
    border-radius:10px !important;
    margin-bottom:10px;
    cursor:pointer;
    transition:.2s;
}

.list-group-item:hover{
    background:#f8f9fa;
    border-color:#0d6efd;
}
</style>
<div class="modal fade" id="paymentModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow-lg border-0 rounded-4">

            <form action="" method="POST">
                @csrf

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" style="color:white;">
                        Payment Information
                    </h5>

                    <button type="button" class="btn-close btn-close-white"
                            data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="fw-bold mb-2">
                            Select Payment Method
                        </label>

                        <div class="list-group">

                            <label class="list-group-item">
                                <input class="form-check-input me-2"
                                       type="radio"
                                       name="payment_method"
                                       value="bkash"
                                       checked>

                                <strong>bKash</strong><br>
                                <small class="text-danger">
                                    Personal: 01921588567
                                </small>
                            </label>

                            <label class="list-group-item">
                                <input class="form-check-input me-2"
                                       type="radio"
                                       name="payment_method"
                                       value="nagad">

                                <strong>Nagad</strong><br>
                                <small class="text-danger">
                                    Personal: 01921588567
                                </small>
                            </label>

                            <label class="list-group-item">
                                <input class="form-check-input me-2"
                                       type="radio"
                                       name="payment_method"
                                       value="rocket">

                                <strong>Rocket</strong><br>
                                <small class="text-danger">
                                    Personal: 019215885673
                                </small>
                            </label>

                            <label class="list-group-item">
                                <input class="form-check-input me-2"
                                       type="radio"
                                       name="payment_method"
                                       value="bank">

                                <strong>Bank Account / Credit Card</strong><br>

                                <small class="text-primary">
                                    Account Name : Airas Mart
                                </small><br>

                                <small class="text-primary">
                                    Bank : Dutch Bangla Bank PLC
                                </small><br>

                                <small class="text-primary">
                                    A/C No : 123456789012
                                </small>
                            </label>

                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            Transaction ID
                        </label>

                        <input type="text"
                               name="transaction_id"
                               class="form-control"
                               placeholder="Enter Transaction ID"
                               required>
                    </div>

                </div>

                <div class="modal-footer">

                    <button class="btn btn-secondary"
                            data-bs-dismiss="modal"
                            type="button">
                        Cancel
                    </button>

                    <button class="btn btn-success">
                        Confirm Payment
                    </button>

                </div>

            </form>

        </div>
    </div>
</div>
<!--Payment Modal end-->

<script>

    document.querySelectorAll(
    'input[name="delivery_type"]'
    )

    .forEach(item=>{

    item.addEventListener(
    'change',
    function(){

    let delivery =
    parseFloat(this.value);

    document.getElementById(
    'delivery_charge'
    ).value=delivery;

    document.getElementById(
    'delivery_amount'
    ).innerHTML=
    '৳'+delivery.toFixed(2);


    let subtotal={{ $subtotal }};
    let discount={{ $discount }};
    let tax={{ $tax }};

    let total=
    subtotal-discount+tax+delivery;

    document.getElementById(
    'grandTotal'
    ).innerHTML=
    '৳'+total.toFixed(2);

    document.getElementById(
    'final_total'
    ).value=total;

    });
    });

</script>
@endsection
