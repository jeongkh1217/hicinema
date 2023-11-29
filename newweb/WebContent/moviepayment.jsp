<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hicinema.movie.vo.*"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<title>HiCinema</title>
<link rel="stylesheet" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/headerfooter.js"></script>
</head>
<%
	String theater = request.getParameter("theater");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String seat = request.getParameter("seat");
	List<Moviegetset> a = (List<Moviegetset>) request.getAttribute("movie");
	Moviegetset a1 = a.get(0);
	int point =(int) request.getAttribute("point");
%>
<div class="allwrap">
	<div class="sbfooterwrap">
		<div id="header"></div>
		<div class="bodymargin2" style="height: 614px;">
			<div class="moviepaysubtitle">
				<b>영화 예매 결제</b>
				<hr>
			</div>
			<div class="moviepaycontent">
				<div class="moviepayinfo">
					<div class="moviepayinfomovieimg">
						<img class="moviepayinfomovieimgfile"
							src="assets/img/<%=a1.getMovieid()%>.jpg">
					</div>
					<div class="moviepayinfowrap">
						<div class="moviepayinfomovieinfo">
							<span>제목 : </span><span><%=a1.getMovietitle()%></span><br> 
							<span>상영관 : </span><span><%=theater%></span><br>
							<span>상영일시 : </span><span id="moviepayinfodate"><%=date%></span> <span id="moviepayinfoday"></span> <span><%=time%></span><br>
							<span>좌석 : </span><span></span> <span id="moviepayinfoseats"><%=seat%></span><br> 
							<span>가격 : </span><span id="moviepayinfofirstprice"></span>
						</div>
						<div class="moviepayinfopay">
							<span>결제방법 : </span> 
							<select id="paymentMethod">
								<option value="card" selected>카드</option>
								<option value="account">무통장입금</option>
								<option value="phone">휴대폰</option>
							</select><br> 
							<span>보유 포인트 : </span><span class="moviepayinfopaypoint" id="moviepayinfopaypoint"><%=point %></span><span>P </span><input type="button" onclick="pointcalcul();" value="포인트 적용"><br> 
							<span>총 가격 : </span><span id="moviepayinfosecondprice"></span><span>원</span>
						</div>
					</div>
				</div>
			</div>
			<div class="moviepaysubmitbtndiv">
			<button type="button" onclick="moviepaybeforesubmit()" class="btn-112 custom-btn5">결제</button>
			</div>
			<div class="moviepayforsubmitform" style="display:none;">
			<form name="moviepayform" method="post" action="movieschedulereservation.hci">
			<input type="text" name="theater" value="<%=theater%>">
			<input type="text" name="date" value="<%=date%>">
			<input type="text" name="time" value="<%=time%>">
			<input type="text" name="id" value='<%=(String) session.getAttribute("s_id")%>'>
			<input type="text" name="seat" value="<%=seat%>">
			<input type="text" id="payby" name="payby" value="">
			<input type="text" id ="moviepayminuspoint" name="minuspoint" value="">	
			<input type="text" id="moviepaypluspoint" name="pluspoint" value="">		
			</form>
			</div>
		</div>
	</div>
	<div id="footer"></div>
</div>
</body>
<script>
$(document).ready(function(){
	var seats = $("#moviepayinfoseats").text();
	var splitseats = seats.split('|');
	var a = splitseats.length;
	$("#moviepayinfofirstprice").text(parseInt(a-1)*10000);
	$("#moviepayinfosecondprice").text(parseInt(a-1)*10000);
	$("#moviepaypluspoint").val(Math.floor(0.02 * parseInt($("#moviepayinfosecondprice").text())));
});
$(document).ready(function(){
	var date = $("#moviepayinfodate").text();
	var days=["(일)","(월)","(화)","(수)","(목)","(금)","(토)"];
	var date2 = new Date(date);
	var mday = days[date2.getDay()];
	var mdayspan = document.getElementById("moviepayinfoday");
		mdayspan.innerText=mday;	
});
var pointCalculated = false;
function pointcalcul() {
    if (pointCalculated) {
        return;
    }
    var pointText = $("#moviepayinfopaypoint").text();
    var priceText = $("#moviepayinfofirstprice").text();
    var point = parseInt(pointText) || 0;
    var price = parseInt(priceText) || 0;
    if (price === 0 || isNaN(price) || isNaN(point)) {
        return;
    } else {
        if (point >= price) {
            $("#moviepayinfosecondprice").text("0");
            $("#moviepayinfopaypoint").text(point - price);
            $("#moviepayminuspoint").val(price);
            $("#moviepaypluspoint").val(Math.floor
            		(0.02 * parseInt($("#moviepayinfosecondprice").text())));
        } else {
            $("#moviepayinfosecondprice").text(price - point);
            $("#moviepayinfopaypoint").text("0");
            $("#moviepayminuspoint").val(point);
            $("#moviepaypluspoint").val(Math.floor
            		(0.02 * parseInt($("#moviepayinfosecondprice").text())));
        }        
        pointCalculated = true;
    }
}
function moviepaybeforesubmit() {
    var selectedValue = $("#paymentMethod").val();
    $("#payby").val(selectedValue);
    paymentsubmit();
    
}
function paymentsubmit() {
	document.forms["moviepayform"].submit();
}
</script>
</html>