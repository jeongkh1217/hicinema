<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="hicinema.cart.*"%>
<%@ page import="hicinema.store.*"%>
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
<jsp:useBean id="cart" class="hicinema.cart.Cartselect">
	<jsp:useBean id="storeselect" class="hicinema.store.Storetable">
		<div class="allwrap">
			<div class="sbfooterwrap" style="min-height:794px;" >
				<div id="header"></div>
				<div class="bodymargin">
					<div class="cartwrap">
						<div class="cartsubtitle"><b>장바구니</b></div>
						<hr>
						<div class="cartcontent">
							<div class="cartcontenttitle">
								<span class="cartimage">이미지</span> <span class="cartname">이름</span>
								<span class="cartprice1">가격</span> <span class="cartquantity">수량</span>
								<span class="cartprice">금액</span> <span class="cartdelete"></span>
							</div>
							<%
							String id = (String) session.getAttribute("s_id");
							ArrayList<Cartgetset> carttable = cart.cartselect(id);
							for (int i = 0; i < carttable.size(); i++) {								
								Cartgetset cart2 = carttable.get(i);
								String itemidlist = cart2.getItemid();
								ArrayList<Storegetset> store = storeselect.storesearch(itemidlist);
								Storegetset store2 = store.get(0);
							%>
							<div class="cartcontentcontent">
								<form name="<%=store2.getItemid()%>quantityupdate" action="cartupdate.jsp" method="post">
									<span style="display: none;"> 
									<input type="text" name="itemid" id="cart<%=i%>updateitemid" value="<%=store2.getItemid()%>">						
									<input type="text" name="id" value="<%=id%>"></span> 
									<span class="cartimage">
									<img class="cartimg" src="assets/img/<%=store2.getItemid()%>.jpg"></span>
									<span class="cartname cartcontenttext"><%=store2.getItemname()%></span>
									<span class=" cartprice1 cartcontenttext " id="cartprice<%=i%>"><%=store2.getPrice()%></span>
									<span class="cartquantity cartcontenttext"> 
									<input type="number" class="cartquantitytext" name="quantity" id="cart<%=i%>updatequantity"  value="<%=cart2.getQuantity() %>">
									<button type="button"  onClick="quantitycheck(this.id)" class="custom-btn3 btn-16"id="cart<%=i%>update">수정</button></span> 
									<span class="cartprice cartcontenttext cartforcalculprice" id="carttotalprice<%=i%>"></span> 
									<span class="cartdelete">
									<button type="button"class="custom-btn3 btn-15" style="margin-top: 37px;" onClick="deletecart(this.id)" id="cart<%=i%>delete">삭제</button></span>
								</form>
								<div class="cartdeleteformdiv" style="display:none;">
								<form name="<%=store2.getItemid()%>delete" action="cartdelete.jsp" method="post">
								<input type="text" name="itemid" id="cart<%=i%>deleteitemid" value="<%=store2.getItemid()%>">
								<input type="text" name="id"  value="<%=id %>">								
								</form>
								<form name="alldeleteform" method="post" action="cartalldelete.jsp">
								<input type="text" name="id" value="<%=id %>">
								</form>
								<form name="purchaseform" method="post" action="cartpurchasepage.jsp">
								<input type="text" name="id" value="<%=id %>">
								</form>
							</div></div><% } %>
						</div>
						<div
							style="border-top: 1px solid; width: 100%; display: flow-root;">
						</div>
						<div class="carttotalpricediv">
						<div class="carttotalpricedivwrap">
						<span>총금액:</span><span id="totalpricecalcul"></span></div>
						<div class="cartbtnwrap">					
						<button type="button"  class="custom-btn4 btn-13" onclick="cartalldelete();">전체삭제</button>
						<button type="button" class="custom-btn4 btn-14" onclick="cartpurchase(); ">구매</button></div>
						</div>
						<div>									
					</div>
				</div>
			</div>
			</div>
			<div id="footer"></div>
		</div>
		<script>	
$(document).ready(function(){
	for(i=0;i<<%=carttable.size() %>; i++) {
			let price = document
					.getElementById("cartprice" + i).innerText;
			let rprice = parseInt(price);
			let quantity = document
					.getElementById("cart" + i
							+ "updatequantity").value;
			document.getElementById("carttotalprice"
					+ i).innerText = rprice * quantity;
		}	
	totalpricecalcul();
	})
function totalpricecalcul() {
	var sum=0;
	for(i=0;i<<%=carttable.size() %>; i++) {
		let price = document.getElementsByClassName("cartforcalculprice");	
		var arr = [];
		arr[i] = parseInt(price[i].innerText);
		sum +=arr[i];
		$("#totalpricecalcul").text(sum);
	}	
}	
function maxLengthCheck(object) {
	if (object.value.length > 1) {
		object.value = object.value.slice(1, object.maxLength);
	}
}
function quantitycheck(btnid) {
	var quantity = document.getElementById(btnid + "quantity").value;
	var itemid = document.getElementById(btnid + "itemid").value;
	if (quantity<1 || quantity>9) {
		alert("1부터 9까지 입력해주세요");
		return;
	} else {
		alert("수량 수정되었습니다.");
		document.forms[itemid + "quantityupdate"].submit();
	}
}
function deletecart(btnid) {
	var itemid= document.getElementById(btnid + "itemid").value;
	document.forms[itemid+"delete"].submit();
}
function cartalldelete() {
	document.forms["alldeleteform"].submit();
}
function cartpurchase() {
	document.forms["purchaseform"].submit();;
}
		</script>
	</jsp:useBean>
</jsp:useBean>
</body>
</html>