<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="hicinema.theater.vo.*"%>
<%@page import="hicinema.movie.vo.*" %>
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
<body>
	<%
		List<Theatergetset> a = (List<Theatergetset>) request.getAttribute("theaterlist");
		List<Moviegetset> b = (List<Moviegetset>) request.getAttribute("movielist");
		String mid = (String) request.getParameter("movieid");
	%>

	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin">
			
				<div class="movieschedulewrap">
				<div class="movieschedulerealsubtitle">
				<b>영화예매</b></div><hr>				
					<div class="moviescheduletitlewrap">
						<div class="moviescheduletitletitle movieschedulesubtitle" style="width:382px;">제목</div>
						<div class="moviescheduletitle movieschedulecontent" >
							<%
								for (int i = 0; i < b.size(); i++) {
									Moviegetset b1 = b.get(i);
							%>
							<div class="moviescheduletitleradio">
							<input type="radio" name="moviescheduletitlebtn" class="moviescheduletitlebtn"  value="<%=b1.getMovieid()%>" id="<%=b1.getMovieid()%>label"
							onclick="moviecheck(this.value);">							
							<label for="<%=b1.getMovieid()%>label">
							<input type="text" style="display:none" value="<%=b1.getMovietitle()%>" id="<%=b1.getMovieid()%>title">
							<%=b1.getMovietitle()%></label></div>
							<%
								}
							%>							
						</div>
					</div>
					<div class="moviescheduledatewrap">
						<div class="moviescheduledatetitle movieschedulesubtitle" style="width:255px;">날짜</div>
						<div class="moviescheduledate movieschedulecontent" style="display:inline-block; width:99%;">
						<%for (int i=0; i<7; i++) { %>
						<div class="moviescheduleradiodiv">								
						<input type="radio" id="moviescheduledate<%=i %>" name="moviescheduledateradio" class="moviescheduledateradiobtn" value="" 
						onclick="movietimecheck(this.value);">
							<label for="moviescheduledate<%=i %>">					
						<span id="moviedatejquery<%=i %>"></span>
						<span class="moviescheduledayspan" id="moviescheduleday<%=i %>"></span></label></div><%} %>
						</div>
					</div>
					<div class="moviescheduletheaterwrap">
						<div class="moviescheduletheatertitle movieschedulesubtitle" style="width:220px;">관</div>
						<div class="moviescheduletheater movieschedulecontent" style="width:99%;">
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater0"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater1"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater2"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater3"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater4"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater5"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater6"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater7"></div>
						<div class="moviescheduleajaxtheater" id="moviescheduleajaxtheater8"></div>						
						</div>
					</div>
					
					<div class="moviescheduletimewrap">
						<div class="moviescheduletimetitle movieschedulesubtitle" style="width:230px;">시간</div>
						<div class="moviescheduletime movieschedulecontent" id="movieschedulenotforsee" style="width:99%;">
						<div class="moviescheduleajaxtime" id="moviescheduleajaxtime0"></div>
						<div class="moviescheduleajaxtime" id="moviescheduleajaxtime1"></div>
						<div class="moviescheduleajaxtime" id="moviescheduleajaxtime2"></div>
						<div class="moviescheduleajaxtime" id="moviescheduleajaxtime3"></div>
						<div class="moviescheduleajaxtime" id="moviescheduleajaxtime4"></div>
						</div>
					</div>
				</div><br>　
				<div class="movieschedulecheck">
					<div class="movieschedulecheckimg" id="movieschedulecheckimg">
					<img class="movieschedulerealimg" id="movieschedulerealimg" src="assets/img/white.jpg"></div>					
					<div class="movieschedulecheckinfo">
					<input type="text" id="movieschedulemoviemovieid" style="display:none">
					<div class="movieschedulemovietitle"><span>제목:</span><span id="movieschedulemovietitle"></span></div>
					<div class="movieschedulemoviedate"><span>날짜:</span><span id="movieschedulemoviedate"></span></div>
					<div class="movieschedulemovietheater"><span>관:</span><span id="movieschedulemovietheater"></span></div>
					<div class="movieschedulemovietime"><span>시간:</span><span id="movieschedulemovietime"></span></div>
					<div class="moviescheduletheaterseat"><span>남은좌석:</span><span id="moviescheduletheaterseatinfo"></span></div>
					</div>
					<div class="moviereservationbutton" style="margin-top:94px;">										
					<button type="button"  class="btn-112 custom-btn5" onclick="beforereservationbtn()"><b>좌석 선택</b></button></div>
										
					</div>			
			</div>
		</div>
		<div class="forsubmit" style="display:none;">
		<form name="moviescheduleform" method="post"  action="moviescheduleseat.hci">
		<input type="text" name="movieid" id="moviescheduleformmovieid">
		<input type="text" name="date" id="moviescheduleformmoviedate">
		<input type="text" name="time"  id="moviescheduleformmovietime">
		<input type="text" name="theater"  id="moviescheduleformmovietheater">		
		</form></div>
		<div class="forjs" style="display:none;">
		<input type="text" id="forjstext" value="<%=mid%>">
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
function getCurrentWeek() {
	var date= new Date();
	var calendarYear = date.getFullYear();
	var calendarMonth = date.getMonth() + 1;
	var calendarToday = date.getDate();
	var monthLastDate = new Date(calendarYear, calendarMonth, 0);
	var calendarMonthLastDate = monthLastDate.getDate();
	var nextMonthStartDate = new Date(calendarYear, calendarMonth, 1);
	var calendarMonthTodayDay = date.getDay();	
	var arWeek = ["", "", "", "", "", "", ""];
	var arWeekday = ["","","","","","",""];
	var weekYear = calendarYear;
	var weekMonth = calendarMonth;
	var weekDate = calendarToday;
	var weekDay= calendarMonthTodayDay;
	for (var index = 0; index < 7; index++) {
		arWeek[index] = weekYear +"-" + weekMonth + "-" + weekDate;
		weekDate++;
		if (weekDate > calendarMonthLastDate) {
			weekYear = nextMonthStartDate.getFullYear();
			weekMonth = nextMonthStartDate.getMonth() + 1;
			weekDate = 1;		
		}
		$("#moviescheduledate"+index).val(arWeek[index]);
		$("#moviedatejquery"+index).html(arWeek[index]);
	}
	}
	

