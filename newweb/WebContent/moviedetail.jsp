<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hicinema.movie.vo.*"%>
<%@ page import="hicinema.snc.vo.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
request.setCharacterEncoding("utf-8");
List<Moviegetset> a = (List<Moviegetset>) request.getAttribute("movielist");
List<SnCgetset> b = (List<SnCgetset>) request.getAttribute("snclist");
int c = (int) request.getAttribute("movietotalview");
double d = (double) request.getAttribute("avg");
Moviegetset a1 = a.get(0);
int t = (int) request.getAttribute("movielikecount");
SnCpagegetset SnCpagegetset = (SnCpagegetset)request.getAttribute("SnCpagegetset");
int listCount=SnCpagegetset.getListCount();
int nowPage=SnCpagegetset.getPage();
int maxPage=SnCpagegetset.getMaxPage();
int startPage=SnCpagegetset.getStartPage();
int endPage=SnCpagegetset.getEndPage();

%>
<div class="allwrap">
	<div class="sbfooterwrap">
		<div id="header"></div>
		<div class="bodymargin">
				<div class="moviedetailallwrap">				
					<div class="moviedetailsubtitle"><b><%=a1.getMovietitle()%></b><hr>　
					</div>
					<div class="moviedetailwrap" style="height:350px;">
						<div class="moviedetailimgwrap">
							<img src="assets/img/<%=a1.getFile()%>" class="moviedetailimg">
							<div class="moviedetailbuttonwrap">
								<button type="button" id ="moviedetailunlike" class="moviedetailliketicket" onclick="insertmoviedetaillike()"><img class="moviedetailliketicketimg" src="assets/img/unfillheart.png"></button>
								<button type="button" id ="moviedetaillike" class="moviedetailliketicket" onclick="deletemoviedetaillike()" style="display:none;"><img class="moviedetailliketicketimg" src="assets/img/fillheart.png"></button>
								<span id="moviedetailliketotal"><%=t %></span>
								<form action="Contr.hic?comm=selecttheater" method="post" style="display:none;" name="moviedetailidform">
								<input type="hidden" name="movieid" value="<%=a1.getMovieid() %>"></form>
								<button type="button" style="width:130px;" class="custom-btn btn-16" onclick="submitdetail();">예매하기</button>
							</div>
						</div>
						<div class="moviedetaildetail">
							<div class="moviedetaildirector moviedetailintroduce">
								<span id="mddt" class="moviedetailtitle">감독:</span> <span id="mddc"><%=a1.getDirector()%></span>
							</div>
							<div class="moviedetailstarring moviedetailintroduce">
								<span id="mdst" class="moviedetailtitle">출연진:</span> <span id="mdsc"><%=a1.getStarring()%></span>
							</div>
							<div class="moviedetailgenrerunningtime moviedetailintroduce">
								<span id="mdgrt" class="moviedetailtitle">장르/러닝타임:</span> <span id="mdgrc"><%=a1.getGenre()%>/<%=a1.getRunningtime()%></span>
							</div>
							<div class="moviedetailrating moviedetailintroduce">
								<span id="mdrt" class="moviedetailtitle">관람등급:</span> <span id="mdrcimg"></span><span id="mdrc"><%=a1.getRating()%></span>
							</div>
							<div class="moviedetailreleasedate moviedetailintroduce">
								<span id="mdrdt" class="moviedetailtitle">개봉일:</span> <span id="mdrdc"><%=a1.getReleasedate()%></span>
								<div class="moviedetailtotalview"></div>
								<span id="mdtvt" class="moviedetailtitle">총 관람객수:</span> <span id="mdtvc"><%=a1.getTotalview()%> 명</span>
							</div>
							<div class="moviedetailrealtotalview moviedetailintroduce" style="display: none">
								<span id="mdrtvc"><%=c%></span>
							</div>
							<div class="moviedetailtotalviewpercent moviedetailintroduce">
								<span id="mdtvpt" class="moviedetailtitle">예매율:</span> <span id="mdtvpc"></span>
								
							</div>
							<div class="moviedetailaveragestarrating moviedetailintroduce">
								<span id="mdavst" class="moviedetailtitle">관람객 평균평점:</span><span id="mdavscresult"></span><span class="formdavsc">(</span><span id="mdavsc"><%=d%></span><span class="formdavsc">)</span>
								<span class="formdavsc"><%=SnCpagegetset.getListCount() %>명이 평가해주셨어요</span>
							</div>
							<div class="moviedetailsynopsis moviedetailintroduce">
						<div class="moviedetailsynopsistitle ">
						<span class="moviedetailtitle">시놉시스:</span></div></div></div>
						<div class="moviedetailphoto">
					<div class="moviedetailphotosubtitle">스틸컷</div>
					<div class="moviedetailphotocontent"><br>　
					<div class="moviedetailslidewrap">
					<img class="moveidetailslide" src="assets/img/<%=a1.getImgslidef1()%>.jpg"></div>
					<div class="moviedetailslidewrap">
					<img class="moveidetailslide" src="assets/img/<%=a1.getImgslidef2()%>.jpg"></div>
					<div class="moviedetailslidewrap">
					<img class="moveidetailslide" src="assets/img/<%=a1.getImgslidef3()%>.jpg"></div>
					<div class="moviedetailslidewrap">
					<img class="moveidetailslide" src="assets/img/<%=a1.getImgslidef4()%>.jpg"></div>
					<div class="moviedetailslidewrap">
					<img class="moveidetailslide" src="assets/img/<%=a1.getImgslidef5()%>.jpg"></div>					
					</div>
					</div>
						<div class="moviedetailsynopsiscontent"><%=a1.getSynopsis() %></div>
																
					
					</div>					
					<script>			
						var slideIndex = 0;
						showSlides();
						function showSlides() {
							var i;
							var slides = document
									.getElementsByClassName("moviedetailslidewrap");
							for (i = 0; i < slides.length; i++) {
								slides[i].style.display = "none";
							}
							slideIndex++;
							if (slideIndex > slides.length) {
								slideIndex = 1
							}
							slides[slideIndex - 1].style.display = "block";
							setTimeout(showSlides, 3000); // 2초마다 이미지가 체인지됩니다
						}
					</script>
				
				</div>
				<div>　<br><hr>　</div>
			<div class="starratingandcomment">
				<div class="starratingsubtitle">
					별점 및 한줄평
					<div class="starratingwrap">
						<form name="myform" id="myform" method="post" onsubmit="return false;" action="moviedetailstarratingregi.jsp">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> 
								<input type="radio" name="starrating" value="5" id="value5"> 
								<label for="value5">★</label> 
								<input type="radio" name="starrating" value="4" id="value4">
								<label for="value4">★</label> 
								<input type="radio" name="starrating" value="3" id="value3"> 
								<label for="value3">★</label> 
								<input type="radio" name="starrating" value="2" id="value2">
								<label for="value2">★</label> 
								<input type="radio" name="starrating" value="1" id="value1">
								<label for="value1">★</label>
							</fieldset>
							<div class="starratingcomment">
								<textarea class="col-auto form-control" id="reviewcontents"
									name="comment" maxlength="80"
									placeholder="한줄평을 남기시고 이벤트도 참여하세요 한줄평 작성시 50P 적립됩니다."></textarea>									
								<input type="button" class="ratingbutton custom-btn btn-7" style="border:1px solid black; height:78px; margin-top:-1px;"
									id="starratingregister" name="starratingregister" value="등록" onclick="starratingregi()">
									<input type="text" id="starratingid" name="id" value="<%=(String) session.getAttribute("s_id")%>" style="display:none" >
									<input type="text" name="movieid" value="<%=a1.getMovieid()%>" style="display:none" >									
							</div>							
						</form>
					</div>
				</div>
				<script>
				var id = '<%=(String) session.getAttribute("s_id")%>';
				var rc = document.getElementById("reviewcontents");
				if (id==null||id=='null'||id==""){
				rc.onclick = function (e) {
					alert("로그인시 작성가능합니다");
					openLoginpop();
					return;
				};				
				}
				</script>
				<div>				　
				</div>
				<div class="starratingcommentselectwrap">
				<%for(int i=0;i<b.size();i++){
							SnCgetset b1 = b.get(i);
							%>
					<div class="starratingcommentselect">						
					<div class="starratingandcomment">					
						<div class="starcomrating" id="starratingvalue<%=i %>" style="display:none"><%=b1.getStarrating() %></div>				
						<div class="starcomid" id="starcomid"><%=b1.getId() %></div>
						<div class="starcomdate"><%=b1.getWrittendatetime() %></div>
						<div class="starcomstarrating" id="realstarrating<%=i%>"></div>
						<div class="starcombtn starcombtndiv<%=b1.getId()%>" id="starcombtndiv<%=b1.getId() %>">
						<input type="button" class="starcomupdate" id="commenutupdatebtn<%=b1.getSncno() %>" onclick="commentupdate()">
						<input type="submit" class="starcomdelete" value="" form="forupdateform<%=b1.getSncno() %>" formaction="moviedetailprestarratingdelete.jsp" onclick="document.getElementById('forupdateform<%=b1.getSncno() %>').submit()"></div>
						<div class="starcomlikebtn">
						<input type="button" class="starcomlike" id="starcomlike<%=i %>" onClick="snclikecheck(this.id)">
						<div id="starcomlike<%=i %>result" style="display:inline-flex;"><%=b1.getCommentlike() %></div></div>
						<input type="text" id="starcomlike<%=i %>forcheck" value="<%=b1.getSncno() %>" style="display:none">								
						</div>
						<hr>	
						<div class="starcomment" id="starcommentdiv<%=b1.getId() %>"><%=b1.getComment() %></div>
						<form name="forupdateform<%=b1.getSncno() %>" id="forupdateform<%=b1.getSncno() %>" style="margin-top:-53px;" method="post">						
						<div class="forsncupdate">
						<input type="text" id="forsncupdateid<%=i %>" name="id" style="display:none" value="<%=b1.getId() %>">
						<textarea class="commentupdatetext forsncupdatecomment<%=b1.getId() %>" maxlength="80" name="comment" id="forsncupdatecomment<%=b1.getId() %>" style="display:none"><%=b1.getComment()%></textarea>
						<input type="text" name="sncno" id="forupdategetsncno<%=b1.getId() %>" value="<%=b1.getSncno() %>" style="display:none" >
						<input type="submit" class="forsncupdatebtn" formaction="moviedetailstarratingupdate.jsp" id="forsncupdatebtn<%=b1.getId() %>" style="display:none" value="">
						<input type="button" class="sncupdatecancelbtn"  style="display:none" value="" id="cancelsncupdatebtn<%=b1.getId() %>" onclick="cancelcommentupdate();">
						</div></form>
					</div><%} %>
				</div>								
			</div>			
		</div>
	</div>
	<div class="moviedetailsncpaging">	
	<section id="pageList">
		<%if(nowPage<=1){ %>
		◀
		<%}else{ %>
		<a href="Contr.hic?comm=selectwheremovie&movieid=<%=a1.getMovieid()%>&page=<%=nowPage-1 %>">◀</a>
		<%} %>
		<%for(int p=startPage;p<=endPage;p++){
				if(p==nowPage){%>
		[<%=p %>]
		<%}else{ %>
		<a href="Contr.hic?comm=selectwheremovie&movieid=<%=a1.getMovieid()%>&page=<%=p %>">[<%=p %>]
		</a>
		<%} %>
		<%} %>
		<%if(nowPage>=maxPage){ %>
		▶
		<%}else{ %>
		<a href="Contr.hic?comm=selectwheremovie&movieid=<%=a1.getMovieid()%>&page=<%=nowPage+1 %>">▶</a>
		<%} %>
	</section>	
	</div>	
	<div id="footer"></div>
