<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	String referrer = request.getHeader("referer");
	response.sendRedirect(referrer);
%>
</body>
</html>