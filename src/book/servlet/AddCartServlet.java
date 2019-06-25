package book.servlet;

import book.dao.BookDao;
import book.domain.Book;
import com.sun.org.apache.xpath.internal.FoundIndex;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddCartServlet")
public class AddCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;utf-8");
        PrintWriter out=response.getWriter();
        int id=Integer.parseInt(request.getParameter("id"));
        out.println(id);
        BookDao dao=new BookDao();
        try{

            HttpSession session = request.getSession();
            Map<Book, Integer> cart = (Map<Book, Integer>)session.getAttribute("cart");
            //3.3如果购物车为null,说明没有商品存储在购物车中，创建出购物车
            if (cart == null) {
                cart = new HashMap<Book, Integer>();
            }
            if(id!=0) {
                Book book = dao.find(id);
                //3.4向购物车中添加商品
                Integer count = cart.put(book, 1);
                //3.5如果商品数量不为空，则商品数量+1，否则添加新的商品信息
                if (count != null) {
                    cart.put(book, count + 1);
                }
            }
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "carts.jsp");
            return;
        }catch (FoundIndex e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
