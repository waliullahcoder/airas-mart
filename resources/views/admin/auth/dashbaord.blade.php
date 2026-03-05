@extends('layouts.admin.app')

@section('content')

<style>
/* ===== Card Styling ===== */
.info-card {
    border-radius: 12px;
    transition: transform 0.2s;
}
.info-card:hover {
    transform: translateY(-5px);
}
.card-body {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.card-content p {
    font-size: 0.9rem;
    color: #666;
}
.card-count {
    font-size: 1.5rem;
    font-weight: 600;
}
.card-icon {
    width: 50px;
    height: 50px;
    font-size: 24px;
}

/* Chart Cards */
.card-header {
    font-weight: 600;
    font-size: 1rem;
}
</style>
<div class="container-fluid">
    <!-- Info Cards -->
    <div class="row g-3 mb-4 info-cards">
        <div class="col-lg-3 col-sm-6">
            <a href="#">
                <div class="card info-card shadow-sm">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="card-text mb-1">Total Purchase</p>
                            <h3 class="card-count">{{ number_format(0) }}</h3>
                        </div>
                        <div class="card-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center">
                            <span class="material-symbols-outlined">shopping_cart</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-sm-6">
            <a href="#">
                <div class="card info-card shadow-sm">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="card-text mb-1">Total Sales</p>
                            <h3 class="card-count">{{ number_format(0) }}</h3>
                        </div>
                        <div class="card-icon bg-success text-white rounded-circle d-flex align-items-center justify-content-center">
                            <span class="material-symbols-outlined">sell</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-sm-6">
            <a href="#">
                <div class="card info-card shadow-sm">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="card-text mb-1">Stock Value</p>
                            <h3 class="card-count">{{ number_format(0) }}</h3>
                        </div>
                        <div class="card-icon bg-warning text-white rounded-circle d-flex align-items-center justify-content-center">
                            <span class="material-symbols-outlined">inventory</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-sm-6">
            <a href="#">
                <div class="card info-card shadow-sm">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="card-text mb-1">Supplier Due</p>
                            <h3 class="card-count">{{ number_format(0) }}</h3>
                        </div>
                        <div class="card-icon bg-danger text-white rounded-circle d-flex align-items-center justify-content-center">
                            <span class="material-symbols-outlined">account_balance</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <!-- Charts Row -->
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-header">
                    Sales Overview
                </div>
                <div class="card-body">
                    <canvas id="salesBarChart" height="200"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow-sm">
                <div class="card-header">
                    Purchase Trend
                </div>
                <div class="card-body">
                    <canvas id="purchaseLineChart" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="{{ asset('backend/js/chart.js') }}"></script>
<script>
    // ====== Bar Chart for Sales ======
    const salesCtx = document.getElementById('salesBarChart').getContext('2d');
    const salesBarChart = new Chart(salesCtx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Total Sales',
                data: [12000, 19000, 8000, 15000, 22000, 18000],
                backgroundColor: '#4CAF50'
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false },
                title: { display: true, text: 'Monthly Sales' }
            },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // ====== Line Chart for Purchases ======
    const purchaseCtx = document.getElementById('purchaseLineChart').getContext('2d');
    const purchaseLineChart = new Chart(purchaseCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Total Purchases',
                data: [10000, 14000, 7000, 12000, 16000, 13000],
                borderColor: '#2196F3',
                backgroundColor: 'rgba(33, 150, 243, 0.2)',
                tension: 0.4,
                fill: true,
                pointRadius: 5,
                pointBackgroundColor: '#2196F3'
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false },
                title: { display: true, text: 'Monthly Purchases' }
            },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>
@endsection

