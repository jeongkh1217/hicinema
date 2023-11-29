package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.commit;
import static jdbcutil.JdbcUtil.getConnection;
import static jdbcutil.JdbcUtil.rollback;

import java.sql.Connection;

import hicinema.communityreply.vo.Communityreplygetset;
import hicinema.dao.HicinemaDAO;

public class CommunityreplyinsertService {

	public boolean InsertCommunityreply(Communityreplygetset crgs) {
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		int insertCount = HDAO.insertcommunityreply(crgs);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
