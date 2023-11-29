package hicinema.svc;

import static jdbcutil.JdbcUtil.*;
import static jdbcutil.JdbcUtil.getConnection;

import java.sql.Connection;


import hicinema.dao.HicinemaDAO;
import hicinema.reservation.vo.Reservationgetset;


public class ReservationinsertService {
	public boolean InsertReservation(Reservationgetset Rgs) throws Exception {
		boolean ir = false;
		Connection con = getConnection();
		HicinemaDAO HD = HicinemaDAO.getInstance();
		HD.setConnection(con);
		int insertCount = HD.insertReservation(Rgs);
		if(insertCount > 0) {
			commit(con);			
			ir = true;
		} else {
			rollback(con);
		}
		return ir;
	}
}
