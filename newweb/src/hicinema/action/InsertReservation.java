package hicinema.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.action.vo.ActionForward;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.svc.PointupdateService;
import hicinema.svc.ReservationinsertService;

public class InsertReservation implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Reservationgetset rgs = new Reservationgetset();
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        rgs.setId(request.getParameter("id"));
        rgs.setTheater(request.getParameter("theater"));
        rgs.setDate(request.getParameter("date"));
        rgs.setTime(request.getParameter("time"));
        rgs.setSeat(request.getParameter("seat"));
        rgs.setPayby(request.getParameter("payby"));
        rgs.setPaydate(sdf.format(ts));

        ReservationinsertService RiS = new ReservationinsertService();
        RiS.InsertReservation(rgs);

        PointupdateService PuS = new PointupdateService();

        int pluspoint = 0;
        int minuspoint = 0;

        String pluspointParam = request.getParameter("pluspoint");
        String minuspointParam = request.getParameter("minuspoint");

        if (pluspointParam != null && !pluspointParam.isEmpty()) {
            pluspoint = Integer.parseInt(pluspointParam);
        }

        if (minuspointParam != null && !minuspointParam.isEmpty()) {
            minuspoint = Integer.parseInt(minuspointParam);
        }

        Map<String, Object> plusmap = new HashMap<String, Object>();
        plusmap.put("id", request.getParameter("id"));
        plusmap.put("pluspoint", pluspoint);

        Map<String, Object> minusmap = new HashMap<String, Object>();
        minusmap.put("id", request.getParameter("id"));
        minusmap.put("minuspoint", minuspoint);

        try {
            PuS.updatepluspoint(plusmap);

            if (minuspoint != 0) {
                PuS.updateminuspoint(minusmap);
            }

            request.setAttribute("moviereservationcompleteresult", "<script>alert('예약완료되었습니다. 마이페이지에서 확인해주세요.');</script>");
        } catch (Exception e) {
            request.setAttribute("moviereservationcompleteresult", "<script>alert('예매 중 오류가 발생했습니다.');</script>");
            e.printStackTrace();
        }

        ActionForward forward = new ActionForward();
        forward.setPath("index.jsp");

        return forward;
    }
}