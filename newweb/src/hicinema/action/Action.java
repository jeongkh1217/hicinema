package hicinema.action;

import javax.servlet.http.*;

import hicinema.action.vo.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}

