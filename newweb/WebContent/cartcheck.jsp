<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id=request.getParameter("id");
	String itemid = request.getParameter("itemid");
	Connection conn=null;
	ResultSet rs=null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		String sql = "SELECT COUNT(*) AS cnt FROM cart WHERE id =? and itemid = ? and purchased = 'n'";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2,itemid);
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