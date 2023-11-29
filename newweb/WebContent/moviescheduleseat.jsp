<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hicinema.movie.vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hicinema.reservation.vo.*"%>
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
	String movieid = request.getParameter("movieid");
	String theatername = request.getParameter("theater");
	String movietime = request.getParameter("time");
	String moviedate = request.getParameter("date");
	ArrayList<Moviegetset> a = (ArrayList<Moviegetset>) request.getAttribute("movielist");
	Moviegetset a1 = a.get(0);
	ArrayList<Reservationgetset> b = (ArrayList<Reservationgetset>) request.getAttribute("seatlist");
%>

<div class="allwrap">
	<div class="sbfooterwrap">
		<div id="header"></div>
		<div class="bodymargin2">
			<div class="movieseatsubtitle">
				<b>좌석선택</b>
				<hr>
			</div>
			<div class="movieseattheaterwrap">
				<div class="movieseatpretheater">
					<div class="movieseatquantity">
						<div style="margin-right: 10px;">관람객 수 :</div>
						<input type='button' class="btn30x30 custom-btn btn-72"
							onclick='count("plus")' value='+' />
						<div id='seatquantity' style="margin: 0 20px;">1</div>
						<input type='button' class="btn30x30 custom-btn btn-72"
							onclick='count("minus")' value='-' />
					</div>
					<div>
						<div class="movieseattheaterinfo">
							<span><%=theatername%></span><br> <span
								id="movieseatmoviedatespan"><%=moviedate%></span> <span
								id="movieseatmoviedayspan"></span> / <span><%=movietime%></span><br>
							<span><%=a1.getMovietitle()%></span>
						</div>
						<div class="movieseattheaterinfoimg">
							<img class="movieseatinfoimg"
								src="assets/img/<%=a1.getMovieid()%>.jpg">
						</div>
					</div>
				</div>
				<div class="movieseattheatertheater">
					<div class="movieseattheaterscreen">
						<b>SCREEN</b>
					</div>
					<div class="movieseattheatervoid"></div>
					<div class="movieseattheaterseat1">
						<%
							for (int i = 1; i < 51; i++) {
						%>
						<label for="seat<%=i %>" class="movieseattheaterlabel">
						<input type="checkbox" class="movieseattheaterseat"
							id="seat<%=i%>" name="movieseattheaterseat"
							onclick="movieseatcount(this);" value="seat<%=i%>" style="display:none;">
							Seat<br><%=i %>
							</label>
						<%
							}
						%>
					</div>
					<div class="movieseattheaterseat2">
						<%
							for (int i = 51; i < 101; i++) {
						%>
						<label for="seat<%=i %>" class="movieseattheaterlabel">
						<input type="checkbox" class="movieseattheaterseat"
							id="seat<%=i%>" name="movieseattheaterseat"
							onclick="movieseatcount(this);" value="seat<%=i%>" style="display:none;">
							Seat<br><%=i %>
							</label>
						<%
							}
						%>
						</div>
						<div class="movieseattheatervoid"></div>
					
				</div>
				<div class="movieseatselectresult">
					<div class="movieseatselectresultmovieimg">
						<img class="movieseatinfoimg"
							src="assets/img/<%=a1.getMovieid()%>.jpg">
					</div>
					<div class="movieseatselectresultmovieinfo">
						<span id="movieseatmovietheaterspan"><%=theatername%></span><br>
						<span id="movieseatmoviedatespan2"><%=moviedate%></span> <span
							id="movieseatmoviedayspan2"></span> / <span
							id="movieseatmovietimespan"><%=movietime%></span><br> <span><%=a1.getMovietitle()%></span>
							
					</div>
					<div class="movieseatselectresultseatinfo"
						id="movieseatselectresultseatinfo"></div>
					<div class="movieseatselectpriceresultinfo" >
					<span><br>금액 : </span><span id="movieseatselect10000" style="display:none;">10000원 * </span><span id="movieseatselectseatquantity"></span>
					<span id="movieseatselectmyung" style="display:none;">명</span>
					<span id="movieseatselectpriceresultinfo"></span></div>			
					<div class="movieseatselectresultsubmitbtn">
						<form name="lastreservationform"
							action="moviepaymentconfirm.hci" method="post">
							<input type="hidden" id="moviereservationformid" name="id" value="<%=(String) session.getAttribute("s_id")%>">
							<input type="hidden" id="moviereservationformtheater" name="theater"> 
							<input type="hidden" id="moviereservationformdate" name="date"> 
							<input type="hidden" id="moviereservationformtime" name="time"> 
							<input type="hidden" id="moviereservationformseat" name="seat">
							<input type="hidden" id="moviereservationformmovieid" name="movieid" value="<%=a1.getMovieid()%>">
							<button type="button" class="btn-112 custom-btn5"
								onclick="beforereservation();">
								<b>예매</b>
							</button>
						</form>
					</div>
				</div>
				<div class="forseatcompare" style="display:none;">
					<%
						for (int i = 0; i < b.size(); i++) {
							Reservationgetset b2 = b.get(i);
							if (b.size() == 0) {
					%>
					<input type="text" id="movieseatreservedseatcount<%=i %>" value="">
					<%
					} else {%>
					<input type="text" id="movieseatreservedseatcount<%=i %>"
						value="<%=b2.getSeat()%>">
					<%}} %>
				</div>
			</div>
		</div>

		<div id="footer"></div>
	</div>
