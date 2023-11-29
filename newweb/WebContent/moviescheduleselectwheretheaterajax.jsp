<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="hicinema.theater.vo.*" %>
<%List<Theatergetset> a = (List<Theatergetset>) request.getAttribute("list");
for(Theatergetset a2:a) {
	out.println(a2.getTheatername()+"@A");
}

%>