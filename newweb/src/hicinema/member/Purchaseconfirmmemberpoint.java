package hicinema.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Purchaseconfirmmemberpoint {
    Connection conn = null;
    Statement stmt = null;

    public void con() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");
        stmt = conn.createStatement();
    }

    public void discon() {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
        }
    }

    public int pointselect(String id) {
        int point = 0;
        try {
            con();
            ResultSet rs = stmt.executeQuery("SELECT point FROM member WHERE id='" + id + "';");

            if (rs.next()) {
                point = rs.getInt("point");
            }
        } catch (Exception e) {
        } finally {
            discon();
        }

        return point;
    }
}	
