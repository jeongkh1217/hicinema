<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hicinema.cart.*"%>
<%@page import="hicinema.store.*"%>
<%@page import="hicinema.member.*"%>
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
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin2">
			<div class="cartpurchasewrap">
				<div class="cartpurchaseconfirmsubtitle">
					<b>스토어 결제</b>
					<hr>
				</div>
				<div class="cartpurchaseconfirmcontent">
					<jsp:useBean id="cart" class="hicinema.cart.Cartselect">
						<jsp:useBean id="storeselect" class="hicinema.store.Storetable">
							<jsp:useBean id="member"
								class="hicinema.member.Purchaseconfirmmemberpoint">
								<div class="cartcontenttitle">
									<span class="cartimage">이미지</span> <span class="cartname">이름</span>
									<span class="cartprice1">가격</span> <span class="cartquantity">수량</span>
									<span class="cartprice">금액</span> <span class="cartdelete"></span>
								</div>
								<%
								String id = (String) session.getAttribute("s_id");
										ArrayList<Cartgetset> carttable = cart.cartselect(id);
										int point = member.pointselect(id);										
										for (int i = 0; i < carttable.size(); i++) {
											Cartgetset cart2 = carttable.get(i);
											String itemidlist = cart2.getItemid();
											ArrayList<Storegetset> store = storeselect.storesearch(itemidlist);
											Storegetset store2 = store.get(0);											
							%>
								<div class="cartcontentcontent">
									<span class="cartimage"> <img class="cartimg" src="assets/img/<%=store2.getItemid()%>.jpg"></span> 
									<span class="cartname cartcontenttext"><%=store2.getItemname()%></span>
									<span class="cartprice1 cartcontenttext " id="cartpurchaseprice<%=i%>"><%=store2.getPrice()%></span> 
									<span class="cartquantity cartcontenttext" id="cartpurchasequantity<%=i%>"><%=cart2.getQuantity()%></span>
									<span class="cartprice cartcontenttext cartforcalculprice" id="cartpurchasetotalprice<%=i%>"></span>
								</div>
								<%
								}
								%>
								<script>
                                $(document).ready(function() {
                                    var total = 0;
                                    for (i = 0; i <<%=carttable.size()%>; i++) {
									var price = $("#cartpurchaseprice"+ i).text();
									var quantity = $("#cartpurchasequantity"+ i).text();
									var totalprice = parseInt(price) * parseInt(quantity);
									$("#cartpurchasetotalprice"+ i).text(totalprice);
									total += totalprice;
									}
									$("#cartpurchaseinfofirstprice").text(total);
									$("#cartpurchaseinfosecondprice").text(total);
								 });
								</script></div>
				<div style="height:30px; border-top:1px solid;"></div>				
				<div class="cartpurchaseinfowholewrap">
				<div class="cartpurchasetotalpriceresult" id="cartpurchasetotalpriceresult">
				<span>총 금액 : </span><span id="cartpurchaseinfofirstprice"></span><span>원</span></div>
				<div class="cartpurchasepayinfo">
					<span>결제방법 : </span> 
					<select id="cartpurchasepayMethod">
						<option value="card" selected>카드</option>
						<option value="account">무통장입금</option>
						<option value="phone">휴대폰</option>
					</select><br> 
					<span>보유 포인트 : </span><span class="cartpurchaseinfopaypoint" id="cartpurchaseinfopaypoint"><%=point%></span><span>P</span><input type="button" onclick="pointcalcul();" value="포인트 적용"><br>
					<span>최종 가격 : </span><span id="cartpurchaseinfosecondprice"></span><span>원</span>
					</div>
					<div class="cartpurchasepaysubmitbtndiv">
					<button type="button" onclick="cartpurchasebeforesubmit();" class="btn-112 custom-btn5">결제</button></div>
					</jsp:useBean>
					</jsp:useBean>
					</jsp:useBean>
				</div>
			</div>
			<div class="cartpurchasehiddendiv" style="display:none;">
			<form name="cartpurchaserealform" method="post" action="cartpurchase.jsp">
			<input type="hidden" name="id" id="cartpurchaseformid" value='<%=(String) session.getAttribute("s_id")%>'>
			<input type="hidden" name="payby" id="cartpurchaseformpayby">
			<input type="hidden" name="minuspoint" id="cartpurchaseformminuspoint">
			<input type="hidden" name="pluspoint" id="cartpurchaseformpluspoint">			
			</form></div></div></div>
			
			
			<div id="footer"></div>
		
	</div>
</body>
<script>
var pointCalculated = false;

function pointcalcul() {
    if (pointCalculated) {
        return;
    }
    var pointText = $("#cartpurchaseinfopaypoint").text();
    var priceText = $("#cartpurchaseinfofirstprice").text();
    var point = parseInt(pointText) || 0;
    var price = parseInt(priceText) || 0;
    if (price === 0 || isNaN(price) || isNaN(point)) {
        return;
    } else {
        if (point >= price) {
            $("#cartpurchaseinfosecondprice").text("0");
            $("#cartpurchaseinfopaypoint").text(point - price);
            $("#cartpurchaseformminuspoint").val(price);
            $("#cartpurchaseformpluspoint").val(Math.floor(0.02 * parseInt($("#cartpurchaseinfosecondprice").text())));
        } else {
            $("#cartpurchaseinfosecondprice").text(price - point);
            $("#cartpurchaseinfopaypoint").text("0");
            $("#cartpurchaseformminuspoint").val(point);
            $("#cartpurchaseformpluspoint").val(Math.floor(0.02 * parseInt($("#cartpurchaseinfosecondprice").text())));
        }
        pointCalculated = true;
    }
}





function cartpurchasebeforesubmit() {
    var selectedValue = $("#cartpurchasepayMethod").val();
    $("#cartpurchaseformpayby").val(selectedValue);
    $("#cartpurchaseformpluspoint").val(Math.floor(0.02 * parseInt($("#cartpurchaseinfosecondprice").text())));
    paymentsubmit();
    
}
function paymentsubmit() {
	document.forms["cartpurchaserealform"].submit();
}


</script>
</html>