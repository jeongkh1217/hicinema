<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="hicinema.reservation.vo.*"%>
<%@page import="hicinema.cart.*"%>
<%@page import="hicinema.snc.vo.*"%>
<%@page import="hicinema.movie.vo.*"%>
<%@page import="hicinema.storelike.vo.*"%>
<%@page import="hicinema.store.*"%>
<%@page import="hicinema.movielike.vo.*"%>
<%@page import="hicinema.member.vo.*"%>
<%@page import="hicinema.community.vo.*" %>
<%@page import="hicinema.communitylike.vo.*" %>
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
<script>
	$(document).ready(
			function() {
				$(".mypagetab-menu a").click(
						function(event) {
							event.preventDefault();
							$(this).addClass("mypagetabactive").parent()
									.siblings().find("a").removeClass(
											"mypagetabactive");
							$($(this).attr("href")).addClass("mypagetabactive")
									.siblings().removeClass("mypagetabactive");
						});
			});
</script>
<body>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin">
				<div class="mypagewrap">
					<div class="mypagesubtitle">마이페이지</div>
					<div class="mypagetab-container">
						<ul class="mypagetab-menu">
							<li><a href="#mypagetab1" class="mypagetabactive">영화 예약
									내역</a></li>
							<li><a href="#mypagetab2">스토어 구매 내역</a></li>
							<li><a href="#mypagetab3">작성한 한줄평</a></li>
							<li><a href="#mypagetab4">찜한 상품</a></li>
							<li><a href="#mypagetab5">영화 "좋아요"</a></li>
							<li><a href="#mypagetab6">커뮤니티 나의 작성글</a></li>
							<li><a href="#mypagetab7">커뮤니티 추천글</a></li>
							<li><a href="#mypagetab8">문의글 확인</a></li>
							<li><a href="#mypagetab9">나의 정보</a></li>
						</ul>
						<div id="mypagetab1" class="mypagetab-content mypagetabactive">
							<div class="mypagereservationwrap">
								<div class="mypagereservationsubtitle">
									<h2>영화 예약 내역</h2>
									<hr>
								</div>
								<div class="mypagereservationcontent">
									<%
										ArrayList<Reservationgetset> a = (ArrayList<Reservationgetset>) request.getAttribute("reservationlist");
										if (a.size() == 0) {
									%>
									<h3 style="text-align: center;"><%="예매내역이 없습니다."%></h3>
									<%
										} else {
											for (int i = 0; i < a.size(); i++) {
												Reservationgetset a2 = a.get(i);
									%>
									<span class="mypagereservationnumber"><b><%=i + 1%></b></span>
									<span class="mypagereservationid"><button type=button
											class="mypagereservationidbtn btn-10"
											value="<%=a2.getReservationid()%>"
											onclick="mypagereservationajax(this.value);"><%=a2.getReservationid()%></button></span><br>
									<%
										}
										}
									%>
								</div>
								<div class="mypagereservationinfo">
									<span class="mypagebothpaytitle"><b>예약번호 : </b></span>
									<span id="mypagereservationinfospan0"></span><br>
									<span class="mypagebothpaytitle"><b>상영관 : </b></span><span
										id="mypagereservationinfospan1"></span><br> <span
										class="mypagebothpaytitle"><b>상영일자 : </b></span><span
										id="mypagereservationinfospan2"></span><br> <span
										class="mypagebothpaytitle"><b>상영시간 : </b></span><span
										id="mypagereservationinfospan3"></span><br> <span
										class="mypagebothpaytitle"><b>결제방법 : </b></span><span
										id="mypagereservationinfospan4"></span><br> <span
										class="mypagebothpaytitle"><b>결제일시 : </b></span><span
										id="mypagereservationinfospan5"></span><br> <span
										class="mypagebothpaytitle"><b>좌석 : </b></span><span
										id="mypagereservationinfospan6"></span>
									<div class="mypagecancelbuttondiv">
									<form name="mypagecancelreservationform" method="POST" action="cancelreservation.hci">
									<input type="hidden" value="" id="reservationidcancelform" name="reservationid">
									<input type="hidden" value="" id="reservationididcancelform" name="id">
										<button type="button" onclick="cancelreservation();" class="custom-btn btn-7">예약취소</button></form>
									</div>									
								</div>
							</div>
						</div>
						<div id="mypagetab2" class="mypagetab-content">
							<div class="mypagepurchasewrap">
								<div class="mypagepurchasesubtitle">
									<h2>스토어 구매 내역</h2>
									<hr>
								</div>
								<div class="mypagepurchasecontent">
									<%
										ArrayList<Cartgetset> c = (ArrayList<Cartgetset>) request.getAttribute("purchaselist");
										if (c.size() == 0) {
									%>
									<h3 style="text-align: center;"><%="구매내역이 없습니다."%></h3>
									<%
										} else {
											for (int i = 0; i < c.size(); i++) {
												Cartgetset c2 = c.get(i);
									%>
									<span class="mypagepurchasenumber"><b><%=i + 1%></b></span> <span
										class="mypagepurchaseid"><button type=button
											class="mypagepurchaseidbtn btn-10"
											value="<%=c2.getPurchaseid()%>"
											onclick="mypagepurchaseajax(this.value);"><%=c2.getPurchaseid()%></button></span><br>
									<%
										}
										}
									%>
								</div>
								<div class="mypagepurchaseinfo">
									<span class="mypagebothpaytitle"><b>구매번호 : </b></span><span
										id="mypagepurchaseinfospan0"></span><br> <span
										class="mypagebothpaytitle"><b>결제방법 : </b></span><span
										id="mypagepurchaseinfospan1"></span><br> <span
										class="mypagebothpaytitle"><b>결제일시 : </b></span><span
										id="mypagepurchaseinfospan2"></span><br> <span
										class="mypagebothpaytitle"><b>구매상품 : </b></span>
									<div id="mypagepurchaseinfoiteminfo"></div>
									<div class="mypagecancelbuttondiv">
										<form name="mypagecancelpurchaseform" method="POST" action="cancelpurchase.hci">
									<input type="hidden" value="" id="purchaseidcancelform" name="purchaseid">
									<input type="hidden" value="" id="purchaseididcancelform" name="id">
										<button type="button" onclick="cancelpurchase();" class="custom-btn btn-7">구매취소</button></form>
									</div>
								</div>
							</div>
						</div>

						<div id="mypagetab3" class="mypagetab-content">
							<div class="mypagesncwrap">
								<div class="mypagesncsubtitle">
									<h2>작성한 한줄평</h2>
									<hr>
								</div>
								<div class="mypagesnccontent">
									<div style="border-bottom:1px solid; overflow-y:auto; ">
						                <span class="mypagesncnumber dpb">　</span>
						                <span class="mypagesnccontentmovietitle dpb">영화 제목</span>
						                <span class="mypagesnccontentcomment dpb">작성한 한줄평</span>						                
						                <span class="mypagesnccontentstarrating dpb" style="text-shadow:none; color:black;">별점</span>
						                <span class="mypagesnccontentwrittendatetime dpb">작성일자</span>
						                <span class="mypagesnccontentcommentlike dpb">좋아요</span>
						            </div>
									<%
									    ArrayList<Moviegetset> m = (ArrayList<Moviegetset>) request.getAttribute("movielist");
									    ArrayList<SnCgetset> s = (ArrayList<SnCgetset>) request.getAttribute("snclist");
									    if (s.size() == 0) {
									%>
									    <h3 style="text-align: center;"><%="등록한 한줄평이 없습니다."%></h3>
									<%
									    } else {
									        for (int i = s.size() - 1; i >= 0; i--) { // 역순으로 반복
									            SnCgetset s2 = s.get(i);
									            Moviegetset m2 = m.get(i);
									%>
									            <div>
									                <span class="mypagesncnumber dpb"><b><%=i + 1%></b></span> <span
									                    class="mypagesnccontentmovietitle dpb"> <a
									                    href="Contr.hic?comm=selectwheremovie&movieid=<%=m2.getMovieid()%>&page=1"><%=m2.getMovietitle()%></a></span>
									                <span class="mypagesnccontentcomment dpb"> <a
									                    href="Contr.hic?comm=selectwheremovie&movieid=<%=m2.getMovieid()%>&page=1"><%=s2.getComment()%></a></span>
									                <span id="mypagesncratingnumber<%=i%>" style="display: none;"><%=s2.getStarrating()%></span>
									                <span class="mypagesnccontentstarrating dpb"
									                    id="mypagesncrating<%=i%>" style="border-top: 1px solid;"></span>
									                <span class="mypagesnccontentwrittendatetime dpb"><%=s2.getWrittendatetime()%></span>
									                <span class="mypagesnccontentcommentlike dpb"> <img
									                    src="assets/img/snclike.png" class="mypagesnclikeimg">
									                    <%=s2.getCommentlike()%></span>
									            </div>
									<%
									        }
									    }
									%>
								</div>
							</div>
						</div>
						<div id="mypagetab4" class="mypagetab-content">
							<div class="mypagestorelikewrap">
								<div class="mypagestorelikesubtitle">
									<h2>찜한 상품</h2>
									<hr>
								</div>
								<div class="mypagestorelikecontent">
									<%
										ArrayList<Storegetset> sgs = (ArrayList<Storegetset>) request.getAttribute("itemnamelist");
										ArrayList<StoreLikegetset> sl = (ArrayList<StoreLikegetset>) request.getAttribute("storelikelist");
										if (sl.size() == 0) {
									%>
									<h3 style="text-align: center;"><%="찜한 상품이 없습니다."%></h3>
									<%
										} else {
											for (int i = 0; i < sl.size(); i++) {
												StoreLikegetset sl2 = sl.get(i);
												Storegetset sgs2 = sgs.get(i);
									%>
									<div class="mypagestorelikeinfowrap">
									<a href="storedetail.jsp?itemid=<%=sl2.getItemid()%>">
										<span class="mypagestorelikenumber dpb"><b><%=i + 1%></b></span>
										<span class="mypagestorelikeitemimg dpb">  <img
												src="assets/img/<%=sl2.getItemid()%>.jpg"
												class="mypagestorelikeimg"></span><span
											class="mypagestorelikeitemname dpb"> <%=sgs2.getItemname()%></span><br>
										<span class="mypagestoreliketiemprice dpb"><%=sgs2.getPrice()%>원</span><br>
									</a>
									</div>
									<%
										}
										}
									%>
								</div>
							</div>
						</div>
						<div id="mypagetab5" class="mypagetab-content">
							<div class="mypagemovielikewrap">
								<div class="mypagemovielikesubtitle">
									<h2>영화 "좋아요"</h2>
									<hr>
								</div>
								<div class="mypagemovielikecontent">
									<%
										ArrayList<Moviegetset> mgs = (ArrayList<Moviegetset>) request.getAttribute("movieliketitlelist");
										ArrayList<Movielikegetset> ml = (ArrayList<Movielikegetset>) request.getAttribute("movielikelist");
										if (ml.size() == 0) {
									%>
									<h3 style="text-align: center;"><%="'좋아요' 영화가 없습니다"%></h3>
									<%
										} else {
											for (int i = 0; i < ml.size(); i++) {
												Movielikegetset ml2 = ml.get(i);
												Moviegetset mgs2 = mgs.get(i);
									%>
									<div class="mypagemovielikeinfowrap">
									 <a	href="Contr.hic?comm=selectwheremovie&movieid=<%=ml2.getMovieid()%>&page=1">
										<span class="mypagemovielikenumber dpb"><b><%=i + 1%></b></span>
										<span class="mypagemovielikemovieimg dpb">										
												<img src="assets/img/<%=ml2.getMovieid()%>.jpg"
												class="mypagemovielikerealimg"></span> <span
											class="mypagemovielikemovietitle dpb"> <b>제목</b> : <%=mgs2.getMovietitle()%></span>
										<br> <span class="mypagemovielikemovietotalview dpb">
											<b>총 관람객</b> : <%=mgs2.getTotalview() %>명
										</span><br> <span class="mypagemovielikemovieratingvalue dpb">
											<b>관람객 평점</b> : <%=mgs2.getRatingvalue() %>
										</span><br>
										</a>
									</div>
									<%
										}
										}
									%>
								</div>
							</div>
						</div>
						<div id="mypagetab6" class="mypagetab-content">
							<div class="mypagecommunity">
								<div class="mypagecommunitysubtitle">
									<h2>커뮤니티 나의 작성글</h2>
									<hr>
								</div>
								<div class="mypagecommunitycontent">
								    <div class="mypagecommunitytable" style="border-bottom:1px solid;">
								        <span class="mypagecommunitynumber dpb">　</span> 
								        <span class="mypagecommunityposttitle dpb">게시글 제목</span>
								        <span class="mypagecommunityviewed dpb">조회수</span>
								        <span class="mypagecommunityrecommend dpb">추천</span>
								        <span class="mypagecommunitywrittendate dpb">작성일자</span>
								    </div>
								    <%
								        ArrayList<Communitygetset> cgs = (ArrayList<Communitygetset>) request.getAttribute("communitylist");
								        if(cgs.size() == 0) {
								    %>
								    <h3 style="text-align: center;"><%="작성한 게시물이 없습니다."%></h3>
								    <%
								        } else {
								            
								            for(int i = cgs.size() - 1; i >= 0; i--) {
								                Communitygetset cgs2 = cgs.get(i);
								    %>
								    <div class="mypagecommunitytable">
								    <a href="communityboarddetail.hci?postno=<%=cgs2.getPostno()%>&page=1">
								        <span class="mypagecommunitynumber dpb"><b><%=i+1 %></b></span> 
								        <span class="mypagecommunityposttitle dpb">[<%=cgs2.getTab()%>]<%=cgs2.getPosttitle() %></span>
								        <span class="mypagecommunityviewed dpb"><%=cgs2.getViewed() %></span>
								        <span class="mypagecommunityrecommend dpb"><%=cgs2.getRecommend() %></span>
								        <span class="mypagecommunitywrittendate dpb"><%=cgs2.getWrittendate() %></span>
								    </a>
								    </div>
								    <%
								            }
								        }
								    %>
								</div>
							</div>
						</div>
						<div id="mypagetab7" class="mypagetab-content">
							<div class="mypagecommunity">
								<div class="mypagecommunitylikesubtitle">
									<h2>커뮤니티 추천글</h2>
									<hr>
								</div>
								<div class="mypagecommunitycontent">
								    <div class="mypagecommunitytable" style="border-bottom:1px solid;">
								        <span class="mypagecommunitylikenumber dpb">　</span>								         
								        <span class="mypagecommunitylikeposttitle dpb">게시글 제목</span>
								        <span class="mypagecommunitylikeid dpb">작성자</span>
								        <span class="mypagecommunitylikeviewed dpb">조회수</span>
								        <span class="mypagecommunitylikerecommend dpb">추천</span>
								        <span class="mypagecommunitylikewrittendate dpb">작성일자</span>
								    </div>
								    <%
								        ArrayList<Communitygetset> cgs2 = (ArrayList<Communitygetset>) request.getAttribute("communitylikelist");
								        if(cgs2.size() == 0) {
								    %>
								    <h3 style="text-align: center;"><%="추천한 게시물이 없습니다."%></h3>
								    <%
								        } else {
								            
								            for(int i = cgs2.size() - 1; i >= 0; i--) {
								                Communitygetset cgs3 = cgs2.get(i);
								    %>
								    <div class="mypagecommunitytable">
								    <a href="communityboarddetail.hci?postno=<%=cgs3.getPostno()%>&page=1">
								        <span class="mypagecommunitylikenumber dpb"><b><%=i+1 %></b></span>								        
								        <span class="mypagecommunitylikeposttitle dpb">[<%=cgs3.getTab()%>]<%=cgs3.getPosttitle() %></span>
								        <span class="mypagecommunitylikeid dpb"><%=cgs3.getId() %></span> 
								        <span class="mypagecommunitylikeviewed dpb"><%=cgs3.getViewed() %></span>
								        <span class="mypagecommunitylikerecommend dpb"><%=cgs3.getRecommend() %></span>
								        <span class="mypagecommunitylikewrittendate dpb"><%=cgs3.getWrittendate() %></span>
								    </a>
								    </div>
								    <%
								            }
								        }
								    %>
								</div>
								
							</div>
						</div>
						<div id="mypagetab8" class="mypagetab-content">
							<div class="mypagecommunity">
								<div class="mypagecommunitysubtitle">
									<h2>문의글 확인</h2>
									<hr>
								</div>
								
							</div>
						</div>
						<div id="mypagetab9" class="mypagetab-content">
							<div class="mypagemyinfowrap">
								<div class="mypagemyinfosubtitle">
									<h2>나의 정보</h2>
									<hr>
								</div>
								<div class="mypagemyinfocontent">
									<%
										ArrayList<Membergetset> mem = (ArrayList<Membergetset>) request.getAttribute("memberdetaillist");
										if (mem.size() == 0) {
									%>
									<h3 style="text-align: center;">어떻게오셨어요?</h3>
									<%
										} else {											
									Membergetset mem2 = mem.get(0);
									%>
									<ul>
										<li><span class="mypagemyinfonamespan"><%=mem2.getName() %></span><span>님
												안녕하세요</span></li>
										<li><span><%=mem2.getId() %>님의 보유 포인트 : <%=mem2.getPoint() %>P</span>
										<button type="button" class="mypagevoucherregi btn-11">금액권
												등록하기</button></li>
										<li><span><%=mem2.getId() %>님의 가입일 : <%=mem2.getJoindate() %></span></li>
									</ul>
									<div class="mypagemyinfoupdatedeletebtnwrap">
										<button type="button" class="mypagevoucherregi2 btn-15">나의
											정보 수정하기</button>
										<button type="button" class="mypagevoucherregi2 btn-16">회원
											탈퇴</button>
									</div>
									<%
										
										}
									%>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	</div>
	<c:if test="${not empty mypagecancel}">
 ${mypagecancel}
				</c:if>
