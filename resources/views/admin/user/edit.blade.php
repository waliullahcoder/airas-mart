@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="role_id" class="form-label require"><b>Role <span class="text-danger">*</span></b></label>
            <select class="form-control select" name="role_id" id="role_id" data-placeholder="select Role" required>
                @foreach ($additionalData['roles'] as $role)
                    @if (!Auth::user()->hasRole('Software Admin') && $role->name == 'System Admin')
                        @continue
                    @endif
                    <option value="{{ $role->id }}" {{ $data->hasRole($role->name) ? 'selected' : '' }}>
                        {{ $role->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="name" class="form-label"><b>Name <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Name"
                value="{{ $data->name }}" required>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="user_name" class="form-label"><b>User ID <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="User ID"
                value="{{ $data->user_name }}" required>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="email" class="form-label"><b>Email</b></label>
            <input type="email" class="form-control" id="email" name="email" placeholder="User Email"
                value="{{ $data->email }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="phone" class="form-label"><b>Phone</b></label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="User Phone"
                value="{{ $data->phone }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="image" class="form-label"><b>Image</b></label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*">
            @if (!empty($data->image) && file_exists(public_path($data->image)))
                <img class="mt-2" src="{{ asset($data->image) }}" height="30" alt="Image">
            @endif
        </div>
        <hr>

        @php 
        $total_qty = App\Models\Product::where('created_by', $data->id)->count();
        $total_amount = $total_qty*$data->per_rate;
        @endphp

         <div class="col-lg-4 col-sm-6">
            <label for="total_qty" class="form-label"><b>Total Qty</b></label>
            <input type="text" class="form-control" id="total_qty" name="total_qty" placeholder="Total Qty" value="{{ $total_qty }}">
        </div>
         <div class="col-lg-4 col-sm-6">
            <label for="paid_qty" class="form-label"><b>Paid Qty</b></label>
            <input type="text" class="form-control" id="paid_qty" name="paid_qty" placeholder="Paid Qty" value="{{ $data->paid_qty }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="pending_qty" class="form-label"><b>Pending Qty</b></label>
            <input type="text" class="form-control" id="pending_qty" name="pending_qty" placeholder="Pending Qty" value="{{ $total_qty-$data->paid_qty }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="per_rate" class="form-label"><b>Rate Per</b></label>
            <input type="text" class="form-control" id="per_rate" name="per_rate" placeholder="Rate Per" value="{{ $data->per_rate }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="total_amount" class="form-label"><b>Total Amount (TK)</b></label>
            <input type="text" class="form-control" id="total_qty" name="total_amount" placeholder="Total Amount" value="{{ $total_amount }}">
        </div>
         <div class="col-lg-4 col-sm-6">
            <label for="paid_qty" class="form-label"><b>Paid Amount (TK)</b></label>
            <input type="text" class="form-control" id="paid_qty" name="paid_amount" placeholder="Paid Amount" value="{{ $data->paid_amount }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="pending_qty" class="form-label"><b>Pending Amount (TK)</b></label>
            <input type="text" class="form-control" id="pending_amount" name="pending_amount" placeholder="Pending Amount" value="{{ $total_amount-$data->paid_amount}}">
        </div>

    </div>
@endsection
