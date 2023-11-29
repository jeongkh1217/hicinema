<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id=request.getParameter("id");
	String itemid = request.getParameter("itemid");
	Connection conn=null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		if(con==null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
		stmt=con.createStatement();
		String command=String.format("delete from cart where id='"+id+"' and purchased = 'n' and itemid='"+itemid+"';");
		int rowNum = stmt.executeUpdate(command);		
		
} finally {
	try {
		stmt.close();
	} catch(Exception ignored) {
	} 
	try {
		conn.close();
	} catch (Exception ignored) {
	}	}
	
	String referrer = request.getHeader("referer");
	response.sendRedirect(referrer);
	%>