</body>
<script>
function cancelreservation() {
	var reid = $("#mypagereservationinfospan0").text();
	var id = '<%=(String) session.getAttribute("s_id")%>';
	$("#reservationidcancelform").val(reid);	
	$("#reservationididcancelform").val(id);
	cancelreservationsubmit();
}

function cancelpurchase() {
	var purid = $("#mypagepurchaseinfospan0").text();
	var id = '<%=(String) session.getAttribute("s_id")%>';
	$("#purchaseidcancelform").val(purid);	
	$("#purchaseididcancelform").val(id);
	cancelpurchasesubmit();
}
function cancelreservationsubmit() {
	document.forms["mypagecancelreservationform"].submit();	
}
function cancelpurchasesubmit() {
	document.forms["mypagecancelpurchaseform"].submit();	
}
function mypagereservationajax(rid) {
    $.ajax({
        type: 'POST',
        data: {
            "reservationid": rid,
        },
        url: "mpagereservationajax.hci",
        async: false,
        success: function (result) {
        	var realresult = result.replace(/\r\n/g, "");
        	var realrealresult = realresult.trimStart();
			var splitresult = realrealresult.split('@A');
			for(var i=0;i<splitresult.length;i++) {
				$("#mypagereservationinfospan"+i).text(splitresult[i]);
				
			}             
        },        
    });
}

