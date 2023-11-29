package hicinema.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.movie.vo.Moviegetset;
import hicinema.svc.MovieselectService;
import hicinema.svc.PointselectService;

public class InsertpreReservation implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 String movieid=request.getParameter("movieid");
		 String id=request.getParameter("id");
		 List<Moviegetset> mgs = new ArrayList<Moviegetset>();
		 MovieselectService MsS = new MovieselectService();
		 mgs = MsS.selectmoviedetail(movieid);
		 request.setAttribute("movie", mgs);
		 PointselectService PsS = new PointselectService();
		 int point = PsS.selectpoint(id);
		 request.setAttribute("point", point);
		 ActionForward forward= new ActionForward();		
	  	 forward.setPath("/moviepayment.jsp");
	  	 return forward;	
		 
	 }
}
