package hicinema.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.svc.MypagedeleteService;

public class DeletePurchase implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 ActionForward forward = new ActionForward();
		 MypagedeleteService MdS = new MypagedeleteService();
		 String purchaseid = request.getParameter("purchaseid");
		 int delcnt = MdS.deletepurchase(purchaseid);
		 if(delcnt>0) {
			 forward.setPath("mypage.hci");
			 request.setAttribute("mypagecancel", "<script>alert('구매취소 완료되었습니다.');</script>");
		 } else {
			 forward.setPath("mypage.hci");
			 request.setAttribute("mypagecancel", "<script>alert('구매취소중 오류발생했습니다. 한번더 확인해주세요.');</script>");
		 }		 
		 return forward;		 
	 }
}
