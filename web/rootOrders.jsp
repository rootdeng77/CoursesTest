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
    <script type="text/javascript">
        function cart_del() {
            var msg = "您确定要删除该商品吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body class="main">
<div >
    <div >
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td><div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="/index.jsp">首页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                    <a href="/AddCartServlet">&nbsp;购物车</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
                </div>
                    <form id="orderForm" action="" method="post">
                        <table cellspacing="0" class="infocontent">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0">
                                        <tr>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellspacing="1" class="carttable">
                                                    <tr>
                                                        <td width="22%">订单编号</td>
                                                        <td width="11%">总价格</td>
                                                        <td width="22%">收获地址</td>
                                                        <td width="12%">收货人姓名</td>
                                                        <td width="10%">联系方式</td>
                                                        <td width="15%">交易时间</td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <c:set value="0" var="totalPrice"/>
                                                <c:forEach items="${listorder}" var="entry" varStatus="vs">
                                                    <table width="100%" border="0" cellspacing="0">
                                                        <tr>
                                                            <td width="20%">${entry.id}</td>
                                                            <td width="10%"><fmt:formatNumber type="number" value="${entry.money}" pattern="#.00"/></td>
                                                            <td width="20%">${entry.receiverAddress}</td>
                                                            <td width="10%">${entry.receiverName}</td>
                                                            <td width="10%">${entry.receiverPhone}</td>
                                                            <td width="10%">${entry.orderTime}</td>
                                                            <!-- 删除商品 -->
                                                            <td width="10%">
                                                                <!-- 删除商品 -->
                                                                <a href="/DeleteOrderServlet?id=${entry.id}&count=0"
                                                                   style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
                                                            </td>
                                                            <td width="10%">
                                                                <!-- 删除商品 -->
                                                                <a href="/findOrderServlet?id=${entry.id}&count=0"
                                                                   style="color:#FF0000; font-weight:bold ">edit</a>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </c:forEach>

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