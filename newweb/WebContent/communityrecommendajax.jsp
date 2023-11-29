<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.IOException"%>
<%
    int recommend = Integer.parseInt(request.getParameter("recommend"));
    int postno = Integer.parseInt(request.getParameter("postno"));
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");
        String sql = "Update community set recommend=? where postno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, recommend);
        pstmt.setInt(2, postno);
        
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.print(1); 
        } else {
            out.print(0); 
        }
    } catch (Exception e) {
        out.print(0); 
    } finally {
        
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            
        }
    }
%>