<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String sex = request.getParameter("sex");
	String cp1 = request.getParameter("cp1");
	String cp2 = request.getParameter("cp2");
	String cp3 = request.getParameter("cp3");
	String postcode = request.getParameter("sample6_postcode");
	String address = request.getParameter("sample6_address");
	String detailAddress = request.getParameter("sample6_detailAddress");
	String extraAddress = request.getParameter("sample6_extraAddress");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String genre1 = request.getParameter("genre1");
	String genre2 = request.getParameter("genre2");
	%>
	<%=id%>
	<%=pw%>
	<%=name%>
	<%=year%>-<%=month%>-<%=day%>
	<%=sex%>
	<%=cp1 %>-<%=cp2%>-<%=cp3%>
	<%=postcode%>
	<%=address%>
	<%=detailAddress%>
	<%=extraAddress%>
	<%=email1%>@<%=email2%>
	<%=genre1%>
	<%=genre2 %>
</body>
</html>