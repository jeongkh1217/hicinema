<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
</head>
<body>
    <%
    request.setCharacterEncoding("utf-8");
    
    // 사용자 입력 데이터 수신
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String birth = year + "-" + month + "-" + day;
    String gender = request.getParameter("sex");
    String cp1 = request.getParameter("cp1");
    String cp2 = request.getParameter("cp2");
    String cp3 = request.getParameter("cp3");
    String cp = cp1 + "-" + cp2 + "-" + cp3;
    String postcode = request.getParameter("sample6_postcode");
    String address = request.getParameter("sample6_address");
    String detailaddress = request.getParameter("sample6_detailAddress");
    String extraaddress = request.getParameter("sample6_extraAddress");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String email = email1 + "@" + email2;
    String genre1 = "";
    String genre2 = "";
    String[] genres = request.getParameterValues("genre");
    if (genres != null && genres.length > 0) {
        genre1 = genres[0];
        if (genres.length > 1) {
            genre2 = genres[1];
        }
    }

    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    String today = simpleDate.format(date);

    if (id == null || pw == null || name == null || year == null || month == null || day == null || gender == null
            || cp1 == null || cp2 == null || cp3 == null || postcode == null || address == null || detailaddress == null
            || extraaddress == null || email1 == null || email2 == null || genre1 == null || genre2 == null) {
        throw new Exception("누락된 데이터가 있습니다.");
    }

    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh", "root", "1234");
        if (con == null) {
            throw new Exception("데이터베이스에 연결할 수 없습니다.");
        }

        stmt = con.createStatement();
        String command = "INSERT INTO member(id, pw, name, birth, cp, sex, postcode, address, detailaddress, extraaddress,"
                + " email, genre1, genre2, joindate) VALUES ('" + id + "','" + pw + "','" + name + "','" + birth + "','"
                + cp + "','" + gender + "','" + postcode + "','" + address + "','" + detailaddress + "','"
                + extraaddress + "','" + email + "','" + genre1 + "','" + genre2 + "','" + today + "');";
        int rowNum = stmt.executeUpdate(command);
        if (rowNum > 0) {
            out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
            response.sendRedirect("index.jsp");
        } else {
            throw new Exception("데이터를 DB에 입력할 수 없습니다.");
        }
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (Exception ignored) {
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception ignored) {
        }
    }
    %>
</body>
</html>