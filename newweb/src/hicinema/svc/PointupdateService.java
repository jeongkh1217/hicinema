package hicinema.svc;

import static jdbcutil.JdbcUtil.*;
import static jdbcutil.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.Map;

import hicinema.dao.HicinemaDAO;

public class PointupdateService {
	public boolean updatepluspoint(Map<String,Object> map) throws Exception {
		boolean ir = false;
		Connection con = getConnection();
		HicinemaDAO HD = HicinemaDAO.getInstance();
		HD.setConnection(con);
		int updateCount = HD.updatepluspoint(map);
		if(updateCount > 0) {
			commit(con);			
			ir = true;
		} else {
			rollback(con);
		}
		return ir;
	}
	public boolean updateminuspoint(Map<String,Object> map) throws Exception {
		boolean ir = false;
		Connection con = getConnection();
		HicinemaDAO HD = HicinemaDAO.getInstance();
		HD.setConnection(con);
		int updateCount = HD.updateminuspoint(map);
		if(updateCount > 0) {
			commit(con);			
			ir = true;
		} else {
			rollback(con);
		}
		return ir;
	}
}
