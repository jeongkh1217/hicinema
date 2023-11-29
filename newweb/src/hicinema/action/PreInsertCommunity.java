package hicinema.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;


public class PreInsertCommunity implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 ActionForward forward= new ActionForward();		
	  	 forward.setPath("/communityboardwrite.jsp");
	  	 return forward;			 
	 }
}
