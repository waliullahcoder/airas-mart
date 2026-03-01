<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>" />

    <title><?php echo e($admin_setting->title ?? config('app.name')); ?></title>
    <link rel="shortcut icon"
        href="<?php echo e(asset(file_exists($admin_setting->favicon ?? '') ? $admin_setting->favicon : 'backend/images/logo/favicon.png')); ?>"
        type="image/x-icon" />

    <?php echo $__env->make('layouts.admin.partial.styles', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php echo $__env->make('layouts.admin.partial.alert', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
</head>

<body class="bg-light">
    <div class="overflow-hidden site-wrapper <?php echo e(Session::get('session-sidebar')); ?>">
        <?php echo $__env->make('layouts.admin.partial.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

        <div class="content-wrapper">
            <?php echo $__env->make('layouts.admin.partial.header', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            <div class="content">
                <div class="p-sm-4 p-3">
                    <?php echo $__env->yieldContent('content'); ?>
                </div>
            </div>
            <?php echo $__env->make('layouts.admin.partial.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
    <!-- End Site Wrapper -->

    <?php echo $__env->make('layouts.admin.partial.scripts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $(function() {
            $(".date_picker").datepicker({
                format: 'dd-mm-yyyy',
                changeMonth: true,
                changeYear: true
            });

            function showToast(title, text, icon = 'success') {
                Swal.fire({
                    width: "22rem",
                    position: 'top-right',
                    toast: true,
                    text,
                    icon,
                    showConfirmButton: false,
                    timer: 1500,
                    showClass: {
                        popup: `animate__animated animate__bounceInRight animate__faster`
                    },
                    hideClass: {
                        popup: `animate__animated animate__bounceOutRight animate__faster`
                    }
                });
            }

            function handleAjaxAction(selector, data) {
                $(document).on('change', selector, function(e) {
                    e.preventDefault();
                    $.ajax({
                        url: $(this).data('url'),
                        data: {
                            _method: 'GET',
                            ...data
                        },
                        success: res => {
                            showToast(res.status === 'success' ? 'Changed!' : 'Failed!', res
                                .message || 'Status updated', res.status);
                            if (selector == '.approve') {
                                $('.dataTable').DataTable().ajax.reload();

                            }
                        }
                    });
                });
            }

            handleAjaxAction('.change-status', {
                status: true
            });
            handleAjaxAction('.approve', {
                approve: true
            });

            $(document).on('click', '.link-delete, .trash_delete', function(e) {
                e.preventDefault();
                const url = $(this).data('url');
                const permanent = $(this).hasClass('trash_delete');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!',
                    cancelButtonText: 'No, cancel!',
                    reverseButtons: true
                }).then(result => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url,
                            type: 'POST',
                            data: {
                                _method: 'DELETE',
                                parmanent: permanent ? 'true' : undefined
                            },
                            success: res => {
                                showToast(res.status === 'success' ? 'Deleted!' :
                                    'Failed!', res.message || '', res.status);
                                $('.dataTable').DataTable().ajax.reload();
                            }
                        });
                    }
                });
            });

            $('#selectAll, #trash_selectAll').on('click', function() {
                const className = $(this).attr('id') === 'trash_selectAll' ? '.trash_multi_checkbox' :
                    '.multi_checkbox';
                $(className).prop('checked', this.checked);
            });

            function handleBulkDelete(buttonId, selectClass, permanent = false) {
                $(`#${buttonId}`).on('click', function() {
                    const url = $(this).data("url");
                    const ids = $(`.${selectClass}:checked`).map(function() {
                        return this.value;
                    }).get();
                    if (!ids.length) {
                        return showToast("Error!", "Please select at least one checkbox", "error");
                    }

                    Swal.fire({
                        title: "Are you sure?",
                        text: "You won't be able to revert this!",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonText: "Yes, delete it!",
                    }).then(result => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url,
                                type: 'POST',
                                data: {
                                    _method: 'DELETE',
                                    id: ids,
                                    parmanent: permanent
                                },
                                success: res => {
                                    showToast(res.status === 'success' ? 'Deleted!' :
                                        'Failed!', res.val || res.message || '', res
                                        .status);
                                    $('.dataTable').DataTable().ajax.reload();
                                    $("#selectAll, input[type=checkbox]").prop(
                                        "checked", false);
                                }
                            });
                        }
                    });
                });
            }

            handleBulkDelete('bulk_delete', 'multi_checkbox');
            handleBulkDelete('trash_bulk_delete', 'trash_multi_checkbox', true);

            $(document).on('click', '.link-recovery', function(e) {
                e.preventDefault();
                const url = $(this).data('url');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Recover this data?",
                    icon: 'warning',
                    showCancelButton: true,
                    cancelButtonText: 'No, cancel!',
                    confirmButtonText: 'Yes, recover it!',
                }).then(result => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url,
                            type: 'POST',
                            data: {
                                _method: 'DELETE',
                                recovery: 'true'
                            },
                            success: res => {
                                showToast(res.status === 'success' ? 'Recovered!' :
                                    'Failed!', res.message || '', res.status);
                                $('.dataTable').DataTable().ajax.reload();
                            }
                        });
                    }
                });
            });

            $('#filter').on('change', function() {
                const isTrash = $(this).val() === 'trash';
                $('#regular_all_select, #bulk_delete').toggle(!isTrash);
                $('#trash_all_select, #trash_bulk_delete').toggle(isTrash);
                $('.dataTable').DataTable().ajax.reload();
            });

            $(document).on('click', '.link-print', function(e) {
                e.preventDefault();
                $.ajax({
                    url: $(this).data('url'),
                    type: 'POST',
                    data: {
                        _method: 'GET'
                    }
                });
            });

            // when clicking anywhere in the row (except directly on checkbox)
            $('.dataTable tbody').on('click', 'tr', function(e) {
                // skip if click is on interactive elements (except checkbox itself)
                if ($(e.target).is('input.form-check-input, button, a, i, span')) {
                    return;
                }

                let checkbox = $(this).find('input.custom-control-input[type="checkbox"]');

                if (checkbox.length) {
                    checkbox.prop('checked', !checkbox.prop('checked')); // toggle checkbox
                    $(this).toggleClass('row-selected', checkbox.prop('checked')); // optional row highlight
                }
            });
        });
    </script>
    <?php echo $__env->yieldPushContent('js'); ?>
</body>

</html>
<?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/admin/app.blade.php ENDPATH**/ ?>