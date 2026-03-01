

<?php $__env->startSection('content'); ?>
    <?php
        $currentRouteName = \Request::route()->getName();
        $ajaxUrl = route($currentRouteName);
        $deletePermission = str_replace('index', 'destroy', $currentRouteName);
        $deleteUrl = route($deletePermission, 0);
    ?>
    <table class="dataTable table align-middle" style="width:100%">
        <thead>
            <tr class="text-nowrap">
                <th></th>
                <th>Name</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody></tbody>

        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check($deletePermission)): ?>
            <tfoot>
                <tr>
                    <th class="text-center">
                        <div class="custom-control custom-checkbox mx-auto">
                            <div id="regular_all_select">
                                <input type="checkbox" class="custom-control-input" id="selectAll">
                                <label class="custom-control-label" for="selectAll"></label>
                            </div>
                            <div id="trash_all_select" style="display: none;">
                                <input type="checkbox" class="custom-control-input" id="trash_selectAll">
                                <label class="custom-control-label" for="trash_selectAll"></label>
                            </div>
                        </div>
                    </th>
                    <th colspan="3">
                        <div class="text-end">
                            <button type="button" id="bulk_delete" name="bulk_delete" data-url="<?php echo e($deleteUrl); ?>"
                                class="btn btn-xs btn-danger">
                                Delete
                            </button>
                            <button type="button" id="trash_bulk_delete" name="bulk_delete" data-url="<?php echo e($deleteUrl); ?>"
                                class="btn btn-xs btn-danger" style="display: none;">
                                Delete
                            </button>
                        </div>
                    </th>
                </tr>
            </tfoot>
        <?php endif; ?>
    </table>

    <?php echo $__env->make('admin.uom.partial.create', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div id="editForm"></div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('js'); ?>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                responsive: true,
                ajax: {
                    url: "<?php echo e($ajaxUrl); ?>",
                    type: "GET",
                    data: function(data) {
                        data.type = $('#filter').val();
                    }
                },
                columns: [{
                        data: "checkbox",
                        name: "checkbox",
                        orderable: false,
                        searchable: false,
                        className: "text-center",
                        width: '20'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                        width: '90'
                    }
                ],
                fnDrawCallback: function() {
                    const tooltips = document.querySelectorAll('.tt');
                    tooltips.forEach(t => {
                        new bootstrap.Tooltip(t);
                    });
                }
            });

            $(document).on('click', '#addBtn', function(e) {
                e.preventDefault();
                $('#addModal').modal('show');
            });

            $(document).on('click', '.link-edit', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $('#editForm').html('');
                $.ajax({
                    url,
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        edit: true,
                    },
                    success: res => {
                        $('#editForm').html(res.data);
                        $('#editModal').modal('show');
                    }
                });
            });

            $('#editModal').on('hidden.bs.modal', function() {
                $('#editForm').html('');
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.index_app', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\laragon\www\airas-mart\resources\views/admin/attribute/index.blade.php ENDPATH**/ ?>