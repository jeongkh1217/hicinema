package hicinema.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.svc.CommunitydeleteService;
import hicinema.svc.MypagedeleteService;

public class DeleteCommunity implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 ActionForward forward = new ActionForward();
		 CommunitydeleteService CdS = new CommunitydeleteService();
		 int postno = Integer.parseInt(request.getParameter("postno"));
		 int delcnt = CdS.deletecommunity(postno);
		 if(delcnt>0) {
			 forward.setPath("/community.hci?page=1&tab=all&orderby=postno");
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
