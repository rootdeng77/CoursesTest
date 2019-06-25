<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园市场购物车</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
    <script>
        //当商品数量发生变化时触发该方法
        function changeProductNum(count, totalCount, id) {
            count = parseInt(count);
            totalCount = parseInt(totalCount);
            //如果数量为0，判断是否要删除商品
            if (count == 0) {
                var flag = window.confirm("确认删除商品吗?");

                if (!flag) {
                    count = 1;
                }
            }
            location.href = "/ChangeCartServlet?id="
                + id + "&count=" + count;
        }
        //删除购物车中的商品
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
<div id="divpagecontent">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td>
                <div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="/index.jsp">首页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
                </div>
                <table cellspacing="0" class="infocontent">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0">
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
                                        <!-- 循环输出商品信息 -->
                                        <c:set var="total" value="0" />
                                        <c:forEach items="${cart}" var="entry" varStatus="vs">
                                            <table width="100%" border="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%">${vs.count}</td>
                                                    <td width="30%">${entry.key.bookName}</td>
                                                    <td width="10%">$<fmt:formatNumber type="number" value="${entry.key.price}" pattern="#.00"/></td>
                                                        <!-- 删除商品 -->
                                                    <td width="10%">
                                                        <!-- 删除商品 -->
                                                        <a href="/ChangeCartServlet?id=${entry.key.id}&count=0"
                                                           style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <c:set value="${total+entry.key.price}" var="total" />
                                        </c:forEach>

                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td style="text-align:right; padding-right:40px;">
                                                    <font style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;<fmt:formatNumber type="number" value="${total}" pattern="#.00"/>元</font>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="text-align:right; margin-top:10px">
                                            <!--继续购物 -->
                                            <a href="/index.jsp">
                                                <img src="/client/images/gwc_jx.gif" border="0" />
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <!--结账 -->
                                            <a href="/orders.jsp">
                                                <img src="/client/images/gwc_buy.gif" border="0" />
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
</body>
</html>