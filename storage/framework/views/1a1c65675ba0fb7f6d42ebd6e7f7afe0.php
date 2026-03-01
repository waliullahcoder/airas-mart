<?php
    if ($errors->any()) {
        foreach ($errors->all() as $error) {
            notify()->error($error, 'Error');
        }
    }
    if (session('success_message')) {
        notify()->success(session('success_message'), 'Success');
    }
?>
<?php /**PATH D:\laragon\www\airas-mart\resources\views/layouts/admin/partial/alert.blade.php ENDPATH**/ ?>