</div>
<script>
function starratingregi() {
	var id="<%=(String) session.getAttribute("s_id")%>";
	if(id==null||id==""||id=="null"){
		alert("로그인시 작성가능합니다");
		openLoginpop();
		return;
	} else {
	$(function (){
			$.ajax ({
				type:'POST',
				data:{"id" :id},
				url:"Contr.hic?comm=checksnc&movieid=<%=a1.getMovieid()%>",
				async:false,
				success: function(result) {
					if(result==0) {
						starratingsubmit();
					} else {
						alert('한 영화에 대해 한 계정당 하나의 한줄평만 가능합니다.');
					}
				},				
				error:function(error) {
					console.err("Request error", error);
				}			
			});		
	})}
}
function starratingsubmit() {
	var userid = '<%=(String) session.getAttribute("s_id")%>';
if (s_id == 'null' || s_id == "") {
	return;
} else { 
	document.getElementById("starratingid").value = userid;
}
	starcheck();
}
function starcheck() {
	var sc = document.querySelector('input[type=radio][name=starrating]:checked');
	
	if(sc==null) {		
		alert("별점을 입력해주세요");
		return;
		
	} else {
		commentcheck();
	}
}
function commentcheck() {
	var cc = document.getElementById("reviewcontents").value;
	var ccl = cc.length;
	if (ccl <10) {
		alert("내용을 10자 이상 입력해주세요");
		return;
	} else {
		document.forms['myform'].submit();
	}
}
function commentupdate() {
	var userid ="<%=(String) session.getAttribute("s_id")%>";
		$("#forsncupdatecomment"+userid).show();
		$("#forsncupdatebtn"+userid).show();
		$("#cancelsncupdatebtn"+userid).show();
		
}
function cancelcommentupdate() {
	var userid ="<%=(String) session.getAttribute("s_id")%>";
	$("#forsncupdatecomment"+userid).hide();
	$("#forsncupdatebtn"+userid).hide();
	$("#cancelsncupdatebtn"+userid).hide();
	
}

