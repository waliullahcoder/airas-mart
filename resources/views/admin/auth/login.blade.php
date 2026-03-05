<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ @$admin_setting->title }}</title>
    <link rel="shortcut icon"
        href="{{ asset(file_exists(@$admin_setting->favicon) ? $admin_setting->favicon : 'backend/images/logo/favicon.png') }}"
        type="image/x-icon">
    @notifyCss
    @include('layouts.admin.partial.styles')
    @include('layouts.admin.partial.alert')
    <style>
        body {
            height: 100%;
            transition: background .2s linear;
            color: rgb(255 255 255 / 75%);
            background-image: url("http://127.0.0.1:8080/bg.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: initial;
            background-size: cover;
        }

        body:before {
            content: "";
            position: fixed;
            top: 0;
            inset-inline-start: 0;
            inset-inline-end: 0;
            height: 100%;
            background-color: transparent;
            background-image: url(data:image/png;base64,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);
            background-size: 4.6875rem;
            background-repeat: repeat;
            background-attachment: initial;
        }

        .login {
            min-height: 100vh;
            padding: 3rem 1rem;
            display: flex;
            align-items: center;
            background: linear-gradient(180deg, rgba(50, 70, 80, .9) 0%, rgb(13, 16, 27) 100%);
        }

        .login .login-content {
            max-width: 22.5rem;
            margin: 0 auto;
            position: relative;
            flex: 1;
        }

        .text-inverse {
            color: rgb(255 255 255 / 50%) !important;
        }

        .form-label {
            margin-bottom: .5rem;
        }

        .form-control {
            background-color: rgb(255 255 255 / 5%) !important;
            min-height: calc(1.5em + 1rem + calc(1px * 2));
            padding: .5rem 1rem;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid rgb(255 255 255 / 25%);
            color: rgb(255 255 255 / 75%);
        }

        .form-check-input {
            flex-shrink: 0;
            width: 1.3em;
            height: 1.3em;
            margin-top: .1em;
            vertical-align: top;
            appearance: none;
            background-color: #00000000;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            border: 1px solid rgb(255 255 255 / 25%);
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
        }

        .list-group-item.active,
        .page-item.active .page-link,
        .form-check-input:checked,
        .nav-pills .nav-link.active,
        .nav-pills .show>.nav-link {
            background-color: #549a95;
            border-color: #549a95;
        }

        .form-control:focus {
            color: rgb(255 255 255 / 75%);
            background-color: transparent;
            border-color: rgb(255 255 255 / 50%);
            outline: 0;
            box-shadow: 0 0 0 .25rem rgb(255 255 255 / 25%);
        }

        .password-toggler {
            background-color: transparent;
            color: var(--bs-white);
            border: none;
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            font-size: 12px;
            width: 45px;
            justify-content: center;
        }
    </style>
</head>

<body class="bg-light">
    <div class="site-wrapper">
        <div class="login">
            <div class="login-content">
                <form action="{{ route('admin.login') }}" method="POST">
                    @csrf
                    <h1 class="h2 text-center text-white fw-bold">Sign In</h1>
                    <div class="text-inverse text-opacity-50 text-center mb-4"> For your protection, please verify your
                        identity. </div>
                    <div class="mb-3">
                        <label for="user_name" class="form-label">User Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="user_name" id="user_name"
                            value="{{ old('user_name') }}" required>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex">
                            <label for="" class="form-label">Password <span class="text-danger">*</span></label>
                            <a href="#" class="ms-auto text-inverse text-decoration-none text-opacity-50">Forgot
                                password?</a>
                        </div>
                        <div class="position-relative">
                            <button type="button" class="input-group-text password-toggler">
                                <i class="fas fa-eye-slash"></i></button>
                            <input type="password" class="form-control" id="toggle_password" name="password"
                                value="{{ old('password') }}" placeholder="" autocomplete="password" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" id="remember"
                                {{ old('remember') ? 'checked' : '' }}>
                            <label class="form-check-label ms-1" for="remember">Remember me</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-primary d-block w-100 fw-500 mb-3">Sign
                        In</button>
                </form>
            </div>
        </div>
    </div>
    <!-- End Site Wrapper -->
    @include('layouts.admin.partial.scripts')
</body>

</html>
