<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hicinema.community.vo.*"%>
<%@ page import="java.util.*"%>
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
<div class="allwrap">
	<div class="sbfooterwrap">
		<div id="header"></div>
		<div class="bodymargin">
			<div class="communitywrap">
				<div class="communitysubtitle">
					<b>커뮤니티</b><hr>
				</div>
				<%
					ArrayList<Communitygetset> Cgs = (ArrayList<Communitygetset>) request.getAttribute("PostList");
					Communitypagegetset Cpgs = (Communitypagegetset) request.getAttribute("PageInfo");
					int postCount = Cpgs.getPostCount();
					int nowPage = Cpgs.getPage();
					int maxPage = Cpgs.getMaxPage();
					int startPage = Cpgs.getStartPage();
					int endPage = Cpgs.getEndPage();
					String orderby = request.getParameter("orderby");
					String tab = request.getParameter("tab");
					
			
				%>
				<div class="communitytabselect">
				<form action="community.hci">				
				<input type="text" name="orderby" value="<%=orderby %>" style="display:none;">
				<button type="submit" class="custom-btn btn-7" name="tab" value="all">모든 탭 보기</button>
				<button type="submit" class="custom-btn btn-7" name="tab" value="free">Free 탭 보기</button>
				<button type="submit" class="custom-btn btn-7" name="tab" value="review">Review 탭 보기</button>	
				</form>
				<div class="communityorderbydiv">
				<form action="community.hci">
				<input type="text" name="tab" value="<%=tab %>" style="display:none">
				<button type="submit" class="communityorderbybtn btn-8 custom-btn2">정렬</button>
				<select class="communityorderby" name="orderby">
				<option value="postno">최신순</option>
				<option value="viewed">조회수</option>
				<option value="recommend">추천순</option>
				</select>
				</form>
				</div>
				
						
				</div>			
				<div class="communitycontent">
					<table class="communityboard">
						<tr class="communityboardsubtitle">
							<td class="boardnum">글 번호</td>
							<td class="boardtab">탭</td>
							<td class="boardtitle">글 제목</td>
							<td class="boardwriter">작성자</td>
							<td class="boardwrittendate">작성일자</td>
							<td class="boardrecommend">추천수</td>
							<td class="boardviewed">조회수</td>
						</tr>
						<%
							for (int i = 0; i < Cgs.size(); i++) {
									Communitygetset Cgs2 = Cgs.get(i);
						%>
						<tr>
							<td class="boardnum"><%=Cgs2.getPostno()%></td>
							<td class="boardtab"><%=Cgs2.getTab() %></td>
							<td class="boardtitle"><a href="communityboarddetail.hci?postno=<%=Cgs2.getPostno()%>&page=1"><%=Cgs2.getPosttitle()%></a></td>
							<td class="boardwriter"><%=Cgs2.getId()%></td>
							<td class="boardwrittendate"><%=Cgs2.getWrittendate()%></td>
							<td class="boardrecommend"><%=Cgs2.getRecommend()%></td>
							<td class="boardviewed"><%=Cgs2.getViewed()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
				<div class="communitypage">
				<%if(nowPage<=1) { %>
				◀
				<%} else { %>
				<a href = "community.hci?orderby=<%=orderby %>&tab=<%=tab %>&page=<%=nowPage-1 %>">◀</a>
				<%} %>
				<%for(int a = startPage;a<=endPage;a++) {
				if(a==nowPage) {%>
				[<%=a %>]
				<%} else { %>
				<a href="community.hci?orderby=<%=orderby %>&tab=<%=tab %>&page=<%=a%>">[<%=a %>]</a>
				<%} %>
				<%} %>
				<%if(nowPage>=maxPage) { %>
				▶
				<%} else { %>
				<a href="community.hci?orderby=<%=orderby %>&tab=<%=tab %>&page=<%=nowPage+1%>">▶</a>
				<%} %>				
				</div>
				<div class="communitysearch">
				<form action="communitysearch.hci?page=1">
					<select name="where" class="communityboardsearchselect">
						<option value="posttitle">제목</option>
						<option value="post">내용</option>
						<option value="id">작성자</option>
					</select> 
					<input type="text" name="what" class="communityboardsearchtext">
					<button type="submit"
						class="communityboardsearch custom-btn6 btn-73">검색</button></form>
					<form action="communitywrite.hci" method="post"
						name="forcommunitywriteform">
						<input type="text" id="communityidtext" name="id"
							value="<%=(String) session.getAttribute("s_id")%>"
							style="display: none;">
						<button type="button"
							class="communityboardwrite custom-btn6 btn-73"
							onclick="sessioncheck();">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</div>
</body>
<script>
function sessioncheck() {
var id='<%=(String) session.getAttribute("s_id")%>';
var rid=$("#communityidtext").val();
if(id!==rid||rid==null||rid=="null"||rid=="") {
	alert("로그인하셔야 이용가능합니다.");
	openLoginpop();
	return;

} else {
	document.forms["forcommunitywriteform"].submit();
}
}
</script>
</html>