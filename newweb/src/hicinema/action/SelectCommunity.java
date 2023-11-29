package hicinema.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.Action;
import hicinema.action.vo.ActionForward;
import hicinema.community.vo.*;
import hicinema.movie.vo.*;
import hicinema.svc.*;


public class SelectCommunity implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{		 
		ArrayList<Communitygetset> Cgs=new ArrayList<Communitygetset>();
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}  
		
		CommunityselectService CsS = new CommunityselectService();
		String tab = request.getParameter("tab");
		String orderby = request.getParameter("orderby");
		int listCount=0;
		
		
		if(tab.equals("review")) {
			listCount=CsS.getListCountreview();
			if(orderby.equals("recommend")) {
				Cgs = CsS.getPostListrecommend(page, limit, tab);
			} else if (orderby.equals("viewed")) {
				Cgs = CsS.getPostListviewed(page, limit, tab);
			} else if(orderby.equals("postno")) {		
				Cgs = CsS.getPostListpostno(page, limit, tab);
			}
		} else if (tab.equals("free")) {
			listCount=CsS.getListCountfree();
			if(orderby.equals("recommend")) {
				Cgs = CsS.getPostListrecommend(page, limit, tab);
			} else if (orderby.equals("viewed")) {
				Cgs = CsS.getPostListviewed(page, limit, tab);
			} else {		
				Cgs = CsS.getPostListpostno(page, limit, tab);
			}
		} else {
			listCount=CsS.getListCountall();
			if(orderby.equals("recommend")) {
				Cgs = CsS.getPostListrecommendall(page, limit);
			} else if (orderby.equals("viewed")) {
				Cgs = CsS.getPostListviewedall(page, limit);
			} else {		
				Cgs = CsS.getPostListpostnoall(page, limit);
			}
		}				
		
		
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		Communitypagegetset Cpgs = new Communitypagegetset();
   		Cpgs.setEndPage(endPage);
   		Cpgs.setPostCount(listCount);
		Cpgs.setMaxPage(maxPage);
		Cpgs.setPage(page);
		Cpgs.setStartPage(startPage);	
		request.setAttribute("PageInfo", Cpgs);
		request.setAttribute("PostList", Cgs);
		ActionForward forward= new ActionForward();
   		forward.setPath("/community.jsp");
   		return forward;
   		
	 }
	 
 }