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
import java.util.Iterator;
import java.util.Map;
import book.domain.Book;

@WebServlet(name = "ChangeCartServlet")
public class ChangeCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;utf-8");
        int id =Integer.parseInt(request.getParameter("id"));
        // 2.得到要修改的数量
        int count = Integer.parseInt(request.getParameter("count"));
        // 3.从session中获取购物车.
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession();
        BookDao dao=new BookDao();
        Map<Book, Integer> cart = (Map<Book, Integer>) session.getAttribute("cart");
        Book book=dao.find(id);
        out.print(cart.size());
        out.print(book.getBookName());
        out.print(count);
        if (count != 0) {
            cart.put(book, count);
        } else {
            Iterator<Map.Entry<Book,Integer>> it=cart.entrySet().iterator();
            while(it.hasNext()){
                Map.Entry<Book,Integer> entry=it.next();
                int ids=entry.getKey().getId();
                if(ids==id){
                    it.remove();
                }
            }
        }
        out.print(cart.size());
        response.sendRedirect("/carts.jsp");
        return;

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
