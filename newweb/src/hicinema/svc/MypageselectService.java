package hicinema.svc;

import static jdbcutil.JdbcUtil.close;
import static jdbcutil.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import hicinema.cart.Cartgetset;
import hicinema.community.vo.Communitygetset;
import hicinema.communitylike.vo.Communitylikegetset;
import hicinema.dao.HicinemaDAO;
import hicinema.member.vo.Membergetset;
import hicinema.movie.vo.Moviegetset;
import hicinema.movielike.vo.Movielikegetset;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.snc.vo.SnCgetset;
import hicinema.store.Storegetset;
import hicinema.storelike.vo.StoreLikegetset;

public class MypageselectService {
		
		
	public ArrayList<Reservationgetset> selectmypageseat(String id) throws Exception {
		ArrayList<Reservationgetset> rgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		rgs = HDAO.selectmypageseat(id);
		close(con);
		return rgs;
	}
	public ArrayList<Reservationgetset> selectreservationmypageajax(String reservationid) throws Exception {
		ArrayList<Reservationgetset> rgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		rgs = HDAO.selectreservationmypage(reservationid);
		close(con);
		return rgs;
	}
	public ArrayList<Cartgetset> selectmypagepurchase(String id) throws Exception {
		ArrayList<Cartgetset> cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		cgs = HDAO.selectpurchasemypage(id);
		close(con);
		return cgs;
	}
	public ArrayList<Cartgetset> selectpurchasemypageajax(String pid) {
		ArrayList<Cartgetset> cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		cgs = HDAO.selectpurchasemypageajax(pid);
		close(con);
		return cgs;
	}
	public ArrayList<Storegetset> selectitemnamemypageajax(ArrayList<String> itemIds) {
		ArrayList<Storegetset> sgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		sgs = HDAO.selectpurchasemypageajax(itemIds);
		close(con);
		return sgs;
	}
	public ArrayList<SnCgetset> selectmypageSnC(String id) {
		ArrayList<SnCgetset> Sgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		Sgs = HDAO.selectsncmypage(id);
		close(con);
		return Sgs;
	}
	public ArrayList<Moviegetset> selectmypagemovie(ArrayList<String> movieIds) {
		ArrayList<Moviegetset> mgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		mgs = HDAO.selectmoviemypage(movieIds);
		close(con);
		return mgs;
	}
	public ArrayList<StoreLikegetset> selectmypagestorelike(String id) {
		ArrayList<StoreLikegetset> slgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		slgs = HDAO.selectstorelikemypage(id);
		close(con);
		return slgs;
	}
	public ArrayList<Movielikegetset> selectmypagemovielike(String id) {
		ArrayList<Movielikegetset> mlgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		mlgs = HDAO.selectmovielikemypage(id);
		close(con);
		return mlgs;
	}
	public ArrayList<Membergetset> selectmypagemember(String id) {
		ArrayList<Membergetset> mgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		mgs = HDAO.memberdetailselect(id);
		close(con);
		return mgs;
	}
	
	public ArrayList<Communitygetset> selectmypagecommunity(String id) {
		ArrayList<Communitygetset> cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		cgs = HDAO.selectcommunitymypage(id);
		close(con);
		return cgs;
	}
	
	public ArrayList<Communitylikegetset> selectmypagecommunitylike(String id) {
		ArrayList<Communitylikegetset> clgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		clgs = HDAO.selectcommunitylikemypage(id);
		close(con);
		return clgs;
	}
	
	public ArrayList<Communitygetset> selectmypagecommunitylikereal(ArrayList<Integer> postNoList) {
		ArrayList<Communitygetset> cgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);		
		cgs = HDAO.selectcommunitylikelistmypage(postNoList);
		close(con);
		return cgs;
	}
	

}
