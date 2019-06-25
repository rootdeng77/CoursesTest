<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script>
        $(function() {
            $('#products').slides({
                preload: true,
                preloadImage: 'img/loading.gif',
                effect: 'slide, fade',
                crossfade: true,
                slideSpeed: 350,
                fadeSpeed: 500,
                generateNextPrev: true,
                generatePagination: false
            });
        });
    </script>
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
                    <li><a href="/AddCartServlet?id=0">购物车</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="header_top">
            <div class="logo">
                <a href="index.html"><img src="images/logo.png" alt="" /></a>
            </div>
            <div class="cart">
                <p>Welcome to our Online Store! <span>Cart:</span>
                <div id="dd" class="wrapper-dropdown-2"> 0 item(s) - $0.00
                    <ul class="dropdown">
                        <li>you have no items in your Shopping cart</li>
                    </ul>
                </div>
                </p>
            </div>
            <script type="text/javascript">
                function DropDown(el) {
                    this.dd = el;
                    this.initEvents();
                }
                DropDown.prototype = {
                    initEvents: function() {
                        var obj = this;

                        obj.dd.on('click', function(event) {
                            $(this).toggleClass('active');
                            event.stopPropagation();
                        });
                    }
                }

                $(function() {

                    var dd = new DropDown($('#dd'));

                    $(document).click(function() {
                        // all dropdowns
                        $('.wrapper-dropdown-2').removeClass('active');
                    });

                });
            </script>
            <div class="clear"></div>
        </div>
        <div class="header_bottom">
            <div class="menu">
                <ul>
                    <li class="active"><a href="index.jsp">主页</a></li>
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
    </div>
    <div class="main">
        <div class="content">
            <div class="content_top">
                <div class="clear"></div>
            </div>
            <div class="section group">
                <div class="cont-desc span_1_of_2">
                    <div class="product-details">
                        <div class="grid images_3_of_2">
                            <div id="container">
                                <div id="products_example">
                                    <div id="products">
                                        <div class="slides_container">
                                            <a href="#" target="_blank"><img src="${book.img}" width="220" height="280" alt=" " /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="desc span_3_of_2">
                            <div class="price">
                                <p>卖家:<span>${book.seller}</span></p>
                            </div>
                            <div class="price">
                                <p>分类:<span>${book.category}</span></p>
                            </div>
                            <div class="price">
                                <p>价格:<span><fmt:formatNumber type="number" value="${book.price}" pattern="#.00"/></span></p>
                            </div>
                            <div class="share-desc">
                                <div class="share">
                                    <p>Share Product :</p>
                                    <ul>
                                        <li><a href="#"><img src="images/facebook.png" alt="" /></a></li>
                                        <li><a href="#"><img src="images/twitter.png" alt="" /></a></li>
                                    </ul>
                                </div>
                                <div class="button"><span><a href="/AddCartServlet?id=${book.id}">添加到购物车</a></span></div>
                                <div class="clear"></div>
                            </div>
                            <div class="wish-list">
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="product_desc">
                        <div id="horizontalTab">
                            <ul class="resp-tabs-list">
                                <li>图书描述</li>
                                <div class="clear"></div>
                            </ul>
                            <div class="resp-tabs-container">
                                <div class="product-desc">
                                    ${book.describle}
                                </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            $('#horizontalTab').easyResponsiveTabs({
                                type: 'default', //Types: default, vertical, accordion
                                width: 'auto', //auto or any width like 600px
                                fit: true // 100% fit in a container
                            });
                        });
                    </script>
                    <div class="content_bottom">
                        <div class="heading">
                            <h3>查看相关图书</h3>
                        </div>
                        <div class="see">
                            <p><a href="/FindCategoryServlet?category=${book.category}">查看相关图书</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>

                </div>
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
    <script type="text/javascript">
        $(document).ready(function() {
            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
</div>
</body>

</html>
