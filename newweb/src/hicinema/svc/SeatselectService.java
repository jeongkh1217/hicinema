package hicinema.svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hicinema.dao.HicinemaDAO;
import hicinema.reservation.vo.Reservationgetset;

import static jdbcutil.JdbcUtil.* ;

public class SeatselectService {
	public List<Reservationgetset> selectseat(Map map) throws Exception {		
		List rgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		rgs = HDAO.selectseatwhere(map);
		close(con);
		return rgs;		
	}	
	

}
