package book.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import user.domain.User;
import java.sql.SQLException;
import book.utils.JDBCUtils;
public class UserDao {
    public boolean insert(User user){
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        try{
            conn=JDBCUtils.getConnection();
            stmt=conn.createStatement();
            String sql = "INSERT INTO user(userName,userPass) "+
                    "VALUES('" + user.getUserName() + "','"
                    + user.getUserPass() + "')";
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
    public User find(String userName) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = JDBCUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM user WHERE userName=" + "userName";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                User user=new User();
                user.setUserName(rs.getString("userName"));
                user.setUserPass(rs.getString("userPass"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, stmt, conn);
        }
        return null;
    }
}
