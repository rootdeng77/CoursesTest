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

@WebServlet(name = "FindByNameServlet")
public class FindByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;utf-8");
        PrintWriter out=response.getWriter();
        String bookName=request.getParameter("bookName");
        out.println(bookName);
        Book book=new BookDao().findName(bookName);
       if(book==null) {
           request.getRequestDispatcher("/error.jsp").forward(request, response);
       }else {
           request.setAttribute("book",book);
           request.getRequestDispatcher("/products.jsp").forward(request,response);
       }
    }
}
