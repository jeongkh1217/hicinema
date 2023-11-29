package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Movieselect;
import hicinema.movie.vo.*;

public class SelectMovieMovietitle implements Hicinemainterface {

	static SelectMovieMovietitle im = new SelectMovieMovietitle();
	public static SelectMovieMovietitle instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Movieselect s = Movieselect.instan();
		List<Moviegetset> list = s.selectmoviemovietitle();
		re.setAttribute("movielist", list);
		return null;
	}

}