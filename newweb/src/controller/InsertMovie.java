package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Movieinsert;
import hicinema.movie.vo.*;

public class InsertMovie implements Hicinemainterface{
	
	static InsertMovie im = new InsertMovie();
	public static InsertMovie instan() {
		return im;
	}
	
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {	
		Moviegetset m = new Moviegetset();		
		Movieinsert i = new Movieinsert();
		m.setMovieid(re.getParameter("movieid"));
		m.setMovietitle(re.getParameter("movietitle"));
		m.setGenre(re.getParameter("genre"));
		m.setStarring(re.getParameter("starring"));
		m.setRating(re.getParameter("rating"));
		m.setReleasedate(re.getParameter("releasedate"));
		m.setDirector(re.getParameter("director"));
		m.setSynopsis(re.getParameter("synopsis"));
		m.setRunningtime(re.getParameter("runningtime"));
		m.setFile(re.getParameter("file"));
		m.setTotalview(Integer.parseInt(re.getParameter("totalview")));
		i.insertDb(m);
		return null;
		
	
	}

}
