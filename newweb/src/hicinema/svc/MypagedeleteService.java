package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.getConnection;
import static jdbcutil.JdbcUtil.*;

import java.sql.Connection;

import hicinema.dao.HicinemaDAO;

public class MypagedeleteService {
	
	
	public int deletereservation(String reservationid) {
		int deletecount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		deletecount = HDAO.deletereservation(reservationid);
		
		if(deletecount > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}		
		close(con);		
		return deletecount;		
	}

	public int deletepurchase(String purchaseid) {
		int deletecount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		deletecount = HDAO.deletepurchase(purchaseid);
		
		if(deletecount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return deletecount;
	}

}
