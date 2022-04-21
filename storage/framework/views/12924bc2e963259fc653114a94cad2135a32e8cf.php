<?php $general_setting = DB::table('general_settings')->find(1); ?>
        <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo e($general_setting->site_title); ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<?php echo asset('public/vendor/bootstrap/css/bootstrap.min.css') ?>" type="text/css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<?php echo asset('public/css/style.default.css') ?>" id="theme-stylesheet"
          type="text/css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<?php echo asset('public/css/custom-' . $general_setting->theme) ?>" type="text/css">
    <!-- Favicon-->
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo e(asset('public/apple-touch-icon.png')); ?>">
<link rel="icon" type="image/png" sizes="32x32" href="<?php echo e(asset('public/favicon-32x32.png')); ?>">
<link rel="icon" type="image/png" sizes="16x16" href="<?php echo e(asset('public/favicon-16x16.png')); ?>">
<link rel="manifest" href="<?php echo e(asset('public/site.webmanifest')); ?>">
<link rel="mask-icon" href="<?php echo e(asset('public/safari-pinned-tab.svg')); ?>" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
</head>

<style>
        .login-page {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
}

@keyframes  gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

    </style>

<body>
<div class="page login-page">
    <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
            <div class="form-inner">
                <div class="logo"><span><img style="max-width: 50%;" src="<?php echo e(url('public/logo/logo.png')); ?>" ></span></div>
                <?php echo $__env->make('shared.errors', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php echo $__env->make('shared.flash_message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <form method="POST" action="<?php echo e(route('login')); ?>" id="login-form">
                    <?php echo csrf_field(); ?>
                    <div class="form-group-material">


                        <input id="username" type="text" class="input-material <?php $__errorArgs = ['username'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                               name="username" value="<?php echo e(old('username')); ?>" required autofocus>
                        <label for="username" class="label-material"><?php echo e(__('Username')); ?></label>

                        <?php $__errorArgs = ['username'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                        <span class="invalid-feedback" role="alert">
                            <strong><?php echo e($message); ?></strong>
                        </span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>

                    <div class="form-group-material">


                        <input id="password" type="password"
                               class="input-material <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" name="password" required
                               autocomplete="current-password">
                        <label for="password" class="label-material"><?php echo e(__('Password')); ?></label>

                        <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                        <span class="invalid-feedback" role="alert">
                            <strong><?php echo e($message); ?></strong>
                        </span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" name="remember"
                               id="remember" <?php echo e(old('remember') ? 'checked' : ''); ?>>
                        <label class="custom-control-label" for="remember"><?php echo e(__('Remember Me')); ?></label>
                    </div>
                    <br>
                    <div class="form-group mb-0">
                        <button type="submit" class="btn btn-primary btn-block">
                            <?php echo e(__('Login')); ?>

                        </button>
                    </div>
                </form>
                <!-- This three buttons for demo only-->
                
                <br><br>
                <?php if(Route::has('password.request')): ?>
                    <a class="forgot-pass" href="<?php echo e(route('password.request')); ?>">
                        <?php echo e(__('Forgot Your Password?')); ?>

                    </a>
                <?php endif; ?>
            </div>
            <?php
                $general_settings = \App\GeneralSetting::latest()->first();
            ?>
            <div class="copyrights text-center">
                <p><?php echo e(__('Developed by')); ?> <a href=<?php echo e($general_settings->footer_link); ?> class="external"><?php echo e($general_settings->footer); ?></a></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<?php echo asset('public/vendor/jquery/jquery.min.js') ?>"></script>
</body>
</html>

<script type="text/javascript">
    (function($) {

        "use strict";

        $('.admin-btn').on('click', function () {
            $("input[name='username']").focus().val('admin');
            $("input[name='password']").focus().val('admin');
        });

        $('.staff-btn').on('click', function () {
            $("input[name='username']").focus().val('staff');
            $("input[name='password']").focus().val('staff');
        });
        $('.client-btn').on('click', function () {
            $("input[name='username']").focus().val('client');
            $("input[name='password']").focus().val('client');
        });

        // ------------------------------------------------------- //
        // Material Inputs
        // ------------------------------------------------------ //

        let materialInputs = $('input.input-material');

        // activate labels for prefilled values
        materialInputs.filter(function () {
            return $(this).val() !== "";
        }).siblings('.label-material').addClass('active');

        // move label on focus
        materialInputs.on('focus', function () {
            $(this).siblings('.label-material').addClass('active');
        });

        // remove/keep label on blur
        materialInputs.on('blur', function () {
            $(this).siblings('.label-material').removeClass('active');

            if ($(this).val() !== '') {
                $(this).siblings('.label-material').addClass('active');
            } else {
                $(this).siblings('.label-material').removeClass('active');
            }
        });
    })(jQuery);
</script>

<?php /**PATH /home/srbgcomb/public_html/resources/views/auth/login.blade.php ENDPATH**/ ?>