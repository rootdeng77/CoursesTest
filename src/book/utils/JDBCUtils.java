package book.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.lang.ClassNotFoundException;
public class JDBCUtils {
    public static Connection getConnection()  throws SQLException{

        Connection conn=null;
        try {
            //  注册数据库的驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 通过DriverManager获取数据库连接
            String url = "jdbc:mysql://localhost:3306/jdbc";
            String username = "root";
            String password = "root";
            conn = DriverManager.getConnection (url, username,
                    password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void release(ResultSet rs, Statement stmt, Connection conn) {
        // 回收数据库资源
        if(rs!=null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            rs = null;
        }
        if(stmt!=null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stmt = null;
        }
        if(conn!=null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }
    public static void main(String[] args) throws SQLException {

        Statement stmt = null;
        ResultSet rs = null;
        Connection conn = getConnection();
        // 3.通过Connection对象获取Statement对象
        stmt = conn.createStatement();
        // 4.使用Statement执行SQL语句。
        String sql = "select * from book";
        rs = stmt.executeQuery(sql);
        // 5. 操作ResultSet结果集
        System.out.println("书名     |    作者   | 出版社 | ISBN  | 图书类别  | 单价");
        while (rs.next()) {
            int id = rs.getInt("id"); // 通过列名获取指定字段的值
            String bookName = rs.getString("bookName");
            String author = rs.getString("author");
            String press = rs.getString("press");
            String isbn = rs.getString("isbn");
            String category=rs.getString("category");
            float price=rs.getFloat("price");
            System.out.println(id + " | " + bookName + " | " + author + " | " + press
                    + " | " +isbn + " | " + category + " | "+price);
        }
        release(rs,stmt,conn);
    }
}
