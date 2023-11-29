package hicinema.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.communityreply.vo.Communityreplygetset;
import hicinema.svc.CommunityreplyinsertService;


public class InsertCommunityreply implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 Timestamp ts = new Timestamp(System.currentTimeMillis());
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Communityreplygetset Crgs = new Communityreplygetset();
		 Crgs.setReplyid(request.getParameter("replyid"));
		 Crgs.setPostno(Integer.parseInt(request.getParameter("postno")));
		 Crgs.setReplypost(request.getParameter("replypost"));
		 Crgs.setReplywrittendate(sdf.format(ts));		 
		 CommunityreplyinsertService CriS = new CommunityreplyinsertService();
		 CriS.InsertCommunityreply(Crgs);
		 int postno = Integer.parseInt(request.getParameter("postno"));
		 ActionForward forward= new ActionForward();
	  	 forward.setPath("/communityboarddetail.hci?postno="+postno);	  	
	  	 return forward;	
		 
	 }
}
