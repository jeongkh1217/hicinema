<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String uId=request.getParameter("userId");
	Connection conn=null;
	ResultSet rs=null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		String sql = "SELECT COUNT(*) AS cnt FROM member WHERE id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, uId);
		rs=pstmt.executeQuery();
		if(rs.next()) {			
			int cnt=rs.getInt("cnt");
			out.print(cnt);
			return;
		} else {
			out.print(0);
		}
	} catch(Exception e) {
	}
%>

