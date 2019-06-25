package order.servlet;

import book.dao.BookDao;
import book.domain.Book;
import order.dao.OrderDao;
import order.domain.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "findOrderServlet")
public class findOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String id=request.getParameter("id");
        Order order=new OrderDao().find(id);
        request.setAttribute("order",order);
        request.getRequestDispatcher("/Edit.jsp").forward(request,response);
    }
}
