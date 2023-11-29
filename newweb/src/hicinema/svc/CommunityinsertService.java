package hicinema.svc;

import static jdbcutil.JdbcUtil.*;
import java.sql.Connection;
import hicinema.dao.*;
import hicinema.community.vo.Communitygetset;

public class CommunityinsertService {
	public boolean InsertCommunity(Communitygetset cgs) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		int insertCount = HDAO.insertcommunity(cgs);
		
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
