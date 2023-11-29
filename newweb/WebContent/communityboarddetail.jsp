<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="hicinema.community.vo.*"%>
<%@page import="hicinema.communityreply.vo.*" %>
<%@page import="java.util.*"%>
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
<%
	ArrayList<Communitycombinedgetset> Cgs = (ArrayList<Communitycombinedgetset>) request.getAttribute("Boardinfo");
	Communitycombinedgetset Cgs2 = Cgs.get(0);
	Communityreplypagegetset Crpgs2= (Communityreplypagegetset)request.getAttribute("PageInfo");
	int replycount = Crpgs2.getReplypostCount();
	int nowpage = Crpgs2.getReplypage();
	int maxpage = Crpgs2.getReplymaxPage();
	int startpage = Crpgs2.getReplystartPage();
	int endpage = Crpgs2.getReplyendPage();
%>
<body>
	<div class="allwrap">
		<div class="sbfooterwrap">
			<div id="header"></div>
			<div class="bodymargin2">
				<div class="communitydetailwrap">
					<div class="communitydetailsubtitle">
						<b>게시글 상세보기</b><hr>
					</div>
					<div class="communitydetailcontent">
					<div>
						<div class="communitydetailid">
							<span class="communitydetailone">작성자 : </span><span class="communitydetailtwo" id="communitydetailfordeletespan"><%=Cgs2.getCgs().getId()%></span>
						</div>						
						<div class="communitydetailwrittendate">
							<span class="communitydetailone">작성일자 : </span><span class="communitydetailtwo"><%=Cgs2.getCgs().getWrittendate()%></span>
						</div>
						<div class="communitydetailrecommend">
							<span class="communitydetailone">추천수 : </span><span class="communitydetailtwo" id="communitydetailtotallike"></span>
						</div>
						<div class="communitydetailviewed">
							<span class="communitydetailone">조회수 : </span><span class="communitydetailtwo"><%=Cgs2.getCgs().getViewed()%></span>
						</div>
						<div class="communitydetailcrudbtn">
							<span class="communitydetailupdate">
							<button type="button" class="communitydetailupdatebtn" onclick="fordetailupdate()"></button>
							</span>
							<span class="communitydetaildelete">
							<button type="button" class="communitydetaildeletebtn" onclick="fordetaildeletecheck();"></button>
							</span>							
						</div>
						</div>											
						<div class="communitydetailposttitle">
							<span class="communitydetailone">제목 : </span><span class="communitydetailtwo">[<%=Cgs2.getCgs().getTab()%>]</span><span class="communitydetailtwo" id="communitydetailtitle"><%=Cgs2.getCgs().getPosttitle()%></span>
							<span class="communitydetailtwo" id="communitydetailforupdatetitle"><input type="text" id="communitydetailupdatetext" value="<%=Cgs2.getCgs().getPosttitle()%>"></span>
						</div>
						<div class="communitydetailpost">
							<span class="communitydetailone">내용 : </span>
							<br>
							<span class="communitydetailtwo" id="communitydetailpostcontent"><%=Cgs2.getCgs().getPost()%></span>
							<div class="communitydetaillikeimg">						
							<button type="submit" id="communityfillheart" onclick="likeajax();"></button> 
							<button type="submit" id="communityunfillheart" onclick="unlikeajax();"></button>
							</div>
							<div id="communitydetailupdatepostcontentdiv">
							<form name="communitydetailupdateform" method="POST" action="communityupdate.hci">
							<input type="hidden" name="postno" value="<%=Cgs2.getCgs().getPostno() %>">
							<input type="hidden" name="posttitle" id="communitydetailrealposttitle">
							<textarea name="post" id="communitydetailupdatepostcontent"><%=Cgs2.getCgs().getPost()%></textarea>
							<span style="float:right;">								
							<button type="button" onclick="fordetailupdatecheck();">수정</button>
							<button type="button" onclick="fordetailupdatecheckcancel();">취소</button>
							</span>
							</form>
							<form name="communitydetaildeleteform" method="post" action="communitydelete.hci">
							<input type="hidden" name="postno" value="<%=Cgs2.getCgs().getPostno() %>">
							</form>
							</div>
						</div>
						<div class="communitydetailfileshow">
							<div class="communitydetailfileshowspan" id="communitydetailfileshow1"><img class="communitydetailimgshow" src="boardUpload/<%=Cgs2.getCgs().getFile1()%>"></div>
							<div class="communitydetailfileshowspan" id="communitydetailfileshow2"><img class="communitydetailimgshow" src="boardUpload/<%=Cgs2.getCgs().getFile2()%>"></div>
							<div class="communitydetailfileshowspan" id="communitydetailfileshow3"><img class="communitydetailimgshow" src="boardUpload/<%=Cgs2.getCgs().getFile3()%>"></div>
							<div class="communitydetailfileshowspan" id="communitydetailfileshow4"><img class="communitydetailimgshow" src="boardUpload/<%=Cgs2.getCgs().getFile4()%>"></div>
							<div class="communitydetailfileshowspan" id="communitydetailfileshow5"><img class="communitydetailimgshow" src="boardUpload/<%=Cgs2.getCgs().getFile5()%>"></div>
						
						</div>
						<div class="communitydetailfiledownload">
							<span class="communitydetailone">첨부파일 : </span><br>
							<a href="communityfiledown.hci?downfile=<%=Cgs2.getCgs().getFile1()%>"><span id="communitydetailfile1"><%=Cgs2.getCgs().getFile1()%><br></span></a>
							<a href="communityfiledown.hci?downfile=<%=Cgs2.getCgs().getFile2()%>"><span id="communitydetailfile2"><%=Cgs2.getCgs().getFile2()%><br></span></a>
							<a href="communityfiledown.hci?downfile=<%=Cgs2.getCgs().getFile3()%>"><span id="communitydetailfile3"><%=Cgs2.getCgs().getFile3()%><br></span></a>
							<a href="communityfiledown.hci?downfile=<%=Cgs2.getCgs().getFile4()%>"><span id="communitydetailfile4"><%=Cgs2.getCgs().getFile4()%><br></span></a>
							<a href="communityfiledown.hci?downfile=<%=Cgs2.getCgs().getFile5()%>"><span id="communitydetailfile5"><%=Cgs2.getCgs().getFile5()%><br></span></a>

						</div>
					</div>
				</div>
				<hr>
				<div class="communitydetailreply">
					<form name="communityreply" action="communityreply.hci"
						method="post" style="margin-bottom: 15px;">
						<span><b>댓글작성</b></span><br>
						
						<span id="replyid"><%=(String) session.getAttribute("s_id")%></span>
						<input type="hidden" name="replyid"
							value="<%=(String) session.getAttribute("s_id")%>"
							id="forreplyidform"> <input type="hidden" name="postno"
							value="<%=Cgs2.getCgs().getPostno()%>"> <span><textarea
								id="communitydetailreplytextarea"
								class="communitydetailreplytextarea" name="replypost"
								maxlength="80"></textarea></span> <span><button type="button"
								class="communitydetailreplysubmit custom-btn btn-7"
								onclick="beforereplysubmit()" style="width: 10%; height: 54px;">등록</button></span>
					</form>
				</div>
				<%
					for (int i = 0; i < Cgs.size(); i++) {
						Communitycombinedgetset Cgs3 = Cgs.get(i);
				%>
				<div class="communitydetailreplywrite">
					<%
						if (Cgs3.getCrgs().getReplyid() == null) {
					%>
					<%="등록된 댓글이 없습니다."%>
					<%
						} else {
					%>
					<span class="communitydetailreplyid"><%=Cgs3.getCrgs().getReplyid()%></span>
					<span class="communitydetailreplypost"
						id="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btnspan"><%=Cgs3.getCrgs().getReplypost()%></span>
					<form
						name="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btntextbtnform"
						id="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btntextbtnform"
						action="communityreplyupdate.hci">
						<span class="communitydetailreplyupdatespan"
							id="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btntext">
							<textarea maxlength="80	" name="replypost"
								class="replyupdatetext"></textarea>
							<button type="button" class="replycrudbtn"
								id="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btntextbtn"
								onclick="realsubmit(this.id);">수정</button>
						</span> <input type="hidden" name="replyno"
							value="<%=Cgs3.getCrgs().getReplyno()%>"> <input
							type="hidden" name="postno"
							value="<%=Cgs3.getCgs().getPostno()%>">
					</form>
					<span class="communitydetailreplywrittendate"><%=Cgs3.getCrgs().getReplywrittendate()%></span>
					<span
						class="communitydetailreplybtn replycrudbtn<%=Cgs3.getCrgs().getReplyid()%>">
						<button type="button" class="communitydetailreplyupdate"
							id="replyupdateform<%=Cgs3.getCrgs().getReplyno()%>btn"
							onclick="beforereplyupdate(this.id);"></button>
						<button type="button" class="communitydetailreplydelete"
							id="replydeleteform<%=Cgs3.getCrgs().getReplyno()%>btn"
							onclick="replydelete(this.id);"></button>
					</span>
					<form name="replydeleteform<%=Cgs3.getCrgs().getReplyno()%>btnform"
						id="replydeleteform<%=Cgs3.getCrgs().getReplyno()%>btnform"
						style="display: none;" action="communityreplydelete.hci">
						<input type="hidden" name="replyno"
							value="<%=Cgs3.getCrgs().getReplyno()%>"> <input
							type="hidden" name="postno"
							value="<%=Cgs3.getCgs().getPostno() %>">
					</form>
				</div>
				<%}} %>
				<div class="communitydetailreplypagelist">
				<%if(nowpage<=1) { %>
				◀
				<%} else { %>
				<a href = "communityboarddetail.hci?postno=<%=Cgs2.getCgs().getPostno() %>&page=<%=nowpage-1 %>">◀</a>
				<%} %>
				<%for(int a = startpage;a<=endpage;a++) {
				if(a==nowpage) {%>
				[<%=a %>]
				<%} else { %>
				<a href="communityboarddetail.hci?postno=<%=Cgs2.getCgs().getPostno() %>&page=<%=a%>">[<%=a %>]</a>
				<%} %>
				<%} %>
				<%if(nowpage>=maxpage) { %>
				▶
				<%} else { %>
				<a href="communityboarddetail.hci?postno=<%=Cgs2.getCgs().getPostno() %>&page=<%=nowpage+1%>">▶</a>
				<%} %>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
