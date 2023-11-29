package hicinema.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.community.vo.Communitygetset;
import hicinema.communityreply.vo.Communityreplygetset;
import hicinema.svc.CommunityreplyupdateService;
import hicinema.svc.CommunityupdateService;

public class UpdateCommunityreply implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 Communityreplygetset Crgs = new Communityreplygetset();
		 Crgs.setReplypost(request.getParameter("replypost"));
		 int replyno = Integer.parseInt(request.getParameter("replyno"));	
		 int postno = Integer.parseInt(request.getParameter("postno"));
		 CommunityreplyupdateService CruS = new CommunityreplyupdateService();
		 CruS.UpdateCommunity(replyno,Crgs);
		 ActionForward forward= new ActionForward();		 
	  	 forward.setPath("communityboarddetail.hci?postno="+postno);
	  	 return forward;	
		 
	 }
}
