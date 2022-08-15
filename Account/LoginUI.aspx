﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginUI.aspx.cs" Inherits="Account_LoginUI" %>

<html lang="en">
<!-- Mirrored from creativeitem.com/demo/ekattor-metronic/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Oct 2017 15:32:51 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8" />
    <title>Login | MASTERMIND ENGLISH MEDIUM SCHOOL </title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--begin::Web font -->
    <script src="../../../ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: { "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"] },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <!--end::Web font -->
    <!--begin::Base Styles -->
    <link rel="shortcut icon" href="metronic/login_page/img/favicon.png">
    <link href="metronic/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="metronic/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Base Styles -->
</head>
<!-- end::Head -->
<!-- end::Body -->
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-grid--tablet-and-mobile m-grid--hor-tablet-and-mobile m-login m-login--1 m-login--singin"
            id="m_login">
            <div class="m-grid__item m-grid__item--order-tablet-and-mobile-2 m-login__aside">
                <div class="m-stack m-stack--hor m-stack--desktop">
                    <div class="m-stack__item m-stack__item--fluid">
                        <div class="m-login__wrapper">
                            <div class="m-login__logo">
                                <a href="#">
                                    <img alt="" src="assets/images/logo.png" width="150px">
                                </a>
                            </div>
                            <div class="m-login__signin">
                                <div class="m-login__head">
                                    <h3 class="m-login__title">
                                        MASTERMIND ENGLISH MEDIUM SCHOOL
                                    </h3>
                                </div>
                                <form method="post" role="form" id="" class="m-login__form m-form" action="http://creativeitem.com/demo/ekattor-metronic/index.php?login/validate_login">
                                <div class="form-group m-form__group">
                                    <input class="form-control m-input" type="text" placeholder="Email" name="email"
                                        autocomplete="off">
                                </div>
                                <div class="form-group m-form__group">
                                    <input class="form-control m-input m-login__form-input--last" type="password" placeholder="Password"
                                        name="password">
                                </div>
                                <div class="row m-login__form-sub">
                                    <div class="col m--align-right">
                                        <a href="javascript:;" id="m_login_forget_password" class="m-link">Forgot Password ?
                                        </a>
                                    </div>
                                </div>
                                <div class="m-login__form-action">
                                    <button id="m_login_signin_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air">
                                        Sign In
                                    </button>
                                </div>
                                </form>
                            </div>
                            <div class="m-login__forget-password">
                                <div class="m-login__head">
                                    <h3 class="m-login__title">
                                        Forgot Password ?
                                    </h3>
                                    <div class="m-login__desc">
                                        Enter Your Email To Reset Password
                                    </div>
                                </div>
                                <form method="post" role="form" id="form_login" class="m-login__form m-form" action="http://creativeitem.com/demo/ekattor-metronic/index.php?login/reset_password">
                                <div class="form-group m-form__group">
                                    <input class="form-control m-input" type="text" placeholder="Email" name="email"
                                        id="m_email" autocomplete="off">
                                </div>
                                <div class="m-login__form-action">
                                    <button id="m_login_forget_password_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air">
                                        Request
                                    </button>
                                    <button id="m_login_forget_password_cancel" class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom">
                                        Cancel
                                    </button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-grid__item--order-tablet-and-mobile-1	m-login__content"
                style="background-image: url(assets/login_page/img/bg.jpg)">
                <div class="m-grid__item m-grid__item--middle">
                </div>
            </div>
        </div>
    </div>
    <!-- end:: Page -->
    <!--begin::Base Scripts -->
    <script src="metronic/vendors/base/vendors.bundle.js" type="text/javascript"></script>
    <script src="metronic/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
    <!--end::Base Scripts -->
    <!--begin::Page Snippets -->
    <script src="metronic/snippets/pages/user/login.js" type="text/javascript"></script>
    <!--end::Page Snippets -->
    <
    <script>
        jQuery(document).ready(function () {
        });
    </script>
</body>
<!-- end::Body -->
<!-- Mirrored from creativeitem.com/demo/ekattor-metronic/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Oct 2017 15:32:57 GMT -->
</html> 