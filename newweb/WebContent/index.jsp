<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="hicinema.store.Storegetset"%>
<%@page import="hicinema.store.Indexstoretotalsales"%>
<%@page import="hicinema.movie.vo.Moviegetset"%>
<%@page import="hicinema.movie.Indexmovietotalview"%>
<%@page import="hicinema.member.vo.Membergetset" %>
<%@page import="hicinema.member.Indexmembergenre" %>


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
	<jsp:useBean id="movie" class="hicinema.movie.Indexmovietotalview">
		<jsp:useBean id="store" class="hicinema.store.Indexstoretotalsales">
			<jsp:useBean id="member" class="hicinema.member.Indexmembergenre">
			<jsp:useBean id="moviegenre" class="hicinema.movie.Indexmoviegenre">
				<%
					String id = (String) session.getAttribute("s_id");
					ArrayList<Membergetset> genrelist = member.membergenre(id);
					Membergetset genrelist2 = genrelist.get(0);
					String genre1 = genrelist2.getGenre1();
					String genre2 = genrelist2.getGenre2();
					ArrayList<Moviegetset> moviegenre1list = moviegenre.indexgenre1(genre1);
					ArrayList<Moviegetset> moviegenre2list = moviegenre.indexgenre2(genre2);
					Moviegetset genremovie1 = moviegenre1list.get(0);
					Moviegetset genremovie2 = moviegenre2list.get(0);
				%>
				<div class="allwrap">
					<div class="sbfooterwrap">
						<div id="header"></div>
						<div class="videodiv bgblack">
							<div class="cntnsWrap">
								<video muted autoplay loop class="video1">
									<source src="assets/video/The Nun II.mp4" />
								</video>
							</div>
						</div>
						<div class="bodymargin">
							<div class="section1">
								<div class="cntnsWrap">
									<br>
									<div>
										<hr>
									</div>
										<div class="indexsubtitle">추천영화</div>
										<input type="text" id="forrecommend1" value="<%=genremovie1.getMovieid()%>" style="display: none;"> 
										<input type="text" id="forrecommend2" value="<%=genremovie2.getMovieid()%>" style="display: none;">
										<div class="jstSBtwn">
											<div class="movieindexrecommenddivquarter">
												<div class="movieindexrecommendwrap"
													style="float: left; padding-left: 50px;">
													<div class="movieindexrecommend">
													<div class="movieindexrecommendtitle">
															<span id="movieindexrecommendratingspan1"><%=genremovie1.getRating() %></span>
															<span><%=genremovie1.getMovietitle() %></span>
														</div>
														<div class="movieindexrecommendimg">
															<img class="movieimg"
																src="assets/img/<%=genremovie1.getMovieid() %>.jpg">
														</div>
														
														<div class="indexrecommendbuttonwrap">
															<button class="indexrecommendbutton custom-btn btn-15" onclick="location.href='http://localhost:8080/newweb/Contr.hic?comm=selectwheremovie&movieid=<%=genremovie1.getMovieid() %>&page=1'">상세정보</button>
															<button class="indexrecommendbutton custom-btn btn-16">예매하기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="movieindexrecommenddivquarter">
												<div class="movieindexrecommend firstbubble"
													id="movieindexnotnullrecommendfirst">
													회원님의 선호장르(<%=genrelist2.getGenre1() %>)를 이용한 추천영화!<br> 이 영화는
													어떠세요?
												</div>
												<div class="movieindexrecommend firstbubble"
													id="movieindexnullrecommendfirst">로그인하시면 좋아하는 장르의 영화를
													추천받을 수 있습니다.</div>
												<div class="movieindexrecommendsumwrap">
													<div class="movieindexrecommendnamewrap">
														<div
															class="movieindexrecommendinfotitle movieindexrecommendstarring">
															<span>주연</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendstarring">
															<span><%=genremovie1.getStarring() %></span>
														</div>
														<div
															class="movieindexrecommendinfotitle movieindexrecommendgenre">
															<span>장르</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendgenre">
															<span><%=genremovie1.getGenre() %></span>
														</div>
														<div
															class="movieindexrecommendinfotitle movieindexrecommendscore">
															<span>관람객 평균평점</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendscore">
															<span id="recommendscoreresult1img"></span>
															<span>(</span><span id="recommendscoreresult1"><%=genremovie1.getRatingvalue() %></span><span>)</span>
														</div>
													</div>
												</div>
											</div>
											<div class="movieindexrecommenddivquarter">
												<div class="movieindexrecommend secondbubble"
													id="movieindexnotnullrecommendsecond">
													회원님의 선호장르(<%=genrelist2.getGenre2() %>)를 이용한 추천영화!<br> 이 영화는
													어떠세요?
												</div>
												<div class="movieindexrecommend secondbubble"
													id="movieindexnullrecommendsecond">로그인하시면 좋아하는 장르의
													영화를 추천받을 수 있습니다.</div>
												<div class="movieindexrecommendsumwrap2">
													<div class="movieindexrecommendnamewrap">
														<div
															class="movieindexrecommendinfotitle movieindexrecommendstarring">
															<span>주연</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendstarring">
															<span><%=genremovie2.getStarring() %></span>
														</div>
														<div
															class="movieindexrecommendinfotitle movieindexrecommendgenre">
															<span>장르</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendgenre">
															<span><%=genremovie2.getGenre() %></span>
														</div>
														<div
															class="movieindexrecommendinfotitle movieindexrecommendscore">
															<span>관람객 평균평점</span>
														</div>
														<div
															class="movieindexrecommendinfocontent movieindexrecommendscore">
															<span id="recommendscoreresult2img"></span>
															<span>(</span><span id="recommendscoreresult2"><%=genremovie2.getRatingvalue() %></span><span>)</span>
														</div>
													</div>
												</div>
											</div>
											<div class="movieindexrecommenddivquarter">
												<div class="movieindexrecommendwrap"
													style="float: right; padding-right: 50px;">
													<div class="movieindexrecommend">
													<div class="movieindexrecommendtitle">
															<span id="movieindexrecommendratingspan2"><%=genremovie2.getRating() %></span>
															<span><%=genremovie2.getMovietitle() %></span>
														</div>
														<div class="movieindexrecommendimg">
															<img class="movieimg"
																src="assets/img/<%=genremovie2.getMovieid() %>.jpg">
														</div>
														
														<div class="indexrecommendbuttonwrap">
															<button class="indexrecommendbutton custom-btn btn-15"onclick="location.href='http://localhost:8080/newweb/Contr.hic?comm=selectwheremovie&movieid=<%=genremovie2.getMovieid() %>&page=1'">상세정보</button>
															<button class="indexrecommendbutton custom-btn btn-16">예매하기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
							<div>
								<hr>
							</div>
							<div class="section2">
								<div class="cntnsWrap">
									<div class="indexslidercontainer">
										<div class="indexsubtitle">　　현재상영작 
										<button type="button" class="indexsubtitlemore btn-10" onClick="location.href='Contr.hic?comm=selectmovie&orderby=totalview'">전체보기</button>
											<button class="previous arrow color-2">←</button>
											<button class="next arrow color-2">→</button>
										</div>
										<div class="album">
										<%
										ArrayList<Moviegetset> movie1 = movie.indexmovie();									
										for (int i = 0; i < movie1.size(); i++) {
											Moviegetset movie2 = movie1.get(i);
										%>
											<div class="movieimgslidecontainer">
												<div class="movieslidewrap">
													<img class="movieimgslide moviehover"
														src="assets/img/<%=movie2.getMovieid()%>.jpg">
													<div class="movieindextitle"><%=movie2.getMovietitle()%></div>
													<div class='moviebutton'>
														<div class='moviemoreview'>
															<a href="Contr.hic?comm=selectwheremovie&movieid=
																<%=movie2.getMovieid()%>&page=1" class='moremovie'>상세보기</a>
														</div>
													</div>
												</div>
											</div>
											<%
										}
										%>
										</div>
									</div>
								</div>
							</div>
							<div>
								<hr>
							</div>
							<div class="section3">
								<div class="cntnsWrap">
									<div class="indexsubtitle">　　스토어 순위 
									<button type="button" class="indexsubtitlemore btn-10" onClick="location.href='http://localhost:8080/newweb/store.jsp?orderby=category%20desc'">
									전체보기</button>
									</div>
									<%
								ArrayList<Storegetset> store1 = store.indexstore();
								%>
									<%
								for (int i = 0; i < 5; i++) {
									Storegetset store2 = store1.get(i);
								%>
									<div class='indexstoreimg'>
										<div class='indexstorewrap'>
											<div class="indexstorerank">
												No.<%=i + 1%></div>
											<img class='indexstorehover'
												src='assets/img/<%=store2.getItemid()%>.jpg'>
											<div class='indexstoreitemname'>
												<%=store2.getItemname()%></div>
											<div class='indexstorebutton'>
												<div class='indexstoremoreview'>
													<a href='storedetail.jsp?itemid=<%=store2.getItemid()%>'
														class='indexstoremore indexstorehoverbtn'>상세보기</a>
												</div>
											</div>
										</div>
									</div>
									<%
								}
								%>
								</div>
							</div>
							<div>
								<hr>
							</div>
							<div class="section4">
								<div class="indexsubtitle">주간 통계</div>
								<div class="cntnsWrap">
									<div class="chartWrap">
										<img class="chart" src="assets/img/chart.jpg">
									</div>
									<div class="chartWrap">
										<img class="chart" src="assets/img/chart2.jpg">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div id="footer"></div>
				</div>
				<c:if test="${not empty moviereservationcompleteresult}">
				    ${moviereservationcompleteresult}
				</c:if>
				</jsp:useBean>
			</jsp:useBean>
		</jsp:useBean>
	</jsp:useBean>
