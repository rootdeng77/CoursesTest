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

@WebServlet(name = "InsertBookServlet")
public class InsertBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        Book book=new Book();
        BookDao dao=new BookDao();
        book.setBookName(request.getParameter("bookName"));
        book.setSeller(request.getParameter("seller"));
        book.setCategory(request.getParameter("category"));
        book.setPrice(Float.parseFloat(request.getParameter("price")));
        book.setImg("bookcover/"+request.getParameter("img"));
        book.setDescrible(request.getParameter("userMsg"));
        book.setId(dao.findAll().size()+1);
        if(dao.insert(book)){
            out.println("操作成功，5秒后跳转到首页");
            response.setHeader("Refresh","5;URL=/index.jsp");
        }
    }
}
