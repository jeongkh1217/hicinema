<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	int postno = Integer.parseInt(request.getParameter("postno"));
	Connection conn=null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		if(con==null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
		stmt=con.createStatement();
		String command=String.format("delete from communitylike where id='"+id+"' and postno='"+postno+"';");
		int rowNum = stmt.executeUpdate(command);	

        if (rowNum > 0) {
            out.print(1); 
        } else {
            out.print(0); 
        }
		
} finally {
	try {
		stmt.close();
	} catch(Exception ignored) {
	} 
	try {
		conn.close();
	} catch (Exception ignored) {
	}	}
	%>