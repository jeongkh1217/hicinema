package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.movie.vo.Moviegetset;
import mybatis.Movieselectwhere;

public class SelectwhereMovie implements Hicinemainterface {
	static SelectwhereMovie im = new SelectwhereMovie();
	public static SelectwhereMovie instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub		
		Movieselectwhere s = new Movieselectwhere();
		String movieid = re.getParameter("movieid");
		List<Moviegetset> list = s.selectwheremovie(movieid);
		re.setAttribute("movielist", list);
		return null;
	}

}

