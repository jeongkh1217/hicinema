<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String movieid = request.getParameter("movieid");
	Connection conn=null;
	ResultSet rs=null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		String sql = "select round(avg(starrating),2) as avg from starrating where movieid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, movieid);
		rs=pstmt.executeQuery();
		if(rs.next()) {			
			double avg=rs.getDouble("avg");
			out.print(avg);
			return;
		} else {
			out.print(0);
		}
	} catch(Exception e) {
	}
%>