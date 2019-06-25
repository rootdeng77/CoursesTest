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
import book.dao.BookDao;
@WebServlet(name = "ListBooksServlet")
public class ListBooksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bookDao=new BookDao();
        PrintWriter out=response.getWriter();
        try{
            List<Book> listbook=new BookDao().findAll();
            request.setAttribute("listbook",listbook);
            request.getRequestDispatcher("/show.jsp").forward(request,response);
            return ;
        }catch(IOException e){
            e.printStackTrace();
            return ;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
