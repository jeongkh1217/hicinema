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
<script src="js/headerfooter.js"></script>
</head>
<body>
<%String pid = (String)request.getParameter("id"); %>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin2">
				<div class="boardwritewrap">
					<div class="boardwritesubtitle">
						<b>글 작성</b>
						<hr>
					</div>
				</div>
				<div class="boardwritecontent">
					<div class="boardwritecontenttitle">
					<form action="boardinsert.hci" method="post" name="boardwriteform" enctype="multipart/form-data">
						<span><b>작성자 :</b></span> <span id="boardwriteid"><%=pid %></span>
						<input type="text" name="id" id="sessionformid" value="<%=(String) session.getAttribute("s_id")%>" style="display:none;"><br>
						<span><b>제목 : </b>
							<select id="boardwritetab" name="tab">
							<option value=''>선택</option>
							<option value="Free">Free</option>
							<option value="Review">Review</option></select>
							<input id="boardwritetitle" type="text" name="posttitle" size="20" style="margin-left:10px; width:81%" placeholder="제목을 입력해주세요"></span><br>
						<span><b>내용 : </b><br></span>
						<textarea name="post" id="boardwritecontent" class="boardwritepostcontent" placeholder="내용을 입력해주세요"></textarea>
						<b>파일 첨부 : </b><br>
						이미지1 : <input type="file" name="file1"><br>
						이미지2 : <input type="file" name="file2"><br>
						이미지3 : <input type="file" name="file3"><br>
						이미지4 : <input type="file" name="file4"><br>
						이미지5 : <input type="file" name="file5">
						<button type="button" class="boardwritesubmitbtn" onclick="tabcheck();">등록</button>						
					</form>
					</div>
					<div class="boardwritecontentcontent"></div>
					<div class="boardwritecontentfile"></div>
				</div>
			</div>

			<div class="boarduploadbtn"></div>
		</div>
		<div id="footer"></div>
	</div>
</body>

<script>
function tabcheck() {
    var tab = document.getElementById("boardwritetab");
    var tabV = tab.value;

    if (tabV === '') {
        alert('탭을 선택해주세요');
        return;
    } else {
       idcheck(); 
    }
}

function idcheck() {
    var id = $("#sessionformid").val();
    var wid = $("#boardwriteid").text();
    
    if (id !== wid || id == null || id === "" || id === "null") {
        alert("작성자를 확인해주세요");
        return;
    } else {
        boardcheck();
    }
}

function boardcheck() {
    var content = $("#boardwritecontent").val();
    var title = $("#boardwritetitle").val();    
    if (content.length < 5 || title.length < 5) {
        alert("제목과 내용을 5자 이상으로 입력해주세요");
        return;
    } else {
        document.forms["boardwriteform"].submit();
    }
}

</script>  
</html>