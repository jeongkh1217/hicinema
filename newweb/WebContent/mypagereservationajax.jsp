<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="hicinema.reservation.vo.*" %>
<%
ArrayList<Reservationgetset> rgs = (ArrayList<Reservationgetset>) request.getAttribute("reservationlist");
Reservationgetset rgs2 = rgs.get(0);
%>
<%=rgs2.getReservationid()+"@A" %>
<%=rgs2.getTheater()+"@A" %>
<%=rgs2.getDate()+"@A" %>
<%=rgs2.getTime()+"@A" %>
<%=rgs2.getPayby()+"@A" %>
<%=rgs2.getPaydate()+"@A" %>
<%for(int i=0;i<rgs.size();i++) {
Reservationgetset rgs3 = rgs.get(i); %>
<%=rgs3.getSeat()+" " %>
<%} %>
