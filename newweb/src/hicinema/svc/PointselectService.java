package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.getConnection;

import java.sql.Connection;

import hicinema.dao.HicinemaDAO;

public class PointselectService {
public int selectpoint(String id) throws Exception {		
		int point;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		point = HDAO.selectpointwhere(id);
		close(con);
		return point;
		
	}
}
