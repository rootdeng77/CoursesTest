
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑图书</title>
</head>
<body>
<form name="Form1" action="/EditOrderServlet?id=${order.id}" method="post" accept-charset="UTF-8" >
    &nbsp;

    <table cellSpacing="1" cellPadding="5" width="100%" align="center"
           bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
                <strong><STRONG>编辑订单</STRONG> </strong>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">订单金额：</td>
            <td  bgColor="#ffffff"><input type="text" name="money" value="${order.money}"/></td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">收货地址：</td>
            <td  bgColor="#ffffff"><input type="text" name="address" value="${order.receiverAddress}"/></td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">收货人姓名：</td>
            <td  bgColor="#ffffff"><input type="text" name="name" value="${order.receiverName}"/></td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">联系方式：</td>
            <td  bgColor="#ffffff"><input type="text" name="connect" value="${order.receiverPhone}"/></td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">交易时间：</td>
            <td  bgColor="#ffffff"><input type="text" name="time" value="${order.orderTime}"/></td>
        </tr>
        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
                <input type="submit" value="确定""/>
                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <input type="reset" value="重置" />
                <FONT face="宋体">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
