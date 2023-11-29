package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.commit;
import static jdbcutil.JdbcUtil.getConnection;
import static jdbcutil.JdbcUtil.rollback;

import java.sql.Connection;

import hicinema.communityreply.vo.Communityreplygetset;
import hicinema.dao.HicinemaDAO;

public class CommunityreplyupdateService {

	public boolean UpdateCommunity(int replyno, Communityreplygetset crgs) throws Exception {
		boolean isModifySuccess = false;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		int updateCount = HDAO.updatecommunityreply(replyno, crgs);

		if (updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isModifySuccess;

	}

}
