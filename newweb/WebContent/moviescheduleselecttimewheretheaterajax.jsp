<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="hicinema.theater.vo.*" %>
<%List<Theatergetset> a = (List<Theatergetset>) request.getAttribute("theaterlist");
for(Theatergetset a2:a) {
	out.println(a2.getMovietime1()+"@A");
	out.println(a2.getMovietime2()+"@A");
	out.println(a2.getMovietime3()+"@A");
	out.println(a2.getMovietime4()+"@A");
}
%>