$(document).ready(function(){
	var id = "<%=(String) session.getAttribute("s_id")%>";
	if (id==null||id=='null'||id=="") {
		return;
	} else {
	var movieid ="<%=a1.getMovieid()%>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"movieid":movieid,
				"id":id},
				url:"moviedetaillikeajax.jsp",
			async:false,
			success:function(cnt) {
				if(cnt==0) {
					$("#moviedetailunlike").show();
					$("#moviedetaillike").hide();
				} else {
					$("#moviedetailunlike").hide();
					$("#moviedetaillike").show();
				}
			}
		});
	})}
})

	
$(document).ready(function(){
	const a = document.getElementById("mdtvc");
	const b = document.getElementById("mdrtvc");
	const c = document.getElementById("mdtvpc");
	let tv = a.innerText;
	let tvt = b.innerText;
	let tvp = c.innerText;
	if (tv == null || tvt == null) {
		alert("오류");
	} else {
		result = parseInt(tv) / parseInt(tvt) * 100;
		document.getElementById("mdtvpc").innerHTML = result
				.toFixed(2)
				+ "%";
	}
});

$(document).ready(function(){
	for (i=0;i<<%=b.size()%>;i++) {		
		const rating = document
				.getElementById("starratingvalue"+i);
		let srating = rating.innerText;
		let starrating = parseInt(srating);
		const starcomstarrating = document
				.getElementById("realstarrating"+i);

		if (starrating == 1) {
			starcomstarrating.innerHTML = "★";
		} else if (starrating == 2) {
			starcomstarrating.innerHTML = "★★";
		} else if (starrating == 3) {
			starcomstarrating.innerHTML = "★★★";
		} else if (starrating == 4) {
			starcomstarrating.innerHTML = "★★★★";
		} else if (starrating == 5) {
			starcomstarrating.innerHTML = "★★★★★";
		}
	}
});	

