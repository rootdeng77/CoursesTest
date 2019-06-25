package order.servlet;

import order.dao.OrderDao;
import order.domain.Order;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditOrderServlet")
public class EditOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        OrderDao dao=new OrderDao();
        Order order=new Order();
        order.setId(id);
        order.setMoney(Float.parseFloat(request.getParameter("money")));
        order.setReceiverAddress(request.getParameter("address"));
        order.setReceiverName(request.getParameter("name"));
        order.setReceiverPhone(request.getParameter("connect"));
        order.setOrderTime(request.getParameter("time"));
        if(dao.update(order)){
            request.getRequestDispatcher("/ListOrderSerlet");
        }else out.println("false");
    }
}
