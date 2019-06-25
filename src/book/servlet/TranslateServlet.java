package book.servlet;

import book.dao.BookDao;
import book.domain.Book;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "translateServlet")
public class TranslateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        BookDao bookDao=new BookDao();
        PrintWriter out=response.getWriter();
        int id=Integer.parseInt(request.getParameter("id"));
        out.println(id);
        Book book=bookDao.find(id);
        out.println(bookDao.find(id).getId());
        request.setAttribute( "book",book);
        request.getRequestDispatcher("/products.jsp").forward(request,response);
    }
}