$(document).ready(function(){
	var userid ="<%=(String) session.getAttribute("s_id")%>";
	$(".starcombtndiv"+userid).css("visibility","visible");
});
$(document).ready(function(){
	var rating = document.getElementById("mdavsc").innerText;
	var roundrating = Math.round(rating);
	$("#mdavscresult").text(roundrating);
	var ratingcheck = document.getElementById("mdavscresult").innerText;
	if (ratingcheck == 1) {
		$("#mdavscresult").html("★");
	} else if (ratingcheck == 2) {
		$("#mdavscresult").html("★★");
	} else if (ratingcheck == 3) {
		$("#mdavscresult").html("★★★");
	} else if (ratingcheck == 4) {
		$("#mdavscresult").html("★★★★");
	} else if (ratingcheck == 5) {
		$("#mdavscresult").html("★★★★★");
	}
})
$(document).ready(function(){
	var rating = document.getElementById("mdrc").innerText;
	var ratingimg = document.getElementById("mdrcimg");
	if(rating=="전체관람가") {
		ratingimg.innerHTML="<img src='assets/img/all.png' class='movedetailratingimg'>";
	}  else if (rating=="12세 이상 관람가") {
		ratingimg.innerHTML="<img src='assets/img/12.png' class='movedetailratingimg'>";
	} else if(rating=="15세 이상 관람가") {
		ratingimg.innerHTML="<img src='assets/img/15.png' class='movedetailratingimg'>";
	} else if(rating=="청소년관람불가") {
		ratingimg.innerHTML="<img src='assets/img/18.png' class='movedetailratingimg'>";
	}
})
$(document).ready(function(){
	var ratingvalue = $("#mdavsc").text();
	var movieid ="<%=a1.getMovieid()%>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"movieid":movieid,
				"ratingvalue":ratingvalue},
				url:"Contr.hic?comm=updatemovieratingvalue&movieid=<%=a1.getMovieid()%>",
			async:false,
			success:function(cnt) {					
					return;
				}
			}
		);
	})		
	
})
function insertmoviedetaillike() {
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var movieid ="<%=a1.getMovieid()%>";
	if(id=='null'||id==null||id==""){
		openLoginpop();
		return;
	} else {
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"movieid":movieid,
					"id":id},
					url:"moviedetailinsertlikeajax.jsp",
				async:false,
				success:function(cnt) {					
						$("#moviedetailunlike").hide();
						$("#moviedetaillike").show();
						moviedetailtotalselect();
					}
				}
			);
		})		
	}}	