var id = '<%= (String)session.getAttribute("s_id") %>';
var rc = document.getElementById("communitydetailreplytextarea");
if (id == null || id == 'null' || id == "") {
    rc.onclick = function (e) {
        alert("로그인시 작성가능합니다");
        openLoginpop();
        rc.disabled = true;
        return;
    };
} else {
    rc.disabled = false;
}

$(document).ready(function(){
	for(let i=1;i<6;i++) {
		if($("#communitydetailfile"+i).text()=='null') {
			$("#communitydetailfile"+i).html("");
			$("#communitydetailfileshow"+i).css("display","none");
		}
	}	
})
$(document).ready(function(){
	var id = '<%= (String)session.getAttribute("s_id") %>';
	$(".replycrudbtn"+id).css("display","inline-block");
})	
	
	
$(document).ready(function(){
	if($("#replyid").text()=='null') {
		$("#replyid").text("비로그인사용자");		
	}	
})
function beforereplysubmit() {
	var id = '<%= (String)session.getAttribute("s_id") %>';
	var rid = $("#replyid").text();
	if(id!==rid||id=="null"||id==""||id==null){
		alert('로그인해주세요');
		openLoginpop();
		return;
	} else {
		replylengthcheck();
	}
}
function replylengthcheck() {
	var reply = $("#communitydetailreplytextarea").val();
	var replyl = reply.length;
	if (replyl<=4) {
		alert("5자 이상 입력해주세요");
		return;
	} else {
		document.forms["communityreply"].submit();
		$("#communitydetailreplytextarea").val("");
	}
}
function fordetailupdate() {
	var sid='<%= (String)session.getAttribute("s_id") %>';
	var pid = $("#communitydetailfordeletespan").text();
	if(sid!==pid) {
		alert("작성자만 수정할 수 있습니다.");
		return;
	} else {	
	$("#communitydetailupdatepostcontentdiv").css("display","block");
	$("#communitydetailpostcontent").css("display","none");
	$("#communitydetailtitle").css("display","none");
	$("#communitydetailforupdatetitle").css("display","inline");
}}