function mypagepurchaseajax(pid) {
	$.ajax({
		type : 'POST',
		data : {
			"purchaseid" : pid,
		},
		url : "mpagepurchaseajax.hci",
		async : false,
		success : function(result) {
			var realresult = result.replace(/\r\n/g, "");
			var realrealresult = realresult.trimStart();
			var splitresult = realrealresult.split('@A');
			for (var i = 0; i < 3; i++) {
				$("#mypagepurchaseinfospan" + i).text(splitresult[i]);
			}
			var splitresult2 = splitresult[3].split('@C');
			$("#mypagepurchaseinfoiteminfo").html("");
			for (var i = 0; i < splitresult2.length - 1; i++) {
				var splitresult3 = splitresult2[i].split('@B');
				var oddElements = [];
				var evenElements = [];
				for (var j = 0; j < splitresult3.length; j++) {
					if (j % 2 === 0) {
						evenElements.push(splitresult3[j]);
					} else {
						oddElements.push(splitresult3[j]);
					}
				}
				var divEven = $("<div>").addClass(
						"mypagepurchaseinfoitemname");
				divEven.html("<span>" + evenElements.join('</span><span>')
						+ "</span>");
				$("#mypagepurchaseinfoiteminfo").append(divEven);

				var divOdd = $("<div>").addClass(
						"mypagepurchaseinfoitemquantity");
				divOdd.html("<span>" + oddElements.join('</span><span>')
						+ "</span>");
				$("#mypagepurchaseinfoiteminfo").append(divOdd);
			}

		},
	});
}
$(document).ready(
		function() {
			for (i = 0; i <<%=s.size()%>
; i++) {
				const rating = document
						.getElementById("mypagesncratingnumber" + i);
				let srating = rating.innerText;
				let starrating = parseInt(srating);
				const starcomstarrating = document
						.getElementById("mypagesncrating" + i);
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
</script>
</html>