</body>
<script src="js/indexslide.js"></script>
<script>
$(document).ready(function() {
	var id ="<%=(String)session.getAttribute("s_id")%>";
	if(id==null||id=="null"||id=="") {
		$("#movieindexnotnullrecommendfirst").hide();
		$("#movieindexnotnullrecommendsecond").hide();
		$("#movieindexnullrecommendfirst").show();
		$("#movieindexnullrecommendsecond").show();
	} else {
		$("#movieindexnotnullrecommendfirst").show();
		$("#movieindexnotnullrecommendsecond").show();
		$("#movieindexnullrecommendfirst").hide();
		$("#movieindexnullrecommendsecond").hide();
	}
	})
$(document).ready(function() {
	var r1 = document.getElementById("movieindexrecommendratingspan1");
	var r3 = r1.innerText;
	var r2 = document.getElementById("movieindexrecommendratingspan2");
	var r4 = r2.innerText;
	if(r3=="전체관람가") {
		r1.innerHTML="<img src='assets/img/all.png' class='indexmovieratingimg'>";
	}  else if (r3=="12세 이상 관람가") {
		r1.innerHTML="<img src='assets/img/12.png' class='indexmovieratingimg'>";
	} else if(r3=="15세 이상 관람가") {
		r1.innerHTML="<img src='assets/img/15.png' class='indexmovieratingimg'>";
	} else if(r3=="청소년관람불가") {
		r1.innerHTML="<img src='assets/img/18.png' class='indexmovieratingimg'>";
	}
	if(r4=="전체관람가") {
		r2.innerHTML="<img src='assets/img/all.png' class='indexmovieratingimg'>";
	}  else if (r4=="12세 이상 관람가") {
		r2.innerHTML="<img src='assets/img/12.png' class='indexmovieratingimg'>";
	} else if(r4=="15세 이상 관람가") {
		r2.innerHTML="<img src='assets/img/15.png' class='indexmovieratingimg'>";
	} else if(r4=="청소년관람불가") {
		r2.innerHTML="<img src='assets/img/18.png' class='indexmovieratingimg'>";
	}	
})

$(document).ready(function() {
	var s1=$("#recommendscoreresult1").text();
	var s3=Math.round(s1);
	if (s3 == 1) {
		$("#recommendscoreresult1img").html("★");
	} else if (s3 == 2) {
		$("#recommendscoreresult1img").html("★★");
	} else if (s3 == 3) {
		$("#recommendscoreresult1img").html("★★★");
	} else if (s3 == 4) {
		$("#recommendscoreresult1img").html("★★★★");
	} else if (s3 == 5) {
		$("#recommendscoreresult1img").html("★★★★★");
	}
})

$(document).ready(function() {
	var s2=$("#recommendscoreresult2").text();
	var s4=Math.round(s2);
	if (s4 == 1) {
		$("#recommendscoreresult2img").html("★");
	} else if (s4 == 2) {
		$("#recommendscoreresult2img").html("★★");
	} else if (s4 == 3) {
		$("#recommendscoreresult2img").html("★★★");
	} else if (s4 == 4) {
		$("#recommendscoreresult2img").html("★★★★");
	} else if (s4 == 5) {
		$("#recommendscoreresult2img").html("★★★★★");
	}
})
</script>
</html>