function fordetailupdatecheckcancel() {
	$("#communitydetailupdatepostcontentdiv").css("display","none");
	$("#communitydetailpostcontent").css("display","block");
	$("#communitydetailtitle").css("display","inline");
	$("#communitydetailforupdatetitle").css("display","none");
}


function fordetailupdatecheck() {
	var firstone = $("#communitydetailupdatetext").val();
	var secondone = $("#communitydetailupdatepostcontent").val();
	if(firstone.length<=5||secondone.length<=5) {
		alert("제목과 내용 5자이상씩 입력해주세요");
		return;
	} else {
		console.log(firstone);
		$("#communitydetailrealposttitle").val(firstone);
		document.forms["communitydetailupdateform"].submit();
	}
}
function fordetaildeletecheck() {
	var sid='<%= (String)session.getAttribute("s_id") %>';
	var pid = $("#communitydetailfordeletespan").text();
	if(sid!==pid) {
		alert("작성자만 삭제할 수 있습니다.");
		return;
	} else {
		document.forms["communitydetaildeleteform"].submit();		
	}
}
function replydelete(btnid) {
	var btnid = btnid;
    var formId = btnid + "form";
    var dform = document.getElementById(formId);
    dform.submit();
    dform.reset();
}
function beforereplyupdate(btnid){
	var btnid=btnid;
	var spanId = "#"+btnid+"span";
	var textId = "#"+btnid+"text";
	$(spanId).css("display","none");
	$(textId).css("display","block");
}
function realsubmit(btnid) {
	var btnid = btnid;
	var formId =btnid+"form";
	var uform = document.getElementById(formId);
	uform.submit();
	uform.reset();
}
$(document).ready(function(){
	var id = "<%=(String) session.getAttribute("s_id")%>";
	if (id==null||id=='null'||id=="") {
		return;
	} else {
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				"id":id},
				url:"communitylikeajax.jsp",
			async:false,			
			success:function(cnt) {
				if(cnt==0) {
					$("#communityfillheart").show();
					$("#communityunfillheart").hide();
				} else {
					$("#communityfillheart").hide();
					$("#communityunfillheart").show();
				}
			}
		});
	})}
})
$(document).ready(function(){
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				},
				url:"communitytotallikeajax.jsp",
			async:false,
			success:function(cnt) {
				$("#communitydetailtotallike").text(cnt);
				 mainupdate();				
			}
		});
	})}
)