function deletemoviedetaillike() {
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var movieid ="<%=a1.getMovieid()%>";
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"movieid":movieid,
					"id":id},
					url:"moviedetaildeletelikeajax.jsp",
				async:false,
				success:function(cnt) {					
						$("#moviedetailunlike").show();
						$("#moviedetaillike").hide();
						moviedetailtotalselect();
					}
				}
			);
		})	
}
function moviedetailtotalselect() {
	var movieid ="<%=a1.getMovieid()%>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"movieid":movieid,
				},
				url:"moviedetailtotalselect.jsp",
			async:false,
			success:function(cnt) {					
					$("#moviedetailliketotal").html(cnt);
				}
			}
		);
	})	
}



function snclikecheck(btnid) {
	var id="<%=(String) session.getAttribute("s_id")%>";
	if (id==""||id=="null"||id==null) {
		alert("로그인하셔야 추천가능합니다");
		openLoginpop();
		return;		
	} else {
	var sncno=document.getElementById(btnid+"forcheck").value;
	$(function (){
			$.ajax ({
				type:'POST',
				data:{"id" :id,
					"sncno":sncno},
				url:"Contr.hic?comm=checkidsnclike&movieid=<%=a1.getMovieid()%>",
				async:false,
				success: function(result) {
					if(result==0) {	
						snclikeidinsert(btnid);
					} else {	
						snclikeiddelete(btnid);
					}
				},				
				error:function(error) {
					console.err("Request error", error);
				}	
			});
	})
}}
function snclikeidinsert(btnid) {
		var id="<%=(String) session.getAttribute("s_id")%>";	
		var sncno=document.getElementById(btnid+"forcheck").value;
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"sncno":sncno,
					"id":id},
					url:"Contr.hic?comm=insertidsnclike&movieid=<%=a1.getMovieid()%>",
				async:false,
				success:function(result) {
					snclikeplus(btnid);				
				}}
			);
		})}
function snclikeplus(btnid) {
	var sncno=document.getElementById(btnid+"forcheck").value;
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"sncno":sncno,
				},
				url:"Contr.hic?comm=updatesncplus&movieid=<%=a1.getMovieid()%>",
			async:false,
			success:function(result) {		
				snclikeresult(btnid);
			}}
		);
	})
}

function snclikeiddelete(btnid) {
		var id="<%=(String) session.getAttribute("s_id")%>";
		var sncno=document.getElementById(btnid+"forcheck").value;
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"sncno":sncno,
					"id":id},
					url:"Contr.hic?comm=deleteidsnclike&movieid=<%=a1.getMovieid()%>",
				async:false,
				success:function(result) {
					snclikeminus(btnid);
				}}
			);
		})}
function snclikeminus(btnid) {
	var sncno=document.getElementById(btnid+"forcheck").value;
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"sncno":sncno,
				},
				url:"Contr.hic?comm=updatesncminus&movieid=<%=a1.getMovieid()%>",
			async:false,
			success:function(result) {
				snclikeresult(btnid);
			}}
		);
	})
}
function snclikeresult(btnid) {
	var sncno=document.getElementById(btnid+"forcheck").value;
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"sncno":sncno,
				},
				url:"Contr.hic?comm=selectcountsnc&movieid=<%=a1.getMovieid()%>",
			async:false,
			success:function(result) {
				$("#"+btnid+"result").html(result);
			}}
		);
	})
}
function submitdetail() {
	document.forms["moviedetailidform"].submit();
}
</script>
</body>
</html>