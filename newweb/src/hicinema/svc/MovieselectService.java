package hicinema.svc;

import java.sql.Connection;
import java.util.ArrayList;

import hicinema.dao.HicinemaDAO;
import hicinema.movie.vo.*;
import static jdbcutil.JdbcUtil.* ;

public class MovieselectService {
	public ArrayList<Moviegetset> selectmoviedetail(String movieid) throws Exception {
		
		ArrayList<Moviegetset> mgs = null;
		Connection con = getConnection();
		HicinemaDAO HDAO = HicinemaDAO.getInstance();
		HDAO.setConnection(con);
		mgs = HDAO.moviedetailselect(movieid);
		close(con);
		return mgs;
		
	}

}
