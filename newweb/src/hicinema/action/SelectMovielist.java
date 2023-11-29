package hicinema.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.Action;
import hicinema.action.vo.ActionForward;
import hicinema.movie.vo.*;
import hicinema.svc.*;

public class SelectMovielist implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Moviegetset> mgs=new ArrayList<Moviegetset>();
		String movieid=request.getParameter("movieid");
		MovieselectService MsS = new MovieselectService();
		mgs = MsS.selectmoviedetail(movieid);
		request.setAttribute("movielist", mgs);
		ActionForward forward= new ActionForward();
  		forward.setPath("moviescheduleseat2.hci");
  		return forward;
  		
	 }
	 
}