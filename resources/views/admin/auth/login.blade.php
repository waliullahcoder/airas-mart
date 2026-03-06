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

body{
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#4e54c8,#8f94fb);
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
}

.login-card{
    width:420px;
    background:rgba(255,255,255,0.08);
    backdrop-filter: blur(15px);
    padding:40px;
    border-radius:15px;
    box-shadow:0 10px 40px rgba(0,0,0,0.25);
}

.login-title{
    font-weight:700;
    color:#fff;
}

.login-sub{
    color:rgba(255,255,255,0.7);
}

.form-label{
    color:#fff;
    font-size:14px;
}


.btn-login{
    background:#ffffff;
    color:#4e54c8;
    font-weight:600;
    border-radius:8px;
}

.btn-login:hover{
    background:#f0f0f0;
}

.password-toggler{
    position:absolute;
    right:10px;
    top:50%;
    transform:translateY(-50%);
    border:none;
    background:none;
    color:#fff;
}

.form-check-label{
    color:#fff;
}
.form-control{
    background:rgba(255,255,255,0.1);
    border:none;
    color:#fff;
    border-radius:8px;
}
.form-control:focus{
    outline:none;
    box-shadow:none;
    background:rgba(255,255,255,0.15);
}
.form-check-input{
    border:none;
}
</style>

</head>

<body>

<div class="login-card">

<form action="{{ route('admin.login') }}" method="POST">
@csrf

<h2 class="text-center login-title mb-2">Admin Login</h2>
<p class="text-center login-sub mb-4">Sign in to continue</p>

<div class="mb-3">
<label class="form-label">User Name</label>
<input type="text"
class="form-control"
name="user_name"
value="{{ old('user_name') }}"
required>
</div>

<div class="mb-3 position-relative">

<div class="d-flex">
<label class="form-label">Password</label>

<a href="#" class="ms-auto text-white small text-decoration-none">
Forgot password?
</a>
</div>

<input type="password"
class="form-control"
id="password"
name="password"
required>

<button type="button" class="password-toggler" onclick="togglePassword()">
<i class="fas fa-eye"></i>
</button>

</div>

<div class="mb-3 form-check">
<input class="form-check-input"
type="checkbox"
name="remember"
id="remember"
{{ old('remember') ? 'checked' : '' }}>
<label class="form-check-label" for="remember">Remember Me</label>
</div>

<button type="submit" class="btn btn-login w-100">
Sign In
</button>

</form>

</div>

@include('layouts.admin.partial.scripts')

<script>

function togglePassword(){
    let pass = document.getElementById("password");

    if(pass.type === "password"){
        pass.type = "text";
    }else{
        pass.type = "password";
    }
}

</script>

</body>
</html>