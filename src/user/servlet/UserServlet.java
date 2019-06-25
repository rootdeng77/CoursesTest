package user.servlet;

import book.dao.UserDao;
import user.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        out.println(username);
        if (username == null)
            username = "";
        if (password == null)
            password = "";
        if ("".equals(username) || "".equals(password)) {
            out.println("<script>alert('用户名或密码为空');</script>");
        } else if (username.equals("abc") && password.equals("123"))
            response.sendRedirect("/ListOrderServlet");
        else {
            User user=new User();
            user.setUserName("username");
            user.setUserPass("password");
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/orders.jsp");
        }
    }
}
