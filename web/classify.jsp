<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Preview</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="css/global.css">
    <script src="js/slides.min.jquery.js"></script>
</head>

<body>
<div class="wrap">
    <div class="header">
        <div class="headertop_desc">
            <div class="call">
                <p><span>欢迎来到校园二手市场</span></p>
            </div>
            <div class="account_desc">
                <ul>
                    <li><a href="login.jsp">注册</a></li>
                    <li><a href="login.jsp">登陆</a></li>
                    <li><a href="/AddCartServlet">购物车</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_top">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" alt="" /></a>
            </div>
        </div>
        <div class="header_bottom">
            <div class="menu">
                <ul>
                    <li class="active"><a href="index.html">主页</a></li>
                    <li><a href="insert.jsp">上传</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="search_box">
                <form action="/FindByNameServlet">
                    <input type="text" name="bookName" value="请输入书名"/>
                </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="main">
        <div class="content">
            <c:forEach var="book" items="${listbook}">
                <div class="image group">
                    <div class="grid images_3_of_1">
                        <a href="/TranslateServlet?id=${book.id}"><img src="${book.img}" width="215" height="271" alt="" /></a>
                    </div>
                    <div class="grid news_desc">
                        <h3>${book.seller}</h3>
                        <h4><span><a href="#">${book.category}</a></span></h4>
                        <p>${book.describle}</p><br>
                        <div class="price">
                            <p>Price: <span>${book.price}</span></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="content-pagenation">
                <li><a href="#">Frist</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><span>....</span></li>
                <li><a href="#">Last</a></li>
                <div class="clear"> </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <div class="section group">
            </div>
        </div>
        <div class="copy_right">
            <p>星际联邦-星际舰队企业号-2019-1-7</p>
        </div>
    </div>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
</div>
</body>

</html>