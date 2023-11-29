package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.commit;
import static jdbcutil.JdbcUtil.getConnection;
import static jdbcutil.JdbcUtil.rollback;

import java.sql.Connection;

import hicinema.dao.HicinemaDAO;

public class CommunitydeleteService {
	public int deletecommunity(int postno) {
		int deletecount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		deletecount = HDAO.deletecommunity(postno);
		
		if(deletecount > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}		
		close(con);		
		return deletecount;		
	}


}
