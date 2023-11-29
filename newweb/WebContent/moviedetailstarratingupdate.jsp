<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String sncno = request.getParameter("sncno");
	String comment = request.getParameter("comment");
	Connection conn=null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		if(con==null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
		stmt=con.createStatement();
		String command=String.format("update starrating set comment='"+ comment + "'where sncno=" + sncno +" and id='" + id + "';");
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