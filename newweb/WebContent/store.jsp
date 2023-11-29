<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="hicinema.store.*"%>
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
<script src="js/store.js"></script>
</head>
<body>
	<%
	String orderby = request.getParameter("orderby");
	%>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin" style="height: auto;">
				<div class="storesubtitle">
					<b>스토어</b></div>
					<div class="storecate bgkk">
						<ul class="storetabs">
							<li class="tab-link current" data-tab="tab-storeall">전체</li>
							<li class="tab-link" data-tab="tab-combo">콤보</li>
							<li class="tab-link" data-tab="tab-snack">스낵</li>
							<li class="tab-link" data-tab="tab-drink">음료</li>
							<li class="tab-link" data-tab="tab-voucher">상품권</li>
						</ul>
					</div>
					<div class="storeselectsubmit">
						<input type="text" id="storeorderbyforchecktext"
							value="<%=orderby%>" style="display: none;"> 
							<select class="storeorderby" id="storeorderbyselectbox">
							<option
								value="http://localhost:8080/newweb/store.jsp?orderby=category%20desc">카테고리순</option>
							<option
								value="http://localhost:8080/newweb/store.jsp?orderby=price%20asc">낮은가격순</option>
							<option
								value="http://localhost:8080/newweb/store.jsp?orderby=totalsales">판매량순</option>
						</select>
						<button type="button" class="storeorderbybtn btn-8 custom-btn2"
							onclick="storeorderby()">GO</button>
					</div>
					<jsp:useBean id="id" class="hicinema.store.Storeall">
						<div id="tab-storeall" class="tab-content current">
							<%
							ArrayList<Storegetset> storeall = id.storeall(orderby);
							%>
							<div class="cntnsWrap">
								<div class=" h350">
									<%
									for (int i = 0; i < storeall.size(); i++) {
										Storegetset storeall2 = storeall.get(i);
									%>
									<div class='storedbimage storetabmg  storefordivload' >
										<div class='goods'>
											<img class='storeimg storehover'
												src='assets/img/<%=storeall2.getItemid()%>.jpg'>
											<div class='storename'><%=storeall2.getItemname()%></div>
											<div class='storeprice'>
												&#8361;<%=storeall2.getPrice()%></div>
											<div class='storebutton'>
												<div class='storemoreview'>
													<a href='storedetail.jsp?itemid=<%=storeall2.getItemid()%>'
														class='more'>상세보기</a>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
							<br>
							<div class="storedivloadbtnwrap"><a href="#" id="storealldivload">더 보기</a></div>
					<div style="height:15px;"></div>
						</div>						
					</jsp:useBean>
					<jsp:useBean id="id2" class="hicinema.store.Storecombo">
						<div id="tab-combo" class="tab-content">
							<%
							ArrayList<Storegetset> storecombo = id2.storecombo(orderby);
							%>
							<div class="cntnsWrap">
								<div class="h350">
									<%
									for (int i = 0; i < storecombo.size(); i++) {
										Storegetset storecombo2 = storecombo.get(i);
									%>
									<div class='storedbimage storetabmg'>
										<div class='goods'>
											<img class='storeimg storehover'
												src='assets/img/<%=storecombo2.getItemid()%>.jpg'>
											<div class='storename'><%=storecombo2.getItemname()%></div>
											<div class='storeprice'>
												&#8361;<%=storecombo2.getPrice()%></div>
										</div>
										<div class='storebutton'>
											<div class='storemoreview'>
												<a
													href='storedetail.jsp?itemid=<%=storecombo2.getItemid()%>'
													class='more'>상세보기</a>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</jsp:useBean>
					<jsp:useBean id="id3" class="hicinema.store.Storesnack">
						<%
						ArrayList<Storegetset> storesnack = id3.storesnack(orderby);
						%>
						<div id="tab-snack" class="tab-content">
							<div class="cntnsWrap">
								<div class=" h350">
									<%
									for (int i = 0; i < storesnack.size(); i++) {
										Storegetset storesnack2 = storesnack.get(i);
									%>
									<div class='storedbimage storetabmg'>
										<div class='goods'>
											<img class='storeimg storehover'
												src='assets/img/<%=storesnack2.getItemid()%>.jpg'>
											<div class='storename'><%=storesnack2.getItemname()%></div>
											<div class='storeprice'>
												&#8361;<%=storesnack2.getPrice()%></div>
										</div>
										<div class='storebutton'>
											<div class='storemoreview'>
												<a
													href='storedetail.jsp?itemid=<%=storesnack2.getItemid()%>'
													class='more'>상세보기</a>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</jsp:useBean>
					<jsp:useBean id="id4" class="hicinema.store.Storedrink">
						<%
						ArrayList<Storegetset> storedrink = id4.storedrink(orderby);
						%>
						<div id="tab-drink" class="tab-content">
							<div class="cntnsWrap">
								<div class="h350">
									<%
									for (int i = 0; i < storedrink.size(); i++) {
										Storegetset storedrink2 = storedrink.get(i);
									%>
									<div class='storedbimage storetabmg'>
										<div class='goods'>
											<img class='storeimg storehover'
												src='assets/img/<%=storedrink2.getItemid()%>.jpg'>
											<div class='storename'><%=storedrink2.getItemname()%></div>
											<div class='storeprice'>
												&#8361;<%=storedrink2.getPrice()%></div>
										</div>
										<div class='storebutton'>
											<div class='storemoreview'>
												<a
													href='storedetail.jsp?itemid=<%=storedrink2.getItemid()%>'
													class='more'>상세보기</a>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</jsp:useBean>
					<jsp:useBean id="id5" class="hicinema.store.Storevoucher">
						<%
						ArrayList<Storegetset> storevoucher = id5.storevoucher(orderby);
						%>
						<div id="tab-voucher" class="tab-content">
							<div class="cntnsWrap">
								<div class="h350">
									<%
									for (int i = 0; i < storevoucher.size(); i++) {
										Storegetset storevoucher2 = storevoucher.get(i);
									%>
									<div class='storedbimage storetabmg'>
										<div class='goods'>
											<img class='storeimg storehover'
												src='assets/img/<%=storevoucher2.getItemid()%>.jpg'>
											<div class='storename'><%=storevoucher2.getItemname()%></div>
											<div class='storeprice'>
												&#8361;<%=storevoucher2.getPrice()%></div>
										</div>
										<div class='storebutton'>
											<div class='storemoreview'>
												<a
													href='storedetail.jsp?itemid=<%=storevoucher2.getItemid()%>'
													class='more'>상세보기</a>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</jsp:useBean>				
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
$(function () {
	$(".storefordivload").slice(0,10).show();
	$("#storealldivload").click(function(e){
		e.preventDefault();
		$(".storefordivload:hidden").slice(0,5).show();
		if($(".storefordivload:hidden").length == 0 ){
			$("#storealldivload").hide();
		}
	});
});
	$(document)
			.ready(
					function() {
						var ordercheck = document
								.getElementById("storeorderbyforchecktext").value;
						if (ordercheck == "category desc") {
							$("#storeorderbyselectbox")
									.val(
											'http://localhost:8080/newweb/store.jsp?orderby=category%20desc')
									.prop("selected", true);
						} else if (ordercheck == "price asc") {
							$("#storeorderbyselectbox")
									.val(
											'http://localhost:8080/newweb/store.jsp?orderby=price%20asc')
									.prop("selected", true);
						} else if (ordercheck == "totalsales") {
							$("#storeorderbyselectbox")
									.val(
											'http://localhost:8080/newweb/store.jsp?orderby=totalsales')
									.prop("selected", true);
						}
					})
function storeorderby() {
		var href = $("#storeorderbyselectbox").val();
		location.href=href;		
	}
					
					
</script>
</html>
