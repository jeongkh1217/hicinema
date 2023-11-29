<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<title>HiCinema</title>
<link rel="stylesheet" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/headerfooter.js"></script>
<script src="js/join.js"></script>
</head>
<body>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="joinallwrap">
				<div class="join">
					<div class="joinsubtitle">
						<h1>회원가입</h1>
					</div>
					<div class="joinwrap">
						<form name="join" action="join_dbconnect.jsp" method="POST">
							<div class="forjoinresult" style="display:none;">
							<input type="text" id="forjoinajaxtext"></div>							
							<div class="joinform no_dot">아이디</div>
							<input type="text" class="idform joinformtext" name="id" id="id" maxlength="16" value="" placeholder="8~16자리의 숫자,영어의 조합" onkeyup="duplicationcheck();">
							<div class="checkIdResult" id="checkIdResult"></div>
							<div class="joinform no_dot">비밀번호</div>
							<input type="password" class="joinformtext" name="pw" id="pw"  autocomplete="on" maxlength="20" value="" placeholder="8~20자리의 숫자,영어의 조합"><br>
							<br><div class="joinform no_dot">비밀번호 확인</div>							
							<input type="password" class="joinformtext" name="pw2" id="pw2"  autocomplete="on" maxlength="20" value="" placeholder="동일한 비밀번호를 입력해주세요"><br>
							<br><div class="joinform no_dot">이름</div>
							<input type="text" class="joinformtext" name="name" id="name" maxlength="5" value="" placeholder="본명을 입력해주세요"><br>
							<br><div class="joinform no_dot" aria-required="true">생년월일</div>							
							<select class="birth" name="year" id="year"></select>년　
							<select class="birth" name="month" id="month"></select>월　 
							<select class="birth" name="day" id="day"></select>일　
							<br>　<br><div class="joinform no_dot">성별</div>							 
							<div class="joinform h20">
							<div class="sexform"><input type="radio" name="sex" id="male" value="m" class="sex" checked><label for="male">남자</label></div> 
							<div class="sexform"><input type="radio" name="sex" id="female" value="f" class="sex"><label for="female">여자</label></div></div>
							<br>　<br>　<br><div class="joinform no_dot">연락처</div>							
							<select class="joinformphone" name="cp1" id="cp1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							</select> - 
							<input type="text" class="joinformphone" name="cp2" id="cp2" maxlength="4" value=""> - 
							<input type="text" class="joinformphone" name="cp3" id="cp3" maxlength="4" value="">					
							<br>　<br><div class="joinform no_dot">주소</div>
								<input type="text" class="joinformtext"
								name="sample6_postcode" id="sample6_postcode" placeholder="우편번호"
								ReadOnly>
								<button type="button"
								class="custom-btn btn-3"
								onclick="sample6_execDaumPostcode()"><span>우편번호 찾기</span></button>
							<br> <input type="text" class="joinformtext"
								name="sample6_address"  id="sample6_address" placeholder="주소"
								ReadOnly><br> <input type="text"
								class="joinformtext" name="sample6_detailAddress"
								id="sample6_detailAddress"  placeholder="상세주소">
							<input type="text" class="joinformtext"
								name="sample6_extraAddress" id="sample6_extraAddress"
								placeholder="참고항목">

							<br>　<br><div class="joinform no_dot">이메일 </div>
							 <input type="text" class="joinformtext" name="email1"
								id="email1" maxlength="30" placeholder="email주소를 입력해주세요" value=""
								onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');">
							<br>@ <input type="text" class="joinformtext" name="email2"
								id="email2"  maxlength="15" value=""
								oninput="handleOnInput(this)">　 <select
								name="email3"  class="joinformtext" id="email3">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>
							<script>
								$("#email3").change(function() {
									$("#email2").val($("#email3").val());
								});
							</script>
							<br>　<br><div class="joinform no_dot">선호 영화 장르(2개)</div>
							<div class="no_dot joingenre">
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre1" value="액션" />액션</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre2" value="스릴러" />스릴러</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre3" value="SF" />SF</label>
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre4" value="미스터리" />미스터리</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre5" value="판타지" />판타지</label><br>
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre6" value="멜로" />멜로</label>
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre7" value="애니메이션" />애니메이션</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre8" value="범죄" />범죄</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre9" value="코미디" />코미디</label> 
							 <label><input type="checkbox" class="genrecheck" name="genre" id="genre10" value="공포" />공포</label> <br></div>							
							<div class="joinform no_dot joinsubmitbutton">
								<input type="button" class="btn-hover color-9" value="등록"
									onclick="pwcheck()">
							</div>	</form>
					</div>
				
				
					<br>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
$(document).ready(function () {
    var maxChecked = 2; // 최대 선택 가능한 checkbox 개수
    $(".genrecheck").on("click", function () {
        var checkedBoxes = $(".genrecheck:checked");
        if (checkedBoxes.length > maxChecked) {
            $(this).prop("checked", false);
            alert("선호 장르는 최대 2개까지 선택 가능합니다.");
        }
    });
});
</script>
</html>
