package book.servlet;

import book.dao.BookDao;
import book.domain.Book;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "FindCategoryServlet")
public class FindCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;utf-8");
        PrintWriter out=response.getWriter();
        String category=request.getParameter("category");
        out.println(category);
        List<Book> listbook=new BookDao().findCategory(category);
        if(listbook.isEmpty()) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }else {
            request.setAttribute("listbook",listbook);
            request.getRequestDispatcher("/classify.jsp").forward(request,response);
        }
    }
}
