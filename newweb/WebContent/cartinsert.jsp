<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String itemid = request.getParameter("itemid");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	Connection conn=null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection
				("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		if (conn==null)
			throw new Exception("데이터베이스에 연결할 수 없습니다");
		stmt = conn.createStatement();		
		String sql = "Insert into cart(id, itemid, quantity) values ('"+id+"','"+itemid+"','"+quantity+"');";
		int rowNum = stmt.executeUpdate(sql);
		if(rowNum <1) 			
			throw new Exception("등록실패");
	} finally {
		try {
			stmt.close();
		} catch(Exception ignored) {
	} try {
		conn.close();
	} catch (Exception ignored) {
		
	}
	}	
	String referrer = request.getHeader("referer");
	response.sendRedirect(referrer);
%>