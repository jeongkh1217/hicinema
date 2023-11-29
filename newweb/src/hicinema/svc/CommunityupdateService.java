package hicinema.svc;

import static jdbcutil.JdbcUtil.*;

import java.sql.Connection;

import hicinema.dao.*;
import hicinema.community.vo.*;

public class CommunityupdateService {	

	public boolean UpdateCommunity(int postno, Communitygetset cgs) throws Exception {		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		int updateCount = HDAO.updatecommunity(postno,cgs);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

	

}



