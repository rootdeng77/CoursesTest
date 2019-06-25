<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园市场购物车</title>
    <title>电子书城</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css" type="text/css" />
    <script type="text/javascript" src="client/js/order.js"></script>
</head>
<body class="main">
<div >
    <div >
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td><div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="/index.jsp">首页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                    <a href="/AddCartServlet?id=0">&nbsp;购物车</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
                </div>
                    <form id="orderForm" action="/CreateOrderServlet" method="post">
                        <table cellspacing="0" class="infocontent">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0">
                                        <tr>
                                            <td><img src="client/images/buy2.gif" width="635" height="38" />
                                                <p>你好，${user.userName}！欢迎您来到书城结算中心</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellspacing="1" class="carttable">
                                                    <tr>
                                                        <td width="10%">序号</td>
                                                        <td width="30%">商品名称</td>
                                                        <td width="10%">价格</td>
                                                        <td width="10%">取消</td>
                                                    </tr>
                                                </table>
                                                <c:set value="0" var="totalPrice"/>
                                                <c:forEach items="${cart}" var="entry" varStatus="vs">
                                                    <table width="100%" border="0" cellspacing="0">
                                                        <tr>
                                                            <td width="10%">${vs.count}</td>
                                                            <td width="30%">${entry.key.bookName}</td>
                                                            <td width="10%"><fmt:formatNumber type="number" value="${entry.key.price}" pattern="#.00"/></td>
                                                            <!-- 删除商品 -->
                                                            <td width="10%">
                                                                <!-- 删除商品 -->
                                                                <a href="/ChangeCartServlet?id=${entry.key.id}&count=0"
                                                                   style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <c:set var="totalPrice" value="${totalPrice+entry.key.price}"/>
                                                </c:forEach>

                                                <form action="/CreateOrderServlet">
                                                    <table cellspacing="1" class="carttable">
                                                        <tr>
                                                            <td style="text-align:right; padding-right:40px;"><font
                                                                    style="color:#FF0000">合计：&nbsp;&nbsp;<fmt:formatNumber type="number" value="${totalPrice}" pattern="#.00"/>元</font>
                                                                <input type="hidden" name="money" value="<fmt:formatNumber type="number" value="${totalPrice}" pattern="#.00"/>">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        收货地址：<input id="receiverAddress" name="receiverAddress" type="text" value=""style="width:350px" onkeyup="checkReceiverAddress();" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <span id="receiverAddressMsg"></span>
                                                        <br/>
                                                        收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName" name="receiverName" type="text"  style="width:150px" onkeyup="checkReceiverName();" />
                                                        <span id="receiverNameMsg"></span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <br/>
                                                        联系方式：<input type="text" id="receiverPhone" name="receiverPhone"  style="width:150px" onkeyup="checkReceiverPhone();" />
                                                        <span id="receiverPhoneMsg"></span>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </p>
                                                </form>
                                                <hr />
                                                <p style="text-align:right">
                                                    <img src="client/images/gif53_029.gif" width="204" height="51" border="0" onclick="checkOnSubmit();"/>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>