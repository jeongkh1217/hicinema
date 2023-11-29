package hicinema.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.Action;
import hicinema.action.vo.ActionForward;
import hicinema.community.vo.Communitygetset;
import hicinema.community.vo.Communitypagegetset;
import hicinema.svc.*;

public class Communitysearch implements Action {	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 ArrayList<Communitygetset> Cgs=new ArrayList<Communitygetset>();
		 String what=request.getParameter("what");
		 String where=request.getParameter("where");
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("what", what);
		 map.put("where",where);
	  	int page=1;
		int limit=10;			
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}  
		
		CommunityselectService CsS = new CommunityselectService();		
		int listCount=0;
		listCount=CsS.getsearchcount(map);	
		Cgs = CsS.searchcommunity(page, limit, map);		
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