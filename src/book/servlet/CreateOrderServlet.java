package book.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import order.dao.OrderDao;
import order.domain.Order;
import order.servlet.RefreshServlet;
import user.domain.User;

@WebServlet(name = "CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        User user=(User) session.getAttribute("user");
        OrderDao dao=new OrderDao();
        Order order=new Order();
        if(user==null){
            response.sendRedirect("/login.jsp");
            return;
        }
        PrintWriter out=response.getWriter();
        order.setId(getOrderIdByTime()+request.getParameter("receiverPhone"));
        order.setReceiverName(request.getParameter("receiverName"));
        order.setReceiverAddress(request.getParameter("receiverAddress"));
        String money=request.getParameter("money");
        order.setMoney(Float.parseFloat(money));
        order.setReceiverPhone(request.getParameter("receiverPhone"));
        SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");
        order.setOrderTime(sdf.format(new Date()));
        out.println(order.getOrderTime());
        out.println(order.getReceiverName());
        out.println(order.getId());
        out.println(order.getReceiverAddress());
        out.println(order.getMoney()+1);
        out.println(order.getOrderTime());
        if(dao.insert(order)){
            response.sendRedirect("/RefreshServlet");
        }else out.println("false");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    public static String getOrderIdByTime() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        String result="";
        Random random=new Random();
        for(int i=0;i<3;i++){
            result+=random.nextInt(10);
        }
        return newDate+result;
    }
}
