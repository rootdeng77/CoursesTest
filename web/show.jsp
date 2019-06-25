
<%--
  Created by IntelliJ IDEA.
  User: zdy
  Date: 2019/1/8
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/startstop-slider.js"></script>
</head>

<body>
<div class="wrap">
    <div class="header">
        <div class="headertop_desc">
            <div class="account_desc">
                <ul>
                    <li><a href="login.jsp">注册</a></li>
                    <li><a href="login.jsp">登陆</a></li>
                    <li><a href="/AddCartServlet?id=0">购物车</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_top">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" alt="" /></a>
            </div>
            <div class="clear"></div>
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
                    <input type="text" name="bookName" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                    <input type="submit" value="">
                </form>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_slide">
            <div class="header_bottom_left">
                <div class="categories">
                    <ul>
                        <h3>Categories</h3>
                        <li><a href="/FindCategoryServlet?category=IT">文学</a></li>
                        <li><a href="waiting.jsp">外语</a></li>
                        <li><a href="waiting.jsp">计算机</a></li>
                        <li><a href="waiting.jsp">桌面</a></li>
                        <li><a href="waiting.jsp">经营</a></li>
                        <li><a href="waiting.jsp">励志</a></li>
                        <li><a href="waiting.jsp">科技</a></li>
                        <li><a href="waiting.jsp">学术</a></li>
                        <li><a href="waiting.jsp">少儿</a></li>
                        <li><a href="waiting.jsp">原版</a></li>
                        <li><a href="waiting.jsp">考试</a></li>
                        <li><a href="waiting.jsp">百科</a></li>
                    </ul>
                </div>
            </div>
            <div class="header_bottom_right">
                <div class="slider">
                    <div id="slider">
                        <div id="mover">
                            <div id="slide-1" class="slide">
                                <div class="slider-img">
                                    <a href="/TranslateServlet?id=${listbook.get(0).id}">
                                        <img src="${listbook.get(0).img }" width="300px" height="400px"/>
                                    </a>
                                </div>
                                <div class="slider-text">
                                    <h1>Clearance<br><span>SALE</span></h1>
                                    <div class="features_list">
                                        <h4>Get to Know More About Our Memorable Services Lorem Ipsum is simply dummy text</h4>
                                    </div>
                                    <a href="/TranslateServlet?${listbook.get(0).id}" class="button">Shop Now</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="slide">
                                <div class="slider-text">
                                    <h1>Clearance<br><span>SALE</span></h1>
                                    <h2>UPTo 40% OFF</h2>
                                    <div class="features_list">
                                        <h4>Get to Know More About Our Memorable Services</h4>
                                    </div>
                                    <a href="/TranslateServlet?id=${listbook.get(1).id}" class="button">Shop Now</a>
                                </div>
                                <div class="slider-img">
                                    <a href="/TranslateServlet?id=${listbook.get(1).id}">
                                        <img src="${listbook.get(1).img}" width=350 height=450 alt="learn more" />
                                    </a>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="slide">
                                <div class="slider-img">
                                    <a href="/TranslateServlet?id=${listbook.get(2).id}">
                                        <img src="${listbook.get(2).img}" width=350 height=450 alt="learn more" />
                                    </a>
                                </div>
                                <div class="slider-text">
                                    <h1>Clearance<br><span>SALE</span></h1>
                                    <h2>UPTo 10% OFF</h2>
                                    <div class="features_list">
                                        <h4>Get to Know More About Our Memorable Services Lorem Ipsum is simply dummy text</h4>
                                    </div>
                                    <a href="/TranslateServlet?id=${listbook.get(2).id}" class="button">Shop Now</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/">网页模板</a></div>
    <div class="main">
        <div class="content">
            <div class="content_top">
                <div class="heading">
                    <h3>最新商品</h3>
                </div>
                <div class="see">
                    <p><a href="#">查看所有商品</a></p>
                </div>
                <div class="clear"></div>
            </div>
            <div class="section group">
                <c:forEach var="book" items="${listbook}" begin="3" end="6">
                    <div class="grid_1_of_4 images_1_of_4">
                        <a href="/TranslateServlet?id=${book.id}"><img src="${book.img}" width="150" hight="230" alt="" /></a>
                        <h2>${book.category}</h2>
                        <div class="price-details">
                            <div class="price-number">
                                <p><span class="rupees">${book.price}</span></p>
                            </div>
                            <div class="add-cart">
                                <h4><a href="/TranslateServlet?id=${book.id}">加入购物车</a></h4>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="content_bottom">
                <div class="heading">
                    <h3>Feature Products</h3>
                </div>
                <div class="see">
                    <p><a href="#">See all Products</a></p>
                </div>
                <div class="clear"></div>
            </div>
            <div class="section group">
                <c:forEach var="book" items="${listbook}" begin="7" end="11">
                    <div class="grid_1_of_4 images_1_of_4">
                        <a href="/TranslateServlet?id=${book.id}"><img src="${book.img}"  width="150" hight="230" alt="" /></a>
                        <h2>${book.category}</h2>
                        <div class="price-details">
                            <div class="price-number">
                                <p><span class="rupees">${book.price}</span></p>
                            </div>
                            <div class="add-cart">
                                <h4><a href="/TranslateServlet?id=${book.id}">加入购物车</a></h4>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
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
</body>
</html>