package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.getConnection;

import java.sql.Connection;

import hicinema.dao.HicinemaDAO;

public class CommunityreplycountService {
	public int communityreplycount(int postno) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		listCount = HDAO.selectcommunityreplycount(postno);
		close(con);
		return listCount;
		
	}

}