</div>
</body>
<script>
$(document).ready(function(){
    for (i = 0; i <<%=b.size()%>; i++) {
        var rdseat = $("#movieseatreservedseatcount" + i).val();
        $("#" + rdseat).prop("disabled", true);
        $("label[for='" + rdseat + "']").css
        ({"border": "1px solid red","color":"gray","cursor":"auto" }); 
    }	 
});


$(document).ready(function(){
	var mdate = document.getElementById("movieseatmoviedatespan").innerText;
	var days=["(일)","(월)","(화)","(수)","(목)","(금)","(토)"];
	var mdate2 = new Date(mdate);
	var mday = days[mdate2.getDay()];
	var mdayspan = document.getElementById("movieseatmoviedayspan");
	var mdayspan2 = document.getElementById("movieseatmoviedayspan2");
		mdayspan.innerText=mday;	
		mdayspan2.innerText=mday;
})
function movieseatcolorchange(chb, isChecked) {
  var chbV = chb.value;
  var labelFor = $("label[for='" + chbV + "']");
  if (isChecked) {  
    labelFor.css({"background-color": "white", "color": "black"});
    pricecalcul();
  } else {
    labelFor.css({"background-color": "black", "color": "white"});
    pricecalcul();

  }
}
function pricecalcul() {
    var sseat = $("#movieseatselectresultseatinfo").text();
    var withoutSpan = $("<div>").html(sseat).text();
    var splitseat = withoutSpan.split('|');
    var realsplitseat = parseInt(splitseat.length) -1;
    $("#movieseatselect10000").show();
    $("#movieseatselectmyung").show();
    $("#movieseatselectseatquantity").html(realsplitseat);
    $("#movieseatselectpriceresultinfo").html(parseInt(realsplitseat)*10000+"원");
    if(splitseat.length==1) {
    	$("#movieseatselect10000").hide();
    	$("#movieseatselectmyung").hide();
    	$("#movieseatselectseatquantity").html("");
    	$("#movieseatselectpriceresultinfo").html("");
    }
    
}
	
function count(type) {
	const resultElement = document.getElementById('seatquantity');
	let number = resultElement.innerText;
	if (type === 'plus') {
		number = parseInt(number) + 1;
		if (number == 6) {
			alert("최대 예약좌석은 5개입니다.");
			number = 5;
		}
	} else if (type === 'minus') {
		number = parseInt(number) - 1;
		if (number == 0) {
			alert("1개 이상 선택해주세요.");
			number = 1;
		}
	}
	resultElement.innerText = number;
}

function movieseatcount(chb) {
	  var chb = chb;
	  var chbV = chb.value;
	  var chkBox = document.getElementsByName("movieseattheaterseat");
	  var chkCnt = 0;
	  var chkBoxlimit = document.getElementById("seatquantity").innerText;

	  for (var i = 0; i < chkBox.length; i++) {
	    if (chkBox[i].checked == true) {
	      chkCnt++;	     
	    }
	  }
	  $("#movieseatselectresultseatinfo").append("<span id='" + chbV + "XC'>" + chbV + "|</span>");
	  movieseatcolorchange(chb, true);
	  if (chkCnt > parseInt(chkBoxlimit)) {
	    alert("설정하신 인원수만큼 선택가능합니다.");
	    $("#" + chbV).prop("checked", false);
	    $("span").remove("#" + chbV + "XC");
	    movieseatcolorchange(chb, false);
	  }
	  if (chb.checked == false) {
	    $("span").remove("#" + chbV + "XC");
	    movieseatcolorchange(chb, false);
	  }
	}


function beforereservation() {
	  var theater = document.getElementById("movieseatmovietheaterspan").innerText;
	  var mdate = document.getElementById("movieseatmoviedatespan2").innerText;
	  var mtime = document.getElementById("movieseatmovietimespan").innerText;
	  var seat = document.getElementById("movieseatselectresultseatinfo").innerText;
	  var seatQuantity = parseInt(document.getElementById("seatquantity").innerText);
	  var checkedCheckboxes = $(".movieseattheaterseat:checked").length;
	  if (seat == "null" || seat == undefined || seat == null) {
	    alert("자리를 선택해주세요");
	    return;
	  } else if (seatQuantity > checkedCheckboxes) {
	    alert("설정된 관람객 수보다 좌석이 적습니다.");
	    return;
	  } else {
	    $("#moviereservationformtheater").val(theater);
	    $("#moviereservationformdate").val(mdate);
	    $("#moviereservationformtime").val(mtime);
	    $("#moviereservationformseat").val(seat);
	    reservationsubmit();
	  }
	}
function reservationsubmit() {
	document.forms["lastreservationform"].submit();
}

</script>
</html>