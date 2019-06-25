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
import java.util.List;

@WebServlet(name = "ListOrderServlet")
public class ListOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        try{
            List<Order> listorder=new OrderDao().findAll();
            request.setAttribute("listorder",listorder);
            request.getRequestDispatcher("/rootOrders.jsp").forward(request,response);
            return ;
        }catch(Exception e){
            e.printStackTrace();
            return ;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
