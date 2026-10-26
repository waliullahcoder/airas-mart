@extends('layouts.admin.index_app')

@section('content')
@php
    $currentRouteName = \Request::route()->getName();
    $ajaxUrl = route($currentRouteName);
    $deletePermission = str_replace('index', 'destroy', $currentRouteName);
    $deleteUrl = route($deletePermission, 0);

    $creators = \App\Models\User::whereIn('id', \App\Models\Product::select('created_by')->whereNotNull('created_by'))
        ->orderBy('name')
        ->get(['id', 'name']);

    $filtercategories = \App\Models\Category::whereNotNull('parent_id')
        ->whereIn('position', ['header', 'child_mega'])
        ->orderBy('name')
        ->get(['id', 'name']);
@endphp

<div class="card">
    <div class="card-body">

        {{-- Filter --}}
       <div class="row mb-3">
            <div class="col-md-3">
                <select id="filter_created_by" class="form-select">
                    <option value="">All Created By</option>
                    @foreach($creators as $creator)
                        <option value="{{ $creator->id }}">{{ $creator->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <select id="filter_category" class="form-select">
                    <option value="">All Categories</option>
                    @foreach($filtercategories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <table class="dataTable table table-bordered table-hover align-middle w-100">
            <thead>
                <tr class="text-nowrap align-middle">
                    <th></th>
                    <th>Thumbnail</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Created By</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody></tbody>

            @can($deletePermission)
            <tfoot>
                <tr>
                    <th class="text-center">
                        <input type="checkbox" id="selectAll">
                    </th>
                    <th colspan="7">
                        <div class="text-end">
                            <button type="button" id="bulk_delete" data-url="{{ $deleteUrl }}"
                                class="btn btn-xs btn-danger">Delete</button>
                        </div>
                    </th>
                </tr>
            </tfoot>
            @endcan
        </table>
    </div>
</div>
@endsection

@push('js')
<script>
$(document).ready(function() {

    var table = $('.dataTable').DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
        ajax: {
            url: "{{ $ajaxUrl }}",
            type: "GET",
            data: function(d) {
                d.created_by = $('#filter_created_by').val();
                 d.category_id = $('#filter_category').val();
            }
        },
        columns: [
            { data: "checkbox", name: "checkbox", orderable: false, searchable: false, className: "text-center", width: '30px' },
            { data: 'thumbnail', name: 'thumbnail', orderable: false, searchable: false, width: '70px' },
            { data: 'code', name: 'code' },
            { data: 'name', name: 'name' },
            { data: 'category_names', name: 'category_names', orderable: false, searchable: true, width: '150px' },
            { data: 'user.name', name: 'user.name', defaultContent: '', orderable: false, width: '150px' },
            
            { data: 'status', name: 'status', orderable: false, searchable: false, className: 'text-center', width: '90px' },
            { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-end', width: '120px' }
        ],
        fnDrawCallback: function() {
            $('[data-bs-toggle="tooltip"]').tooltip();

            // Status toggle ajax
            $('.status-toggle').off('change').on('change', function(){
                let id = $(this).data('id');
                let status = $(this).is(':checked') ? 'active' : 'inactive';

                $.ajax({
                    url: route("admin.product.edit", id),
                    method: 'get',
                    data: { id: id, status: status, _token: '{{ csrf_token() }}' },
                    success: function(res){
                        console.log(res);
                    }
                });
            });
        }
    });

    // Filter change -> reload table
    $('#filter_created_by, #filter_category').on('change', function() {
        table.ajax.reload();
    });

    // Select All checkbox
    $(document).on('change', '#selectAll', function() {
        $('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    });

});
</script>
@endpush