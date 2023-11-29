package hicinema.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.community.vo.Communitygetset;
import hicinema.svc.CommunityupdateService;



public class UpdateCommunity implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 Communitygetset Cgs = new Communitygetset();
		 Cgs.setPosttitle(request.getParameter("posttitle"));
		 Cgs.setPost(request.getParameter("post"));
		 int postno = Integer.parseInt(request.getParameter("postno"));		 
		 CommunityupdateService CuS = new CommunityupdateService();
		 CuS.UpdateCommunity(postno,Cgs);
		 ActionForward forward= new ActionForward();		 
	  	 forward.setPath("communityboarddetail.hci?postno="+postno);
	  	 return forward;	
		 
	 }
}
