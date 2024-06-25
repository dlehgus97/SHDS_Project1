<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login - admin</title>
<link rel="stylesheet" href="../resources/admin/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/admin/assets/css/metisMenu.css">
<link rel="stylesheet" href="../resources/admin/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/admin/assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="../resources/admin/assets/css/typography.css">
<link rel="stylesheet" href="../resources/admin/assets/css/default-css.css">
<link rel="stylesheet" href="../resources/admin/assets/css/styles.css">
<link rel="stylesheet" href="../resources/admin/assets/css/responsive.css">
<!-- modernizr css -->
<script src="../resources/admin/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area login-s2">
        <div class="container">
            <div class="login-box ptb--100">
                <form action="/adminLogin" method="post">
                    <div class="login-form-head">
                        <h4>Admin Log In</h4>
                        <p>Starting NEXTUS Admin</p>
                    </div>
                    <div class="login-form-body" style="margin-top:-50px;">
                        <div class="form-gp">
                            <label for="exampleInputEmail1">admin ID</label>
                            <input type="text" name="adminID" id="adminID" autocomplete="off">
                            <i class="fa fa-cog"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">admin Password</label>
                            <input type="password" name="adminPW" id="adminPW" autocomplete="off">
                            <i class="ti-lock"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="row mb-4 rmber-area">
                            <div class="col-6"></div>
                        </div>
                        <div class="submit-btn-area">
                            <button id="form_submit" type="submit">Submit <i class="ti-arrow-right"></i></button>
                        </div>
                        <div class="form-footer text-center mt-5"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->

<script src="../resources/admin/assets/js/vendor/jquery-2.2.4.min.js"></script>
<!-- bootstrap 4 js -->
<script src="../resources/admin/assets/js/popper.min.js"></script>
<script src="../resources/admin/assets/js/bootstrap.min.js"></script>
<script src="../resources/admin/assets/js/owl.carousel.min.js"></script>
<script src="../resources/admin/assets/js/metisMenu.min.js"></script>
<script src="../resources/admin/assets/js/jquery.slimscroll.min.js"></script>
<script src="../resources/admin/assets/js/jquery.slicknav.min.js"></script>

<!-- others plugins -->
<script src="../resources/admin/assets/js/plugins.js"></script>
<script src="../resources/admin/assets/js/scripts.js"></script>
</body>

</html>