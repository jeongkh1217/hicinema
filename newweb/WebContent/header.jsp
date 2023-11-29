<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<%
		String s_id = (String) session.getAttribute("s_id");
		String s_pw = (String) session.getAttribute("s_pw");
		String result = (String) session.getAttribute("result");
		if (result == "1") {
			out.println("<script>");
			out.println("alert('비밀번호를 확인해주세요')");
			out.println("</script>");
			session.removeAttribute("result");
		} else if (result == "2") {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.')");
			out.println("</script>");
			session.removeAttribute("result");
		} else if (result == "0") {
			session.setAttribute("s_id", s_id);
			session.setAttribute("s_pw", s_pw);
		}
		session.removeAttribute("result");
	%>

	<div class="header" style="border-bottom: 2px solid red;">
		<div class="naviwrap">
			<div class="logodiv">
				<a href="http://localhost:8080/newweb/index.jsp"><img
					class="logo" src="assets/img/logo.jpg"></a>
			</div>
			<div class="naviga">
				<div class="navi2">
					<div id="navi2cs" class="navi2menu">
						<span class="gdSp"><a
							href="http://localhost:8080/newweb/cs.jsp"
							style="text-decoration: none;"> <img src="assets/img/cs.png"
								class="header1img"><br>고객센터
						</a></span>
					</div>
					<div id="navi2mypage" class="navi2menu">
						<span class="gdSp"><a href="#"
							style="text-decoration: none;" id="mypageicon"> <img
								src="assets/img/mypage.png" class="header1img"><br>마이페이지
						</a></span>
					</div>
					<div id="navi2cart" class="navi2menu">
						<span class="gdSp"><a href="#"
							style="text-decoration: none;" id="carticon"> <img
								src="assets/img/cart.png" class="header1img"><br>장바구니
						</a></span>
					</div>
					<div id="navi2loginlogout" class="navi2menu">
						<span class="gdSp joinlogin" id="headerloginbtn"><a
							href="javscript:void(0)" onclick="javascript:openLoginpop()"
							style="text-decoration: none;"> <img src="assets/img/cs.png"
								class="header1img"><br>로그인
						</a></span> <span class="gdSp hellologout" id="headerlogoutbtn"><a
							href="logout.jsp" style="text-decoration: none;"> <img
								src="assets/img/logout.png" class="header1img"><br>로그아웃
						</a></span>
					</div>
					<div id="navi2joinhello" class="navi2menu">
						<span class="gdSp joinlogin" id="headerjoinbtn"><a
							href="http://localhost:8080/newweb/termsandconditions.jsp"
							style="text-decoration: none;"> <img
								src="assets/img/join.png" class="header1img"><br>회원가입
						</a></span> <span class="gdSp hellologout" id="headerhello"><%=s_id%>
							님 안녕하세요</span>
					</div>
				</div>
			</div>
			<div class="logoopdiv"></div>
			<div class="naviga">
				<div class="w100 jstCentr">
					<div class="mainmenuwrap">
						<span class="navi1menu"><a
							href="Contr.hic?comm=selectmovie&orderby=totalview"
							style="text-decoration: none;"> <b>영화 정보</b>
						</a></span>

					</div>
					<div class="mainmenuwrap">
						<span class="navi1menu"><a
							href="http://localhost:8080/newweb/Contr.hic?comm=selecttheater"
							style="text-decoration: none;"> <b>영화 예매</b></a></span>
					</div>
					<div class="mainmenuwrap">
						<span class="navi1menu"><a
							href="http://localhost:8080/newweb/store.jsp?orderby=category%20desc"
							style="text-decoration: none;"> <b>스토어</b></a></span>
					</div>
					<div class="mainmenuwrap">
						<span class="navi1menu"><a
							href="community.hci?orderby=postno&tab=all&page=1"
							style="text-decoration: none;"> <b>커뮤니티</b></a></span>
					</div>
					<div class="mainmenuwrap mainmain5">
						<span class="navi1menu"><a
							href="http://localhost:8080/newweb/event.jsp"
							style="text-decoration: none;"><b>이벤트</b></a></span>
						<!-- 	<div class="dropdownwrap">
							<div class="dropdown border maindrop5"
								style="right: 25px; height: 145px">
								<div class="navilinkwrap">
									<a class="navilink maindropdetail5" href=""><b>이벤트</b></a>
									<hr>
									<a class="navilink maindropdetail5" href="">이벤트 공지</a> <a
										class="navilink maindropdetail5" href="">이벤트 참여</a> <a
										class="navilink maindropdetail5" href="">이벤트 결과</a>
								</div>
						</div>
						</div>
				 -->
					</div>
					<div class="mainmenuwrap navisearch">
						<span class="navi1menu">
							<form action="#">
								<div class="search">
									<input type="text" class="mainsearch" name="query" value=""
										style="width: 200px"> <input type="submit"
										class="mainsearchbutton" value="">
								</div>
							</form>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div style="display: none">
			<form name="forheaderselectcart" id="forheaderselectcart"
				method="post" action="cart.jsp">
				<input type="text" value="<%=(session).getAttribute("s_id")%>"
					name="id">
			</form>
			<form name="forheaderselectmypage" id="forheaderselectmypage"
				method="post" action="mypage.hci">
				<input type="text" value="<%=(session).getAttribute("s_id")%>"
					name="id">
			</form>

		</div>
	</div>
	<div class="popup_layer" id="login_popup" style="display: none;">
		<div class="popup_box">	
			<div style="height: 25px; width: 380px; float: top;">
				<a href="javascript:closeLoginpop()"> <img
					src="assets/img/popupclose.png" class="login_popup_close"
					width="20px" height="20px"></a>
			</div>
			<div class="loginwrap">
				<div class="login">
					<form name="login" action="login2.jsp" method="POST">
						<h2>
							<br>로그인
						</h2>
						<input type="text" class="loginid" name="id" value=""
							placeholder="ID"><br>
						<br> <input type="password" class="loginpw" name="pw"
							value="" placeholder="비밀번호"><br> <input
							type="checkbox" class="idremember" id="idremember"> <label
							for="idremember">아이디 저장</label><br> <input type="submit"
							class="loginbutton btn-hover color-1" name="loginbutton"
							value="로그인">
					</form>
				</div>
				<br>
				<div class="idpwsearch">
					<span class="idpwsearchbtn"><a href="">아이디찾기</a></span> <span
						class="idpwsearchbtn"><a href="">비밀번호찾기</a></span> <span
						class="idpwsearchbtn"><a href="">회원가입</a></span>
				</div>
				<div class="sociallogin">
					<br>
					<h2>소셜 로그인</h2>
					<input type="button" id="naverloginbtn"
						style="width: 30px; height: 30px; border: none;"
						onClick="location.href='naverlogin.html'"> <input
						type="button" id="kakaologinbtn"
						style="width: 30px; height: 30px; border: none;"> <input
						type="button" id="googleloginbtn"
						style="width: 30px; height: 30px; border: none;">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
		charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script>
	var s_id='<%=(String) session.getAttribute("s_id")%>'
	if(s_id=='null'||s_id=="") {
		document.getElementById("headerhello").style.display="none";
		document.getElementById("headerjoinbtn").style.display="block";
		document.getElementById("headerloginbtn").style.display="block";
		document.getElementById("headerlogoutbtn").style.display="none";		
	} else {
		document.getElementById("headerhello").style.display="block";		
		document.getElementById("headerjoinbtn").style.display="none";
		document.getElementById("headerloginbtn").style.display="none";
		document.getElementById("headerlogoutbtn").style.display="block";
	}	
	
	$(document).ready(function() {
		var id='<%=(String) session.getAttribute("s_id")%>'
		$('#carticon').click( function() {
			if(id==null||id==""||id=="null") {
				openLoginpop();
				alert("로그인 후 이용해주세요");
				return;
			} 	else {
				document.forms['forheaderselectcart'].submit();
			}
		})
	})
	$(document).ready(function() {
		var id='<%=(String) session.getAttribute("s_id")%>';
			$('#mypageicon').click(function() {
				if (id == null || id == "" || id == "null") {
					openLoginpop();
					alert("로그인 후 이용해주세요");
					return;
				} else {
					document.forms['forheaderselectmypage'].submit();
				}
			})
		})
	</script>

</body>
</html>