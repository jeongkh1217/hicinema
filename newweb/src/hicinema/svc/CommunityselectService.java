package hicinema.svc;

import static jdbcutil.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import hicinema.community.vo.Communitycombinedgetset;
import hicinema.community.vo.Communitygetset;
import hicinema.dao.HicinemaDAO;

public class CommunityselectService {
	public int getsearchcount(Map<String,String> map) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		listCount = HDAO.selectsearchcount(map);
		close(con);
		return listCount;
		
	}
	public ArrayList<Communitygetset> searchcommunity(int page,int limit,Map<String,String> map) {
		ArrayList<Communitygetset> Ccgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		Ccgs = HDAO.searchcommunity(page, limit, map);
		close(con);
		return Ccgs;
	}


	public int getListCountall() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		listCount = HDAO.selectpostcountall();
		close(con);
		return listCount;
		
	}

	public ArrayList<Communitygetset> getPostListpostno(int page, int limit, String tab) throws Exception{		
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostlist(page,limit, tab);
		close(con);
		return Cgs;
		
	}

	public ArrayList<Communitygetset> getPostListrecommend(int page, int limit, String tab) {
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostrecommend(page,limit, tab);
		close(con);
		return Cgs;
	}

	public ArrayList<Communitygetset> getPostListviewed(int page, int limit, String tab) {
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostviewed(page,limit, tab);
		close(con);
		return Cgs;
	}

	public int getListCountfree() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		listCount = HDAO.selectpostcountfree();
		close(con);
		return listCount;
		
	}
	public int getListCountreview() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		listCount = HDAO.selectpostcountreview();
		close(con);
		return listCount;
		
	}

	public ArrayList<Communitygetset> getPostListrecommendall(int page, int limit) throws Exception{
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostalllistrecommend(page,limit);
		close(con);
		return Cgs;
	}
	public ArrayList<Communitygetset> getPostListviewedall(int page, int limit) throws Exception{
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostalllistviewed(page,limit);
		close(con);
		return Cgs;
	}
	public ArrayList<Communitygetset> getPostListpostnoall(int page, int limit) throws Exception{		
		ArrayList<Communitygetset> Cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		Cgs = HDAO.selectpostalllist(page,limit);
		close(con);
		return Cgs;
		
	}

	public ArrayList<Communitycombinedgetset> selectcommunitydetail(int postno,int replypage, int replylimit) {
		ArrayList<Communitycombinedgetset> Ccgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		int updateCount = HDAO.updatecommunityreadcount(postno);
		if(updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		Ccgs = HDAO.selectcommunitydetail(postno, replypage, replylimit);
		close(con);
		return Ccgs;
	}
	
	
	

}
