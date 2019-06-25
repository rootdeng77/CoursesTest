<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Wopop</title>
    <link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/jquery.ui.all.css">

</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
    <div class="login_logo"></div>
    <form action="/UserServlet">
        <div class="login_boder">
            <div class="login_padding" id="login_model">
                <h2>用户名</h2>
                <label>
                    <input type="text" name="username" id="username" class="txt_input txt_input2" >
                </label>
                <h2>密码</h2>
                <label>
                    <input type="password" name="password" id="userpwd" class="txt_input"  value="******">
                </label>

                <p class="forgot"><a id="iforget" href="javascript:void(0);">Forgot your password?</a></p>
                <div class="rem_sub">
                    <div class="rem_sub_l">
                        <input type="checkbox" name="checkbox" id="save_me">
                        <label >Remember me</label>
                    </div>
                    <label>
                        <input type="submit" class="sub_button" name="button" id="button" value="SIGN-IN" style="opacity: 0.7;">
                    </label>
                </div>
            </div>
            <!--login_padding  Sign up end-->
        </div><!--login_boder end-->
    </form>
</div><!--login_m end-->
<br> <br>
<p align="center">登陆即注册</p>
</body></html>