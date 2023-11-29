<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="hicinema.store.Storegetset"%>
<%@ page import="hicinema.store.Storetable"%>

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
	<jsp:useBean id="id" class="hicinema.store.Storetable">
		<%String itemid = request.getParameter("itemid");
		ArrayList<Storegetset> a = id.storesearch(itemid);%>
		<%for(Storegetset sd:a) { %>
		<div class="allwrap">
			<div class="sbfooterwrap">
				<div id="header"></div>
				<div class="bodymargin2">
					<div class="storedetailsubtitle">
						<b><%=sd.getItemname()%></b></div>
						<div class="storedetailwrapdiv">
						<div class="storeimgdetailwrap">
							<div class="storedetailimgdiv">
								<img class='storedetailimg'
									src='assets/img/<%=sd.getItemid() %>.jpg'>
								<div class="storebuttonwrap">
									<button type=button class="storedetailbtn" id="storelike"
										onclick="insertstorelike()">
										<img src="assets/img/nofillstar.png" class="storedetailbtnimg">
									</button>
									<button type=button class="storedetailbtn" id="storeunlike"
										onclick="deletestorelike()">
										<img src="assets/img/fillstar.png" class="storedetailbtnimg">
									</button>
									<button type=button class="storedetailbtn" id="gotocart"
										onclick="checkcart();">
										<img src="assets/img/cart.png" class="storedetailbtnimg">
									</button>
								</div>
							</div>
							<div class="storeintro">
								<span id="storepricetitle">가격</span><br> <br> <span
									id="storecomtitle">구성</span><br> <br> <span
									id="expdatetitle">유효기간</span><br> <br> <span
									id="origintitle">원산지</span><br> <br> <span
									id="storedetailquantity">수량</span>
								<div id="priceresulttitle">
									<br>총금액
								</div>
							</div>
							<div class="storedetaildbresult">
								<span id="storeprice"> <%=sd.getPrice() %>
								</span><br>
								<br> <span id="storecom"> <%=sd.getComposition() %>
								</span><br>
								<br> <span id="expdate">구입일로부터 6개월 </span><br>
								<br> <span id="origin"> <%=sd.getOrigin()%></span><br>
								<br> <span id="storedetailquantity">
									<div style="display: flex; text-align: left;">
										<input type='button' class="btn25x25 custom-btn btn-7"
											onclick='count("plus")' value='+' style="width: 25px" />
										<div id='result' style="margin: 0 20px;">1</div>
										<input type='button' class="btn25x25 custom-btn btn-7"
											onclick='count("minus")' value='-' style="width: 25px" />
									</div>
								</span>
								<div id="priceresult" style="margin: 25px 0 0 0">
									<%=sd.getPrice()%>
								</div>
							</div>
						</div>
						<div class="storegoodsintroducewrap">
							<hr>
							<br>
							<div class="storegoodsintroduce">
								<%=sd.getIntroduce()%>
							</div>
							<div class="hiddenform" style="display: none">
								<form action="cartinsert.jsp" id="forcarthiddenform">
									<input type="text"  name="id"  id="forcartid"  value=<%=(session).getAttribute("s_id")%>> 
									<input type="text"  id="forcartitemid" name="itemid"  value="<%=sd.getItemid()%>"> 
									<input type="text" id="forcartquantity" name="quantity">
								</form>
							</div>
							<hr>
						</div>
						<script>
							function count(type) {
								const resultElement = document
										.getElementById('result');
								const priceElement = document
										.getElementById("storeprice");
								const priceresultElement = document
										.getElementById("priceresult");
								let number = resultElement.innerText;
								let totalprice = priceresultElement.innerText;
								let price = priceElement.innerText;
								if (type === 'plus') {
									number = parseInt(number) + 1;
									totalprice = parseInt(totalprice)
											+ parseInt(price);
									 if (number==10) {
										alert("최대 구매수량은9개입니다.");
										number = 9;
										totalprice = <%=sd.getPrice()%>*9;
									}
								} else if (type === 'minus') {
									number = parseInt(number) - 1;
									totalprice = parseInt(totalprice)
											- parseInt(price);
									if (number == 0) {
										alert("1개 이상 선택해주세요.");
										number = 1;
										totalprice = <%=sd.getPrice()%>;
									} 
								}
								resultElement.innerText = number;
								priceresultElement.innerText = totalprice;
							}
						</script>
						<div class="storedetailtnc">
							<h3>이용안내</h3>
							<ul class="uldot">
								<li>매점상품 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.</li>
								<li>구매 후 전송받으신 기프트콘은,
									<ul class="uldot2">
										<li>사용가능한 HiCinema의 매점에서 지정된 해당 상품으로만 교환이 가능합니다.</li>
										<li>해당 상품 내에서 팝콘 혹은 음료, 스낵 변경 시 추가 비용이 발생합니다.</li>
										<li>교환 완료한 상품의 환불 및 반품은 불가합니다.</li>
									</ul>
								<li>유효기간 연장을 신청하는 경우,
									<ul class="uldot2">
										<li>유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시
											3개월(92일) 단위로 유효기간이 연장됩니다.</li>
										<li>단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장이 불가할 수 있습니다.</li>
										<li>유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.</li>
									</ul>
								<li>상기 이미지는 실제와 다를 수 있습니다.</li>
							</ul>
							<br>
							<h3>취소/환불</h3>
							<ul class="uldot">
								<li>구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간
									만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.</li>
								<li>단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다.</li>
								<li><b>결제취소/환불 방법</b>
									<ul class="uldot2">
										<li>결제취소는 웹>마이페이지>결제내역조회>스토어의 해당주문 상세내역에서 가능합니다. 단 이 때,
											본인 확인 절차가 진행됩니다.</li>
									</ul>
								<li>수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한
									안내가 이루어집니다.</li>
								<li>결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다.</li>
								<li>HiCinema고객센터 010-3174-3284</li>
							</ul>
							<br>
							<h3>미성년자 권리보호 안내</h3>
							<ul class="uldot">
								<li>미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인
									또는 법정대리인이 그 계약을 취소할 수 있습니다.</li>
							</ul>
							<br>
							<h3>분쟁 해결</h3>
							<ul class="uldot">
								<li>회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해의 보상 등에 관한 처리를 위하여
									HiCinema고객센터(010-3174-3284)를 설치 운영하고 있습니다.</li>
								<li>회사는 고객센터를 통하여 이용자로부터 제출되는 불만사항 및 의견을 처리합니다. 다만, 신속한 처리가
									곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.</li>
								<li>전자상거래 분쟁(청약철회등)과 관련한 이용자의 피해구제는 이용약관 및 전자상거래법 등 관련 법령에
									따릅니다.</li>
							</ul>
						</div>
					</div>
				</div>
				</div>
			
			<div id="footer"></div>
		</div>
	</jsp:useBean>
	<%
		}
	%>
