<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
<body>
	<%List <Moviegetset> a = (List<Moviegetset>) 
	request.getAttribute("movielist"); 
	String orderby = request.getParameter("orderby");
	%>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="movieinfoallwrap">
				<div class="bodymargin">
					<div class="movieinfosubtitle">
						<b>현재상영작</b><hr>
						</div>
						<div style="width:100%; height:25px;">
						<form name="movieorderby" action="Contr.hic?comm=selectmovie" method="get">
						<input type="text" id="movieinfoorderbyforchecktext" value="<%=orderby%>" style="display:none;">
						<input type="text" name="comm" value="selectmovie" style="display:none">
						<button type="submit" class="movieinfoorderbybtn btn-8 custom-btn2">GO</button>
						<select class="movieinfoorderby" id="movieinfoorderbyselectbox" name="orderby">
						<option value="totalview">관람객순</option>
						<option value="releasedate">개봉일순</option>
						<option value="movietitle">가나다순</option>
						<option value="ratingvalue">높은평점순</option>					
						</select></form>
						</div>
					<% for (int i = 0; i < a.size(); i++) {
						Moviegetset a1 = a.get(i);%>
					<div class="movieinfowrap">
						<div class="movieinforank">
							No.<%=i + 1%></div>						
						<div class="movieinfoimgwrap">
							<img class="movieinfoimg movieinfohover"
								src="assets/img/<%=a1.getFile()%>">
							<div class="movieinfobutton">
								<div class="movieinfomoreview">
									<a href="Contr.hic?comm=selectwheremovie&movieid=
									<%=a1.getMovieid()%>&page=1" class="moremovieinfo">상세보기</a>
								</div> </div> </div>
						<div class="movieinfosumwrap">
						<div class="movieinfoname ">
							<%=a1.getMovietitle()%></div>
							<div class="movieinforating" id="movieinforating<%=i %>">
							<input type="text" id="movieinforealrating<%=i %>" 
							value="<%=a1.getRating()%>" style="display:none"></div>
							<div class="movieinforunningtime ">
								/<%=a1.getRunningtime()%>　
							</div>
						</div>
					</div>
					<% } %><br>
					<div class="movieinfodivloadbtnwrap"><a href="#" id="movieinfodivload">더 보기</a></div>
					<div>　</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
$(function () {
	$(".movieinfowrap").slice(0,8).show();
	$("#movieinfodivload").click(function(e){
		e.preventDefault();
		$(".movieinfowrap:hidden").slice(0,4).show();
		if($(".movieinfowrap:hidden").length == 0 ){
			$("#movieinfodivload").hide();
		}
	});
});
$(document).ready(function() {
for (i=0; i<<%=a.size()%>;i++) {
	var text = document.getElementById("movieinforealrating"+i).value;
	var result = document.getElementById("movieinforating"+i);
	if(text=="전체관람가") {
		result.innerHTML="<img src='assets/img/all.png' class='moveinforatingimg'>";
	}  else if (text=="12세 이상 관람가") {
		result.innerHTML="<img src='assets/img/12.png' class='moveinforatingimg'>";
	} else if(text=="15세 이상 관람가") {
		result.innerHTML="<img src='assets/img/15.png' class='moveinforatingimg'>";
	} else if(text=="청소년관람불가") {
		result.innerHTML="<img src='assets/img/18.png' class='moveinforatingimg'>";
	}}})
	
$(document).ready(function() {
		var check = document.getElementById("movieinfoorderbyforchecktext");
		if(check.value=="movietitle") {
			$("#movieinfoorderbyselectbox").val('movietitle').prop("selected",true);
		} else if (check.value=="releasedate") {
			$("#movieinfoorderbyselectbox").val('releasedate').prop("selected",true);
		} else if (check.value=="totalview") {
			$("#movieinfoorderbyselectbox").val('totalview').prop("selected",true);		
		} else if (check.value=="ratingvalue"){
			$("#movieinfoorderbyselectbox").val('ratingvalue').prop("selected",true);
		} else {
			alert("오류");
		}
	})

</script>
</html>