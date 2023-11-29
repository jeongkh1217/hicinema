package hicinema.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.Action;
import hicinema.action.vo.ActionForward;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.svc.*;

public class SelectSeat implements Action {	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{		 
		List<Reservationgetset> rgs=new ArrayList<Reservationgetset>();
		String theater = request.getParameter("theater");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("theater", theater);
		map.put("date",date);
		map.put("time",time);
		SeatselectService SsS = new SeatselectService();
		rgs = SsS.selectseat(map);
		request.setAttribute("seatlist", rgs);
		ActionForward forward= new ActionForward();
  		forward.setPath("/moviescheduleseat.jsp");
  		return forward;
  		
	 }
	 
}