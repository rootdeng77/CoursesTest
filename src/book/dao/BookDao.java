package book.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import book.domain.Book;
import java.sql.SQLException;
import book.utils.JDBCUtils;
public class BookDao {
    public boolean insert(Book book){
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        try{
            conn=JDBCUtils.getConnection();
            stmt=conn.createStatement();
            String sql = "INSERT INTO books(id,bookName,seller,category,describle,img,price) "+
                    "VALUES ('" + book.getId() + "','" + book.getBookName() + "','" + book.getSeller()
                    + "','" + book.getCategory() + "','" + book.getDescrible() + "','" + book.getImg()
                    + "','" + book.getPrice() + "')";
            int num = stmt.executeUpdate(sql);
            if (num > 0) {
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JDBCUtils.release(rs,stmt,conn);
        }
        return false;
    }
    // 查询所有的Book对象
    public ArrayList<Book> findAll() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Book> list = new ArrayList<Book>();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM books";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Book Book = new Book();
                Book.setId(rs.getInt("id"));
                Book.setBookName(rs.getString("bookName"));
                Book.setSeller(rs.getString("seller"));
                Book.setCategory(rs.getString("category"));
                Book.setDescrible(rs.getString("describle"));
                Book.setImg(rs.getString("img"));
                Book.setPrice(rs.getFloat("price"));
                list.add(Book);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    public Book find(int id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Book book=new Book();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM books WHERE id=" + id;
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Book Book = new Book();
                Book.setId(rs.getInt("id"));
                Book.setBookName(rs.getString("bookName"));
                Book.setSeller(rs.getString("seller"));
                Book.setCategory(rs.getString("category"));
                Book.setDescrible(rs.getString("describle"));
                Book.setImg(rs.getString("img"));
                Book.setPrice(rs.getFloat("price"));
                return Book;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    public Book findName(String bookName) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Book book=new Book();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM books WHERE bookName=" + "'"+bookName+"'";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Book Book = new Book();
                Book.setId(rs.getInt("id"));
                Book.setBookName(rs.getString("bookName"));
                Book.setSeller(rs.getString("seller"));
                Book.setCategory(rs.getString("category"));
                Book.setDescrible(rs.getString("describle"));
                Book.setImg(rs.getString("img"));
                Book.setPrice(rs.getFloat("price"));
                return Book;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    public ArrayList<Book> findCategory(String category){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Book> list = new ArrayList<Book>();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM books WHERE category="+"'"+category+"'";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Book Book = new Book();
                Book.setId(rs.getInt("id"));
                Book.setBookName(rs.getString("bookName"));
                Book.setSeller(rs.getString("seller"));
                Book.setCategory(rs.getString("category"));
                Book.setDescrible(rs.getString("describle"));
                Book.setImg(rs.getString("img"));
                Book.setPrice(rs.getFloat("price"));
                list.add(Book);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    // 删除用户
    public boolean delete(int id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "DELETE FROM books WHERE id=" + id;
            int num = stmt.executeUpdate(sql);
            if (num > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return false;
    }
    // 修改用户
    public boolean update(Book Book) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "UPDATE books set bookName='" + Book.getBookName()
                    + "',seller='" + Book.getSeller() + "',category='"
                    + Book.getCategory() + "',describle='" + Book.getDescrible()+",img="+Book.getImg()+
                    ",price="+Book.getPrice() + "' WHERE id=" + Book.getId();
            int num = stmt.executeUpdate(sql);
            if (num > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return false;
    }
}
