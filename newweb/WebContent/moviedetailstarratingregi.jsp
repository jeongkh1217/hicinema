<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String movieid = request.getParameter("movieid");
    String comment = request.getParameter("comment");
    int starrating = Integer.parseInt(request.getParameter("starrating"));
    Date writtendate = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    String today = simpleDate.format(writtendate);

    if (id == null || movieid == null || comment == null)
        throw new Exception("누락된 데이터가 있습니다.");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");

        if (conn == null)
            throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");

        String command = "insert into starrating(id, movieid, starrating, comment, writtendatetime) values (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(command);
        pstmt.setString(1, id);
        pstmt.setString(2, movieid);
        pstmt.setInt(3, starrating);
        pstmt.setString(4, comment);
        pstmt.setString(5, today);

        int rowNum = pstmt.executeUpdate();

        if (rowNum < 1)
            throw new Exception("데이터를 DB에 입력할 수 없습니다.");

        String pointcommand = "update member set point = point + 50 where id=?";
        pstmt = conn.prepareStatement(pointcommand);
        pstmt.setString(1, id);
        int rowNum2 = pstmt.executeUpdate();

        if (rowNum2 < 1)
            throw new Exception("포인트를 업데이트할 수 없습니다.");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    String referrer = request.getHeader("referer");
    response.sendRedirect(referrer);
%>
