package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Movieselect;
import hicinema.movie.vo.*;

public class SelectMovieRatingvalue implements Hicinemainterface {

	static SelectMovieRatingvalue im = new SelectMovieRatingvalue();
	public static SelectMovieRatingvalue instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Movieselect s = Movieselect.instan();
		List<Moviegetset> list = s.selectmovieratingvalue();
		re.setAttribute("movielist", list);
		return null;
	}

}
