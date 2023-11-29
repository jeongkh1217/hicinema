package hicinema.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.svc.MypagedeleteService;


public class DeleteReservation implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 ActionForward forward = new ActionForward();
		 MypagedeleteService MdS = new MypagedeleteService();
		 String reservationid = request.getParameter("reservationid");
		 int delcnt = MdS.deletereservation(reservationid);
		 if(delcnt>0) {
			 forward.setPath("mypage.hci");
			 request.setAttribute("mypagecancel", "<script>alert('예매취소 완료되었습니다.');</script>");				
		 } else {
			 forward.setPath("mypage.hci");
			 request.setAttribute("mypagecancel", "<script>alert('예매취소중 오류발생했습니다. 한번더 확인해주세요.');</script>");
		 }		 
		 return forward;		 
	 }
}
