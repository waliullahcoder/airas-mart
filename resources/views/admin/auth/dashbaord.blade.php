@extends('layouts.admin.app')

@section('content')
@if(auth()->id()==1)
<style>
.info-card { border-radius: 12px; transition: transform 0.2s; }
.info-card:hover { transform: translateY(-5px); }
.card-body { display: flex; justify-content: space-between; align-items: center; }
.card-content p { font-size: 0.9rem; color: #666; }
.card-count { font-size: 1.5rem; font-weight: 600; }
.card-icon { width: 50px; height: 50px; font-size: 24px; }
.card-header { font-weight: 600; font-size: 1rem; }
</style>

<div class="container-fluid">
    <!-- Info Cards -->
    <div class="row g-3 mb-4 info-cards">
        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.expense.index') }}">
                <div class="card-body">
                    <div>
                        <p>Total Expense</p>
                        <h3 class="card-count">৳{{ number_format($dashboardData['totalExpense'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-danger text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">account_balance_wallet</span>
                    </div>
                </div>
                </a>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.sales.index') }}">
                <div class="card-body">
                    <div>
                        <p>Total Sales</p>
                        <h3 class="card-count">৳{{ number_format($dashboardData['totalSales'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-success text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">sell</span>
                    </div>
                </div>
                </a>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.orders.index') }}">
                <div class="card-body">
                    <div>
                        <p>Total Orders</p>
                        <h3 class="card-count">{{ number_format($dashboardData['totalOrders'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-info text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">shopping_cart</span>
                    </div>
                </div>
                </a>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.expense.index') }}">
                <div class="card-body">
                    <div>
                        <p>Daily Expense</p>
                        <h3 class="card-count">৳{{ number_format($dashboardData['dailyExpense'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-warning text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">payments</span>
                    </div>
                </div>
                </a>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.sales.index') }}">
                <div class="card-body">
                    <div>
                        <p>Daily Sales</p>
                        <h3 class="card-count">৳{{ number_format($dashboardData['dailySales'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">currency_exchange</span>
                    </div>
                </div>
                </a>
            </div>
        </div>

        <div class="col-lg-4 col-sm-6">
            <div class="card info-card shadow-sm">
                <a href="{{ route('admin.orders.index') }}">
                <div class="card-body">
                    <div>
                        <p>Daily Orders</p>
                        <h3 class="card-count">{{ number_format($dashboardData['dailyOrders'] ?? 0) }}</h3>
                    </div>
                    <div class="card-icon bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center">
                        <span class="material-symbols-outlined">receipt_long</span>
                    </div>
                </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Charts -->
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-header">Monthly Sales</div>
                <div class="card-body">
                    <canvas id="salesBarChart" height="200"></canvas>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-header">Monthly Expense</div>
                <div class="card-body">
                    <canvas id="expenseLineChart" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="{{ asset('backend/js/chart.js') }}"></script>
<script>
const months = @json($dashboardData['months'] ?? []);
const monthlySales = @json($dashboardData['monthlySales'] ?? []);
const monthlyExpense = @json($dashboardData['monthlyExpense'] ?? []);

// Sales Bar Chart
const salesCtx = document.getElementById('salesBarChart').getContext('2d');
new Chart(salesCtx, {
    type: 'bar',
    data: {
        labels: months,
        datasets: [{
            label: 'Monthly Sales',
            data: monthlySales,
            backgroundColor: '#4CAF50'
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },
            title: { display: true, text: 'Monthly Sales' }
        },
        scales: { y: { beginAtZero: true } }
    }
});

// Expense Line Chart
const expenseCtx = document.getElementById('expenseLineChart').getContext('2d');
new Chart(expenseCtx, {
    type: 'line',
    data: {
        labels: months,
        datasets: [{
            label: 'Monthly Expense',
            data: monthlyExpense,
            borderColor: '#F44336',
            backgroundColor: 'rgba(244, 67, 54, 0.2)',
            tension: 0.4,
            fill: true,
            pointRadius: 5,
            pointBackgroundColor: '#F44336'
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },
            title: { display: true, text: 'Monthly Expense' }
        },
        scales: { y: { beginAtZero: true } }
    }
});
</script>
@else

@php
$summary = \App\Models\User::where('id', auth()->id())->first();
@endphp
<style>
    .summary-card {
    border-radius: 14px;
    transition: transform .2s ease, box-shadow .2s ease;
}
.summary-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 .5rem 1.2rem rgba(0,0,0,.12) !important;
}
.icon-box {
    width: 52px;
    height: 52px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    flex-shrink: 0;
}
.gradient-primary { background: linear-gradient(135deg, #4e73df, #224abe); color: #fff; }
.gradient-success { background: linear-gradient(135deg, #1cc88a, #13855c); color: #fff; }
.gradient-danger  { background: linear-gradient(135deg, #e74a3b, #be2617); color: #fff; }
    </style>

    {{-- ========== Summary Cards ========== --}}
<div class="row g-3 mb-4" id="summary-cards">
   <h5>Payment Summary of {{ $summary->name }}</h5>
    {{-- Total Qty --}}
    <div class="col-xl-3 col-md-6">
        <div class="card summary-card border-0 shadow-sm h-100">
            <div class="card-body d-flex align-items-center">
                <div class="icon-box bg-primary-subtle text-primary me-3">
                    <i class="bi bi-box-seam"></i>
                </div>
                <div>
                    <p class="text-muted mb-1 small text-uppercase fw-semibold">Total Qty</p>
                    <h4 class="mb-0 fw-bold" id="total_qty">{{ number_format($summary->total_qty ?? 0) }}</h4>
                </div>
            </div>
        </div>
    </div>

    {{-- Paid Qty --}}
    <div class="col-xl-3 col-md-6">
        <div class="card summary-card border-0 shadow-sm h-100">
            <div class="card-body d-flex align-items-center">
                <div class="icon-box bg-success-subtle text-success me-3">
                    <i class="bi bi-check-circle"></i>
                </div>
                <div>
                    <p class="text-muted mb-1 small text-uppercase fw-semibold">Paid Qty</p>
                    <h4 class="mb-0 fw-bold text-success" id="paid_qty">{{ number_format($summary->paid_qty ?? 0) }}</h4>
                </div>
            </div>
        </div>
    </div>

    {{-- Pending Qty --}}
    <div class="col-xl-3 col-md-6">
        <div class="card summary-card border-0 shadow-sm h-100">
            <div class="card-body d-flex align-items-center">
                <div class="icon-box bg-warning-subtle text-warning me-3">
                    <i class="bi bi-hourglass-split"></i>
                </div>
                <div>
                    <p class="text-muted mb-1 small text-uppercase fw-semibold">Pending Qty</p>
                    <h4 class="mb-0 fw-bold text-warning" id="pending_qty">{{ number_format($summary->pending_qty ?? 0) }}</h4>
                </div>
            </div>
        </div>
    </div>

    {{-- Per Rate --}}
    <div class="col-xl-3 col-md-6">
        <div class="card summary-card border-0 shadow-sm h-100">
            <div class="card-body d-flex align-items-center">
                <div class="icon-box bg-info-subtle text-info me-3">
                    <i class="bi bi-tag"></i>
                </div>
                <div>
                    <p class="text-muted mb-1 small text-uppercase fw-semibold">Per Rate</p>
                    <h4 class="mb-0 fw-bold" id="per_rate">৳ {{ number_format($summary->per_rate ?? 0, 2) }}</h4>
                </div>
            </div>
        </div>
    </div>

    {{-- Total Amount --}}
    <div class="col-xl-4 col-md-6">
        <div class="card summary-card gradient-primary border-0 shadow-sm h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <p class="mb-1 small text-uppercase fw-semibold opacity-75">Total Amount</p>
                        <h3 class="mb-0 fw-bold" id="total_amount">৳ {{ number_format($summary->total_amount ?? 0, 2) }}</h3>
                    </div>
                    <i class="bi bi-wallet2 fs-1 opacity-50"></i>
                </div>
            </div>
        </div>
    </div>

    {{-- Paid Amount --}}
    <div class="col-xl-4 col-md-6">
        <div class="card summary-card gradient-success border-0 shadow-sm h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <p class="mb-1 small text-uppercase fw-semibold opacity-75">Paid Amount</p>
                        <h3 class="mb-0 fw-bold" id="paid_amount">৳ {{ number_format($summary->paid_amount ?? 0, 2) }}</h3>
                    </div>
                    <i class="bi bi-cash-coin fs-1 opacity-50"></i>
                </div>
            </div>
        </div>
    </div>

    {{-- Pending Amount --}}
    <div class="col-xl-4 col-md-12">
        <div class="card summary-card gradient-danger border-0 shadow-sm h-100">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <p class="mb-1 small text-uppercase fw-semibold opacity-75">Pending Amount</p>
                        <h3 class="mb-0 fw-bold" id="pending_amount">৳ {{ number_format($summary->pending_amount ?? 0, 2) }}</h3>
                    </div>
                    <i class="bi bi-clock-history fs-1 opacity-50"></i>
                </div>
            </div>
        </div>
    </div>

    {{-- Payment Progress --}}
    @php
        $totalAmt = $summary->total_amount ?? 0;
        $paidAmt  = $summary->paid_amount ?? 0;
        $percent  = $totalAmt > 0 ? round(($paidAmt / $totalAmt) * 100, 1) : 0;
    @endphp
    <div class="col-12">
        <div class="card border-0 shadow-sm">
            <div class="card-body py-3">
                <div class="d-flex justify-content-between mb-2">
                    <span class="small fw-semibold text-muted">Payment Progress</span>
                    <span class="small fw-bold" id="progress_text">{{ $percent }}%</span>
                </div>
                <div class="progress" style="height: 10px;">
                    <div class="progress-bar bg-success progress-bar-striped"
                         id="progress_bar"
                         role="progressbar"
                         style="width: {{ $percent }}%"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endif

@endsection