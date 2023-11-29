package hicinema.dao;

import static jdbcutil.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import hicinema.cart.Cartgetset;
import hicinema.community.vo.Communitycombinedgetset;
import hicinema.community.vo.Communitygetset;
import hicinema.communitylike.vo.Communitylikegetset;
import hicinema.communityreply.vo.Communityreplygetset;
import hicinema.member.vo.Membergetset;
import hicinema.movie.vo.Moviegetset;
import hicinema.movielike.vo.Movielikegetset;
import hicinema.reservation.vo.Reservationgetset;
import hicinema.snc.vo.SnCgetset;
import hicinema.store.Storegetset;
import hicinema.storelike.vo.StoreLikegetset;
import hicinema.theater.vo.*;

public class HicinemaDAO {
	DataSource ds;
	Connection con;
	private static HicinemaDAO theaterDAO;

	private HicinemaDAO() {
	}

	public static HicinemaDAO getInstance() {
		if (theaterDAO == null) {
			theaterDAO = new HicinemaDAO();
		}
		return theaterDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<Moviegetset> movielisttheaterselect() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from movie;";
		ArrayList<Moviegetset> movielist = new ArrayList<Moviegetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Moviegetset movietable = new Moviegetset();
				movietable.setMovieid(rs.getString("movieid"));
				movietable.setMovietitle(rs.getString("movietitle"));
				movietable.setDirector(rs.getString("director"));
				movietable.setStarring(rs.getString("starring"));
				movietable.setGenre(rs.getString("genre"));
				movietable.setSynopsis(rs.getString("synopsis"));
				movietable.setRunningtime(rs.getString("runningtime"));
				movietable.setRating(rs.getString("rating"));
				movietable.setReleasedate(rs.getString("releasedate"));
				movietable.setTotalview(rs.getInt("totalview"));
				movielist.add(movietable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return movielist;
	}

	public ArrayList<Theatergetset> theaterselect(String movieid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from theater where movieid='" + movieid + "';";
		ArrayList<Theatergetset> tlist = new ArrayList<Theatergetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Theatergetset ttable = new Theatergetset();
				ttable.setTheaterid(rs.getString("theaterid"));
				ttable.setTheatername(rs.getString("theatername"));
				tlist.add(ttable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return tlist;
	}

	public ArrayList<Moviegetset> moviedetailselect(String movieid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from movie where movieid='" + movieid + "';";
		ArrayList<Moviegetset> movielist = new ArrayList<Moviegetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Moviegetset movietable = new Moviegetset();
				movietable.setMovieid(rs.getString("movieid"));
				movietable.setMovietitle(rs.getString("movietitle"));
				movietable.setDirector(rs.getString("director"));
				movietable.setStarring(rs.getString("starring"));
				movietable.setGenre(rs.getString("genre"));
				movietable.setSynopsis(rs.getString("synopsis"));
				movietable.setRunningtime(rs.getString("runningtime"));
				movietable.setRating(rs.getString("rating"));
				movietable.setReleasedate(rs.getString("releasedate"));
				movietable.setTotalview(rs.getInt("totalview"));
				movielist.add(movietable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return movielist;

	}

	public List<Reservationgetset> selectseatwhere(Map<String, String> map) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select seat from reservation "
				+ "where theater=? and date=? and time=?";
		List<Reservationgetset> seatlist = new ArrayList<>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, map.get("theater"));
			pstmt.setString(2, map.get("date"));
			pstmt.setString(3, map.get("time"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Reservationgetset rgs = new Reservationgetset();
				rgs.setSeat(rs.getString("seat"));
				seatlist.add(rgs);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return seatlist;
	}
	public ArrayList<Communitygetset> searchcommunity(int page, int limit, Map<String, String> map) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
	    int startrow = (page - 1) * 10;
	    String sql = "SELECT * FROM community WHERE CONCAT(" + map.get("where") 
	    				+ ") LIKE ? ORDER BY postno DESC LIMIT ?, 10;";
	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + map.get("what") + "%");
	        pstmt.setInt(2, startrow);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Communitygetset Cgs2 = new Communitygetset();
	            Cgs2.setTab(rs.getString("tab"));
	            Cgs2.setPosttitle(rs.getString("posttitle"));
	            Cgs2.setPost(rs.getString("post"));
	            Cgs2.setId(rs.getString("id"));
	            Cgs2.setPostno(rs.getInt("postno"));
	            Cgs2.setViewed(rs.getInt("viewed"));
	            Cgs2.setRecommend(rs.getInt("recommend"));
	            Cgs2.setWrittendate(rs.getString("writtendate"));
	            Cgs.add(Cgs2);
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return Cgs;
	}
	public int selectsearchcount(Map<String, String> map) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int count = 0;

	    String sql = "SELECT COUNT(*) FROM community WHERE CONCAT(" + map.get("where") + ") LIKE ?";

	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "%" + map.get("what") + "%");
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return count;
	}
	

	public int insertReservation(Reservationgetset rgs) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;
		String seat = rgs.getSeat();
		String seats[] = seat.split("\\|");
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		for (int i = 0; i < seats.length; i++) {
			sql = "insert into reservation(reservationid,id,theater,date,time,seat,payby,paydate) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "R"+rgs.getId() + ts);
			pstmt.setString(2, rgs.getId());
			pstmt.setString(3, rgs.getTheater());
			pstmt.setString(4, rgs.getDate());
			pstmt.setString(5, rgs.getTime());
			pstmt.setString(6, seats[i]);
			pstmt.setString(7, rgs.getPayby());
			pstmt.setString(8, rgs.getPaydate());
			insertCount = pstmt.executeUpdate();
		}
		return insertCount;
	}

	public int selectpointwhere(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select point from member where id=?";
		int point = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				point = rs.getInt("point");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return point;
	}

	public int updatepluspoint(Map<String, Object> map) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "";
		int updateCount = 0;
		

		try {
			String id = (String) map.get("id");
			Integer pluspointObj = (Integer) map.get("pluspoint");

			if (id != null && pluspointObj != null) {
				int pluspoint = pluspointObj.intValue();

				sql = "update member set point = point + ? where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pluspoint);
				pstmt.setString(2, id);
				updateCount = pstmt.executeUpdate();
			} else {

			}
		} finally {

		}

		return updateCount;
	}

	public int updateminuspoint(Map<String, Object> map) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "";
		int updateCount = 0;

		try {
			String id = (String) map.get("id");
			Integer minuspointObj = (Integer) map.get("minuspoint");

			if (id != null && minuspointObj != null) {
				int minuspoint = minuspointObj.intValue();

				sql = "update member set point = point - ? where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, minuspoint);
				pstmt.setString(2, id);
				updateCount = pstmt.executeUpdate();
			} else {

			}
		} finally {

		}

		return updateCount;
	}

	public ArrayList<Reservationgetset> selectmypageseat(String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct reservationid from reservation where id='" + id
				+ "' order by reservationid desc;";
		ArrayList<Reservationgetset> rlist = new ArrayList<Reservationgetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservationgetset rtable = new Reservationgetset();
				rtable.setReservationid(rs.getString("reservationid"));
				rlist.add(rtable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return rlist;
	}

	public ArrayList<Reservationgetset> selectreservationmypage(String reservationid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reservation where reservationid='" + reservationid + "';";
		ArrayList<Reservationgetset> rlist = new ArrayList<Reservationgetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reservationgetset rtable = new Reservationgetset();
				rtable.setReservationid(rs.getString("reservationid"));
				rtable.setTheater(rs.getString("theater"));
				rtable.setDate(rs.getString("date"));
				rtable.setTime(rs.getString("time"));
				rtable.setSeat(rs.getString("seat"));
				rtable.setPayby(rs.getString("payby"));
				rtable.setPaydate(rs.getString("paydate"));
				rlist.add(rtable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return rlist;
	}

	public ArrayList<Cartgetset> selectpurchasemypage(String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT DISTINCT purchaseid FROM cart WHERE id = ? AND purchased = 'y' ORDER BY purchaseid DESC;";
		ArrayList<Cartgetset> clist = new ArrayList<Cartgetset>();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Cartgetset ctable = new Cartgetset();
				ctable.setPurchaseid(rs.getString("purchaseid"));
				clist.add(ctable);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return clist;
	}

	public ArrayList<Cartgetset> selectpurchasemypageajax(String pid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart where purchaseid=? and purchased = 'y' order by itemid asc;";
		ArrayList<Cartgetset> clist = new ArrayList<Cartgetset>();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Cartgetset ctable = new Cartgetset();
				ctable.setPurchaseid(rs.getString("purchaseid"));
				ctable.setItemid(rs.getString("itemid"));
				ctable.setQuantity(rs.getInt("quantity"));
				ctable.setPayby(rs.getString("payby"));
				ctable.setPaydate(rs.getTimestamp("paydate"));
				clist.add(ctable);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return clist;
	}

	public ArrayList<Storegetset> selectpurchasemypageajax(ArrayList<String> itemIds) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT itemname, itemid, price FROM store WHERE itemid IN (";

	    if (itemIds == null || itemIds.isEmpty()) {
	        return new ArrayList<>();
	    }

	    for (int i = 0; i < itemIds.size(); i++) {
	        sql += "?";
	        if (i < itemIds.size() - 1) {
	            sql += ",";
	        }
	    }
	    sql += ") ORDER BY itemid ASC;";

	    ArrayList<Storegetset> slist = new ArrayList<>();

	    try {
	        pstmt = con.prepareStatement(sql);
	        for (int i = 0; i < itemIds.size(); i++) {
	            pstmt.setString(i + 1, itemIds.get(i));
	        }


	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Storegetset stable = new Storegetset();
	            stable.setItemname(rs.getString("itemname"));
	            stable.setItemid(rs.getString("itemid"));
	            stable.setPrice(rs.getInt("price"));
	            slist.add(stable);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return slist;
	}


	public ArrayList<SnCgetset> selectsncmypage(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from starrating where id=? order by writtendatetime asc;";
		ArrayList<SnCgetset> slist = new ArrayList<SnCgetset>();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SnCgetset stable = new SnCgetset();
				stable.setComment(rs.getString("comment"));
				stable.setMovieid(rs.getString("movieid"));
				stable.setCommentlike(rs.getInt("commentlike"));
				stable.setStarrating(rs.getInt("starrating"));
				stable.setWrittendatetime(rs.getDate("writtendatetime"));
				
				slist.add(stable);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return slist;
	}

	public ArrayList<Moviegetset> selectmoviemypage(ArrayList<String> movieIds) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    if (movieIds == null || movieIds.isEmpty()) {
	        return new ArrayList<>();
	    }

	    String sql = "SELECT * FROM movie WHERE movieid IN (";
	    for (int i = 0; i < movieIds.size(); i++) {
	        if (i > 0) {
	            sql += ",";
	        }
	        sql += "?";
	    }
	    sql += ") ORDER BY movieid ASC;";

	    ArrayList<Moviegetset> mlist = new ArrayList<>();

	    try {
	        pstmt = con.prepareStatement(sql);

	        for (int i = 0; i < movieIds.size(); i++) {
	            pstmt.setString(i + 1, movieIds.get(i));
	        }


	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Moviegetset mtable = new Moviegetset();
	            mtable.setMovieid(rs.getString("movieid"));
	            mtable.setMovietitle(rs.getString("movietitle"));
	            mtable.setGenre(rs.getString("genre"));
	            mtable.setRatingvalue(rs.getDouble("ratingvalue"));
	            mtable.setTotalview(rs.getInt("totalview"));

	            mlist.add(mtable);
	        }
	    } catch (Exception ex) {

	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return mlist;
	}

	public ArrayList<StoreLikegetset> selectstorelikemypage(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select itemid from storelike where id=? order by itemid desc;";
		ArrayList<StoreLikegetset> sllist = new ArrayList<StoreLikegetset>();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StoreLikegetset sltable = new StoreLikegetset();
				sltable.setItemid(rs.getString("itemid"));				
				sllist.add(sltable);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return sllist;
	}
	
	public ArrayList<Movielikegetset> selectmovielikemypage(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select movieid from movielike where id=? order by movieid asc;";
		ArrayList<Movielikegetset> mllist = new ArrayList<Movielikegetset>();
		try {			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Movielikegetset mltable = new Movielikegetset();
				mltable.setMovieid(rs.getString("movieid"));				
				mllist.add(mltable);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mllist;
	}
	
	public ArrayList<Membergetset> memberdetailselect(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id='" + id + "';";
		ArrayList<Membergetset> member = new ArrayList<Membergetset>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Membergetset mtable = new Membergetset();
				mtable.setId(rs.getString("id"));
				mtable.setName(rs.getString("name"));
				mtable.setJoindate(rs.getDate("joindate"));
				mtable.setPoint(rs.getInt("point"));				
				member.add(mtable);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return member;

	}

	public int deletereservation(String reservationid) {
		PreparedStatement pstmt = null;
		int deletecount = 0;
		String sql = "delete from reservation where reservationid = ?;";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, reservationid);
				deletecount = pstmt.executeUpdate();
			} catch(Exception ex) {
				
			} finally {
				close(pstmt);
			}
		return deletecount;
	}

	public int deletepurchase(String purchaseid) {
		PreparedStatement pstmt = null;
		int deletecount = 0;
		String sql = "delete from cart where purchaseid = ?;";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, purchaseid);
				deletecount = pstmt.executeUpdate();
			} catch(Exception ex) {
				
			} finally {
				close(pstmt);
			}
		return deletecount;
	}

	public int selectpostcountall() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from community;");
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<Communitygetset> selectpostlist(int page, int limit, String tab) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community where tab=? order by postno desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tab);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;

	}
	
	public ArrayList<Communitygetset> selectpostalllist(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community order by postno desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;
	}
	
	public ArrayList<Communitygetset> selectpostalllistrecommend(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community order by recommend desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;
	}
	
	public ArrayList<Communitygetset> selectpostalllistviewed(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community order by viewed desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;
	}

	public ArrayList<Communitygetset> selectpostrecommend(int page, int limit, String tab) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community where tab=? order by recommend desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tab);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;

	}

	public ArrayList<Communitygetset> selectpostviewed(int page, int limit, String tab) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ArrayList<Communitygetset> Cgs = new ArrayList<Communitygetset>();
		int startrow=(page-1)*10; 
		String sql="SELECT * FROM community where tab=? order by viewed desc,writtendate desc limit ?,10;";

		try{
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tab);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs.add(Cgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Cgs;

	}

	public int selectpostcountreview() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from community where tab='review';");
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;
	}
	
	public int selectpostcountfree() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from community where tab='free';");
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public int insertcommunity(Communitygetset cgs) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount=0;

		try{

			String sql="insert into community (tab,posttitle,post,id,file1, file2, file3,file4,file5,writtendate) values(?,?,?,?,?,?,?,?,?,?)";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cgs.getTab());
			pstmt.setString(2, cgs.getPosttitle());
			pstmt.setString(3, cgs.getPost());
			pstmt.setString(4, cgs.getId());
			pstmt.setString(5, cgs.getFile1());
			pstmt.setString(6, cgs.getFile2());
			pstmt.setString(7, cgs.getFile3());
			pstmt.setString(8, cgs.getFile4());
			pstmt.setString(9, cgs.getFile5());
			pstmt.setString(10, cgs.getWrittendate());

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public ArrayList<Communitycombinedgetset> selectcommunitydetail(int postno, int replypage, int replylimit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		int startRow = (replypage - 1) * replylimit;
		ArrayList<Communitycombinedgetset> Ccgs = new ArrayList<Communitycombinedgetset>();
		
		 String sql = "SELECT community.*, communityreply.* " +
		            "FROM community " +
		            "LEFT JOIN communityreply ON community.postno = "
		            + "communityreply.postno " +
		            "WHERE community.postno = ? " +
		            "ORDER BY communityreply.replyno ASC " +  
		            "LIMIT ?, ?";  

		try{	
			 pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, postno);
		        pstmt.setInt(2, startRow);
		        pstmt.setInt(3, replylimit);
		        rs = pstmt.executeQuery();
			while(rs.next()){
				Communitygetset Cgs2 = new Communitygetset();
				Communityreplygetset Crgs2 = new Communityreplygetset();
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setTab(rs.getString("tab"));
				Cgs2.setPosttitle(rs.getString("posttitle"));
				Cgs2.setPost(rs.getString("post"));
				Cgs2.setId(rs.getString("id"));
				Cgs2.setPostno(rs.getInt("postno"));
				Cgs2.setViewed(rs.getInt("viewed"));
				Cgs2.setRecommend(rs.getInt("recommend"));
				Cgs2.setWrittendate(rs.getString("writtendate"));	
				Cgs2.setFile1(rs.getString("file1"));
				Cgs2.setFile2(rs.getString("file2"));
				Cgs2.setFile3(rs.getString("file3"));
				Cgs2.setFile4(rs.getString("file4"));
				Cgs2.setFile5(rs.getString("file5"));
				Crgs2.setPostno(rs.getInt("postno"));
				Crgs2.setReplyid(rs.getString("replyid"));
				Crgs2.setReplyno(rs.getInt("replyno"));
				Crgs2.setReplypost(rs.getString("replypost"));
				Crgs2.setReplywrittendate(rs.getString("replywrittendate"));
				
				Communitycombinedgetset Ccgs2 = new Communitycombinedgetset();
				Ccgs2.setCgs(Cgs2);
				Ccgs2.setCrgs(Crgs2);
				Ccgs.add(Ccgs2);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return Ccgs;

	}

	public int insertcommunityreply(Communityreplygetset crgs) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount=0;

		try{

			String sql="insert into communityreply (postno,replypost,replyid,replywrittendate) values(?,?,?,?)";	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, crgs.getPostno());
			pstmt.setString(2, crgs.getReplypost());
			pstmt.setString(3, crgs.getReplyid());
			pstmt.setString(4, crgs.getReplywrittendate());
			

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	public int updatecommunity(int postno, Communitygetset cgs) {
	    int updateCount = 0;
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE community SET posttitle=?, post=? WHERE postno=?";
	    
	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, cgs.getPosttitle());
	        pstmt.setString(2, cgs.getPost());
	        pstmt.setInt(3, postno);
	        updateCount = pstmt.executeUpdate();
	        
	    } catch (SQLException ex) {
	        ex.printStackTrace();  
	    } finally {
	        close(pstmt);
	    }
	    return updateCount;
	}

	public int deletecommunity(int postno) {
		PreparedStatement pstmt = null;
		int deletecount = 0;
		String sql = "delete from community where postno = ?;";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, postno);
				deletecount = pstmt.executeUpdate();
			} catch(Exception ex) {
				
			} finally {
				close(pstmt);
			}
		return deletecount;
	}	
	public int updatecommunityreply(int replyno, Communityreplygetset crgs) {
	    int updateCount = 0;
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE communityreply SET replypost=? WHERE replyno=?";
	    
	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, crgs.getReplypost());
	        pstmt.setInt(2, replyno);
	        updateCount = pstmt.executeUpdate();
	        
	    } catch (SQLException ex) {
	        ex.printStackTrace();  
	    } finally {
	        close(pstmt);
	    }
	    return updateCount;
	}

	public int deletecommunityreply(int replyno) {
		PreparedStatement pstmt = null;
		int deletecount = 0;
		String sql = "delete from communityreply where replyno = ?;";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, replyno);
				deletecount = pstmt.executeUpdate();
			} catch(Exception ex) {
				
			} finally {
				close(pstmt);
			}
		return deletecount;
	}

	public int updatecommunityreadcount(int postno) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update community set viewed = "+
				"viewed+1 where postno = "+postno;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);

		}
		return updateCount;
	}

	public int selectcommunityreplycount(int postno) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int replycount = 0;
	    String sql = "SELECT COUNT(*) FROM communityreply WHERE postno=?";

	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, postno);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            replycount = rs.getInt(1);
	        }
	    } catch (SQLException ex) {
	        ex.printStackTrace();  
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return replycount;
	}

	public ArrayList<Communitygetset> selectcommunitymypage(String id) {
		ArrayList<Communitygetset> cgs = new ArrayList<Communitygetset>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from community where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Communitygetset cgs2 = new Communitygetset();
				cgs2.setPostno(rs.getInt("postno"));
				cgs2.setPosttitle(rs.getString("posttitle"));
				cgs2.setPost(rs.getString("post"));
				cgs2.setTab(rs.getString("tab"));
				cgs2.setRecommend(rs.getInt("recommend"));
				cgs2.setViewed(rs.getInt("viewed"));
				cgs2.setWrittendate(rs.getString("writtendate"));
				cgs.add(cgs2);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cgs;
	}

	public ArrayList<Communitylikegetset> selectcommunitylikemypage(String id) {
		ArrayList<Communitylikegetset> clgs = new ArrayList<Communitylikegetset>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from communitylike where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Communitylikegetset clgs2 = new Communitylikegetset();
				clgs2.setPostno(rs.getInt("postno"));
				clgs2.setId(rs.getString("id"));
				clgs.add(clgs2);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return clgs;
	}

	public ArrayList<Communitygetset> selectcommunitylikelistmypage(ArrayList<Integer> postNoList) {
	    ArrayList<Communitygetset> cgs = new ArrayList<Communitygetset>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuilder sql = new StringBuilder("SELECT * FROM community WHERE postno IN (");

	    try {
	        for (int i = 0; i < postNoList.size(); i++) {
	            sql.append("?");
	            if (i < postNoList.size() - 1) {
	                sql.append(", ");
	            }
	        }
	        sql.append(")");

	        pstmt = con.prepareStatement(sql.toString());

	        for (int i = 0; i < postNoList.size(); i++) {
	            pstmt.setInt(i + 1, postNoList.get(i));
	        }

	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Communitygetset cgs2 = new Communitygetset();
	            cgs2.setPostno(rs.getInt("postno"));
	            cgs2.setId(rs.getString("id"));
	            cgs2.setPosttitle(rs.getString("posttitle"));
	            cgs2.setPost(rs.getString("post"));
	            cgs2.setTab(rs.getString("tab"));
	            cgs2.setRecommend(rs.getInt("recommend"));
	            cgs2.setViewed(rs.getInt("viewed"));
	            cgs2.setWrittendate(rs.getString("writtendate"));
	            cgs.add(cgs2);
	        }
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return cgs;
	}
	
	
	
}