</body>
<script>
$(document).ready(function(){
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var itemid =document.getElementById("forcartitemid").value;
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"itemid":itemid,
				"id":id},
				url:"storedetaillikeajax.jsp",
			async:false,
			success:function(cnt) {
				if(cnt==0||id=='null'||id==null||id=="") {
					$("#storelike").show();
					$("#storeunlike").hide();
				} else {
					$("#storelike").hide();
					$("#storeunlike").show();
				}
			}
		});
	})
})

function insertstorelike() {
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var itemid =document.getElementById("forcartitemid").value;
	if(id=='null'||id==null||id==""){
		openLoginpop();
		return;
	} else {
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"itemid":itemid,
					"id":id},
					url:"storedetailinsertlikeajax.jsp",
				async:false,
				success:function(cnt) {					
						$("#storelike").hide();
						$("#storeunlike").show();
						alert("관심있는 상품 등록되었습니다.");
					}
				}
			);
		})		
	}}	
function deletestorelike() {
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var itemid =document.getElementById("forcartitemid").value;
		$(function (){
			$.ajax({
				type:'POST',
				data:{
					"itemid":itemid,
					"id":id},
					url:"storedetaildeletelikeajax.jsp",
				async:false,
				success:function(cnt) {					
						$("#storelike").show();
						$("#storeunlike").hide();
						alert("관심있는 상품 해제되었습니다.");
					}
				}
			);
		})	
}
function checkcart() {
	var itemid=$("#forcartitemid").val()
	var id = "<%=(String) session.getAttribute("s_id")%>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"id":id,
				"itemid":itemid
				},
				url:"cartcheck.jsp",
			async:false,
			success:function(result) {
				if(result==0) {
					gocart();
				} else {
					alert("장바구니에 해당 상품이 존재합니다.");
				}
		
			}}
		);
	})
}
function gocart() {
	var goodsquantity = document.getElementById('result');
	var quantity=goodsquantity.innerText;
	var userid = '<%=(String) session.getAttribute("s_id")%>';
		if (s_id == 'null' || s_id == "") {
			openLoginpop();
			alert("로그인해주세요");
			return;
		} else { 
		document.getElementById("forcartquantity").value = quantity;
		document.forms['forcarthiddenform'].submit();
		alert("장바구니에 추가되었습니다.");
}	}
</script>
</html>