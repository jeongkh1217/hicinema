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

public class Selectreservationmypageajax implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String rid = request.getParameter("reservationid");
		ArrayList<Reservationgetset> rgs = new ArrayList<Reservationgetset>();
		MypageselectService MsS = new MypageselectService();
		rgs = MsS.selectreservationmypageajax(rid);
		request.setAttribute("reservationlist", rgs);
		ActionForward forward = new ActionForward();
		forward.setPath("/mypagereservationajax.jsp");
		return forward;

	}

}