@extends('layouts.frontend.app')

@section('content')
<div class="hero-section" style="margin-bottom:40px;">
    <div class="container">
        <div class="section-card" style="padding:40px; background:#fff; border-radius:8px; box-shadow:0 2px 10px rgba(0,0,0,0.05);">
            
            <div class="section-header mb-4">
                <h3 class="section-title text-center">{{ $info->name }}</h3>
            </div>

            <div class="section-content" style="padding:20px; line-height:1.8; font-size:16px;">
                {!! $info->description !!}
            </div>

        </div>
    </div>
</div>
@endsection