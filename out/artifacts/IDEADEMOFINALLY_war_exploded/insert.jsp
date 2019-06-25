<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
</head>

<body>
<div class="wrap">
    <div class="header">
        <div class="headertop_desc">
            <div class="call">
                <p><span>欢迎来到校园二手图书商城</span>
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

        <div class="main">
            <div class="content">
                <div class="section group">
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>Contact Us</h2>
                            <form method="post" action="/InsertBookServlet">
                                <div>
                                    <span><label>书籍名称</label></span>
                                    <span><input name="bookName" type="text" class="textbox"></span>
                                </div>
                                <div>
                                    <span><label>卖家</label></span>
                                    <span><input name="seller" type="text" class="textbox"></span>
                                </div>
                                <div>
                                    <span><label>种类</label></span>
                                    <span><input name="category" type="text" class="textbox"></span>
                                </div>
                                <div>
                                    <span><label>价格</label></span>
                                    <span><input name="price" type="text" class="textbox"></span>
                                </div>
                                <div>
                                    <span><label>图片</label></span>
                                    <span><input name="img" type="file" class="textbox"></span>
                                </div>
                                <div>
                                    <span><label>简介</label></span>
                                    <span><textarea name="userMsg"> </textarea></span>
                                </div>
                                <div>
                                    <span><input type="submit" value="Submit" class="myButton"></span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col span_1_of_3">
                        <div class="contact_info">
                            <h3>Find Us Here</h3>
                            <div class="map">
                                <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
                            </div>
                        </div>
                        <div class="company_address">
                            <h3>Company Information :</h3>
                            <p>500 Lorem Ipsum Dolor Sit,</p>
                            <p>22-56-2-9 Sit Amet, Lorem,</p>
                            <p>USA</p>
                            <p>Phone:(00) 222 666 444</p>
                            <p>Fax: (000) 000 00 00 0</p>
                            <p>Email: <span>info@mycompany.com</span></p>
                            <p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">

    <div class="copy_right">
        <p>星际联邦-星际舰队企业号-2019-1-7</p>
    </div>
</div>
<a href="#" id="toTop"><span id="toTopHover"> </span></a>
</body>
</html>
