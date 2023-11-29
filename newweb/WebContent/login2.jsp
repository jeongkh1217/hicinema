<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");
			if (con == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery
					("select id, pw from member where id='" + id + "';");
			if (rs.next()) {
				String dbId = rs.getString(1);
				String dbPw = rs.getString(2);
				if (pw.equals(dbPw)) {
					session.setAttribute("result","0");
					session.setAttribute("s_id", id);
					session.setAttribute("s_pw", pw);
					String referrer = request.getHeader("referer");
					response.sendRedirect(referrer);

				} else {
					session.setAttribute("result", "1");
					String referrer = request.getHeader("referer");
					response.sendRedirect(referrer);

				}
			} else {
				session.setAttribute("result","2");
				String referrer = request.getHeader("referer");
				response.sendRedirect(referrer);
			}
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
	%>

</body>
<script>
	history.back();
</script>
</html>