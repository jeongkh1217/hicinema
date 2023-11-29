package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.movie.vo.Moviegetset;
import mybatis.Movieupdaterating;

public class UpdateMovierating implements Hicinemainterface{
	
	static UpdateMovierating im = new UpdateMovierating();
	public static UpdateMovierating instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		re.setCharacterEncoding("UTF-8");
		Moviegetset s = new Moviegetset();
		Movieupdaterating u = new Movieupdaterating();
		s.setMovieid(re.getParameter("movieid"));
		s.setRatingvalue(Double.parseDouble(re.getParameter("ratingvalue")));
		u.updateMovierating(s);		
		return null;
	}
}