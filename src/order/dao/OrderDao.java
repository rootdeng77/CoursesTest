package order.dao;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import order.domain.Order;
import book.utils.JDBCUtils;
public class OrderDao {
    public boolean insert(Order order){
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        try{
            conn=JDBCUtils.getConnection();
            stmt=conn.createStatement();
            String sql = "INSERT INTO orders(id,money,receiverAddress,receiverName,receiverPhone,orderTime)"
                    +" VALUES ('"+order.getId()+"','"+order.getMoney()+"','"+order.getReceiverAddress()+"','"+order.getReceiverName()
                    +"','"+order.getReceiverPhone()+"','"+order.getOrderTime()+"')";
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
    // 查询所有的Order对象
    public ArrayList<Order> findAll() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<Order>();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM orders";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setMoney(rs.getFloat("money"));
                order.setReceiverAddress(rs.getString("receiverAddress"));
                order.setReceiverName(rs.getString("receiverName"));
                order.setReceiverPhone(rs.getString("receiverPhone"));
                order.setOrderTime(rs.getString("orderTime"));
                list.add(order);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    public Order find(String id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Order Order=new Order();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM orders WHERE id=" + id;
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setMoney(rs.getFloat("money"));
                order.setReceiverAddress(rs.getString("receiverAddress"));
                order.setReceiverName(rs.getString("receiverName"));
                order.setReceiverPhone(rs.getString("receiverPhone"));
                order.setOrderTime(rs.getString("orderTime"));
                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
  /*  public Order findName(String OrderName) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        Order Order=new Order();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM Orders WHERE OrderName=" + "'"+OrderName+"'";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setMoney(rs.getFloat("money"));
                order.setReceiverAddress(rs.getString("receiverAddress"));
                order.setReceiverName(rs.getString("receiverName"));
                order.setReceiverPhone(rs.getNString("receiverPhone"));
                order.setOrderTime(rs.getDate("orderTime"));
                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
    public ArrayList<Order> findCategory(String category){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> list = new ArrayList<Order>();
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM orders WHERE category="+"'"+category+"'";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setMoney(rs.getFloat("money"));
                order.setReceiverAddress(rs.getString("receiverAddress"));
                order.setReceiverName(rs.getString("receiverName"));
                order.setReceiverPhone(rs.getNString("receiverPhone"));
                order.setOrderTime(rs.getDate("orderTime"));
                list.add(order);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }  */
    // 删除用户
    public boolean delete(String id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "DELETE FROM orders WHERE id=" + id;
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
    public boolean update(Order order) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "UPDATE orders set money='" + order.getMoney()
                    + "',receiverAddress='" + order.getReceiverAddress() + "',receiverName='"
                    + order.getReceiverName() + "',receiverPhone='" + order.getReceiverPhone()+"',orderTime='"+order.getOrderTime()
                    + "' WHERE id='" + order.getId() +"'";
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