function likeajax(){
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				"id":id},
				url:"communityinsertlikeajax.jsp",
			async:false,
			success:function(result) {
				if(result==1) {
					$("#communityfillheart").hide();
					$("#communityunfillheart").show();
					likecount();
				} else {
					$("#communityfillheart").show();
					$("#communityunfillheart").hide();
					likecount();
				}
			}
		});
	})}

function unlikeajax(){
	var id = "<%=(String) session.getAttribute("s_id")%>";
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				"id":id},
				url:"communitydeletelikeajax.jsp",
			async:false,
			success:function(result) {
				if(result==1) {
					$("#communityfillheart").show();
					$("#communityunfillheart").hide();
					likecount();
				} else {
					$("#communityfillheart").hide();
					$("#communityunfillheart").show();
					likecount();
				}
			}
		});
	})}

function likecount() {
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				},
				url:"communitytotallikeajax.jsp",
			async:false,
			success:function(cnt) {
				$("#communitydetailtotallike").text(cnt);
				mainupdate();
			}
		});
	})}
function mainupdate() {
	var postno ="<%=Cgs2.getCgs().getPostno() %>";
	let rec = $("#communitydetailtotallike").text();
	let trec=rec.trim();
	console.log(trec);
	$(function (){
		$.ajax({
			type:'POST',
			data:{
				"postno":postno,
				"recommend":trec
				},
				url:"communityrecommendajax.jsp",
			async:false,
			success:function(cnt) {
				
			}
		});
	})	
}
</script>
</html>