function getDay(date) {
	for (i=0;i<7;i++) {
	var date=document.getElementById("moviescheduledate"+i).value;
	var days=["(일)","(월)","(화)","(수)","(목)","(금)","(토)"];
	let date2 = new Date(date);
	let rd = days[date2.getDay()];
	var datespan = document.getElementById("moviescheduleday"+i);
	datespan.innerText=rd;
}
}
function moviecheck(movieid){
var mid = movieid;
var mname=document.getElementById(mid+"title").value;
	$("#movieschedulemovietitle").html(mname);
	$("#movieschedulemoviemovieid").text(mid);
	$("#movieschedulemovietheater").html("");
	$("#movieschedulemovietime").html("");
	$("#moviescheduletheaterseatinfo").html("");
	moviefile(mid);
}
function movietimecheck(moviedate) {
	var mdate = moviedate;
	$("#movieschedulemoviedate").html(mdate);
	var mname=document.getElementById("movieschedulemovietitle").innerText;
	var mid=document.getElementById("movieschedulemoviemovieid").innerText;
	if(mname!=""&&mname!="null"&&mname!="undefined") {
		$("#movieschedulemovietheater").html("");
		$("#movieschedulemovietime").html("");
		$("#moviescheduletheaterseatinfo").html("");
		scheduleajax(mid,mdate);
		
	}
}

function moviefile(movieid) {
	var mid=movieid;	
	$("#movieschedulerealimg").attr("src","assets/img/"+mid+".jpg");
	var mdate=document.getElementById("movieschedulemoviedate").innerText;
	if(mdate!=""&&mdate!==null&&mdate!="undefined") {
		scheduleajax(mid,mdate);
	}
}
function movietheatercheck(movietheater) {
	var movietheater = movietheater;
	$("#movieschedulemovietheater").html("");
	$("#movieschedulemovietheater").html(movietheater);
	$("#movieschedulemovietime").html("");
	$("#moviescheduletheaterseatinfo").html("");
	theaterajax(movietheater);
}

