<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="hicinema.cart.*" %>
    <%@page import="hicinema.store.*" %>
<%
ArrayList<Cartgetset> cgs = (ArrayList<Cartgetset>) request.getAttribute("purchaselist");
Cartgetset cgs2 = cgs.get(0);
ArrayList<Storegetset> sgs = (ArrayList<Storegetset>) request.getAttribute("itemnamelist");%>
<%=cgs2.getPurchaseid()+"@A" %>    
<%=cgs2.getPayby()+"@A" %>
<%=cgs2.getPaydate()+"@A" %>
<%if (cgs != null && sgs != null && cgs.size() == sgs.size()) {
    for (int i = 0; i < cgs.size(); i++) {
        Cartgetset cgs3 = cgs.get(i);
        Storegetset sgs3 = sgs.get(i);%>
<%=sgs3.getItemname()+"@B" %>
<%=cgs3.getQuantity()+"개@C" %>

<%}} %>
