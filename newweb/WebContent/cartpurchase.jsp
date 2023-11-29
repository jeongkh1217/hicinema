<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String payby = request.getParameter("payby");
String pluspointParam = request.getParameter("pluspoint");
String minuspointParam = request.getParameter("minuspoint");

int pluspoint = 0;
int minuspoint = 0;

if (pluspointParam != null && !pluspointParam.isEmpty()) {
    pluspoint = Integer.parseInt(pluspointParam);
}

if (minuspointParam != null && !minuspointParam.isEmpty()) {
    minuspoint = Integer.parseInt(minuspointParam);
}

Connection conn = null;
Statement stmt = null;
Timestamp ts = new Timestamp(System.currentTimeMillis());
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");

    if (con == null)
        throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
    
    stmt = con.createStatement();

    String command = String.format("update cart set purchased='Y', payby='%s', paydate='%s', purchaseid='%s' where id='%s' and purchased='N';", payby,sdf.format(ts), "P"+id + ts, id);
    
    String pluspointcommand = String.format("update member set point = point + %d where id = '%s'", pluspoint, id);
    String minuspointcommand = String.format("update member set point = point - %d where id = '%s'", minuspoint, id);

    int rowNum = stmt.executeUpdate(command);

    if (pluspoint == 0) {
        stmt.executeUpdate(minuspointcommand);
    } else {
        stmt.executeUpdate(minuspointcommand);
        stmt.executeUpdate(pluspointcommand);
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


out.println("<script>alert('구매완료되었습니다. 구매번호는 <" + "p" + sdf.format(ts) + ">입니다. 마이페이지에서 확인해주세요.'); window.location.href='index.jsp';</script>");

%>