function movierealtimecheck(movietime) {
	var movietime = movietime;
	$("#movieschedulemovietime").text(movietime);
	leftseatajax();
}
function theaterajax(movietheater) {
    var theatername = movietheater;
    var movieid = document.getElementById("movieschedulemoviemovieid").innerText;
    $("#movieschedulenotforsee").show();
    var selectedday = $("input[name='moviescheduledateradio']:checked").val();
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var date = today.getDate();
    var realtoday = year + "-" + (month < 10 ? "0" : "") + month + "-" + (date < 10 ? "0" : "") + date;
    var hour = today.getHours();
    var minute = today.getMinutes();
    var realtime = (hour < 10 ? "0" : "") + hour + ":" + (minute < 10 ? "0" : "") + minute;
    $.ajax({
        type: 'POST',
        data: {
            "theatername": theatername,
            "movieid": movieid
        },
        url: "Contr.hic?comm=selecttimewheretheater",
        async: false,
        success: function (result) {
            $("#moviescheduletimediv").html(result);
            var realresult = result.replace(/\r\n/g, "");
            var splitresult = realresult.split('@A');
            for (var i = 0; i < splitresult.length - 1; i++) {
                var $radioBtn = $("<input type='radio' name='moviescheduletimeajaxresult'"+
                		" class='moviescheduletimeajaxresult' id='moviescheduletimeajax" + i +
                    "' value='" + splitresult[i] + "' onclick='movierealtimecheck(this.value);'>");
                var $label = $("<label for='moviescheduletimeajax" + i + "'>" + splitresult[i] + "</label>");
                $("#moviescheduleajaxtime" + i).html($radioBtn).append($label);
                if (selectedday == realtoday && splitresult[i] <= realtime) {
                    $radioBtn.prop("disabled", true);
                    $label.css("text-decoration", "line-through");
                }
            }
        }
    });
}
function scheduleajax(movieid,moviedate) {
	var movieid = movieid;
	var moviedate = moviedate;
	$(".moviescheduleajaxtheater").hide();
	$("#movieschedulenotforsee").hide();
	$(function() {
		$.ajax({
			type : 'POST',
			data : {
				"movieid" : movieid
			},
			url : "Contr.hic?comm=selectwheretheater",
			async : false,
			success : function(result) {
				
				var realresult = result.replace(/\r\n/g, "");
				var splitresult = realresult.split('@A');
				for (i = 0; i < splitresult.length - 1; i++) {
					$("#moviescheduleajaxtheater" + i)
							.html("<input type='radio' name='moviescheduletheaterajaxresult'"+
									" id='moviescheduletheaterajax"+i + "' value='" + 
									splitresult[i] + "' onclick='movietheatercheck(this.value);'>"+
									"<label for='moviescheduletheaterajax"+i+"'>"+splitresult[i]+"</label>");
					$("#moviescheduleajaxtheater" + i).show();
					$("#moviescheduleformmovieid").val(movieid);
					$("#moviescheduleformmoviedate").val(moviedate);					
					}
				}
			})
		})
	}
function leftseatajax() {
	var theater = document.getElementById("movieschedulemovietheater").innerText;
	var mdate=document.getElementById("movieschedulemoviedate").innerText;
	var mtime=document.getElementById("movieschedulemovietime").innerText;
	$(function() {
		$.ajax({
			type : 'POST',
			data : {
				"theater" : theater,
				"date":mdate,
				"time":mtime
			},
			url : "Contr.hic?comm=selectleftseatwhere",
			async : false,
			success : function(result) {
				$("#moviescheduletheaterseatinfo").text(100-parseInt(result)+"/ 100");
				
				
				}
			})
		})
	
}
function beforereservationbtn() {
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var mtheater = document.getElementById("movieschedulemovietheater").innerText;
	var mtime = document.getElementById("movieschedulemovietime").innerText;
	if (id==null||id=='null'||id=="") {
		openLoginpop();
		alert("로그인하셔야 이용가능합니다.");
		return;
	} else if (mtheater==null||mtheater==""||mtime==null||mtime=="") {
		alert("상영관과 시간을 선택해주세요.");
		return;
	} else {
		$("#moviescheduleformmovietheater").val(mtheater);
		$("#moviescheduleformmovietime").val(mtime);
		reservationformsubmit();
	}
}	

function reservationformsubmit() {
	document.forms["moviescheduleform"].submit();
	
}
$(document).ready(function(){
	var mid = $("#forjstext").val();
	if (mid=="null"||mid==null||mid=="") {
		return;
	} else {
		$(":radio[name='moviescheduletitlebtn'][value='"+mid+"']").attr("checked", true);
		moviecheck(mid);
		
	}
	
});

window.onload = function() {
	getCurrentWeek();
	getDay();
}
</script>
</html>