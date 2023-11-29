<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	int postno = Integer.parseInt(request.getParameter("postno"));
	Connection conn=null;
	ResultSet rs=null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		String sql = "SELECT COUNT(*) AS cnt FROM communitylike WHERE postno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, postno);
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

