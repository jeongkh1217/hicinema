package hicinema.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.svc.CommunitydeleteService;
import hicinema.svc.CommunityreplydeleteService;

public class DeleteCommunityreply implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 ActionForward forward = new ActionForward();
		 CommunityreplydeleteService CdS = new CommunityreplydeleteService();
		 
		 int postno = Integer.parseInt(request.getParameter("postno"));
		 int replyno = Integer.parseInt(request.getParameter("replyno"));
		 int delcnt = CdS.deletecommunity(replyno);
		 if(delcnt>0) {
			 forward.setPath("/communityboarddetail.hci?postno="+postno);
		 } else {
			 response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('��������');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		 }		 
		 return forward;		 
	 }
}
