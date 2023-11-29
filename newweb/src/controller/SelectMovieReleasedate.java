package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Movieselect;
import hicinema.movie.vo.*;

public class SelectMovieReleasedate implements Hicinemainterface {

	static SelectMovieReleasedate im = new SelectMovieReleasedate();
	public static SelectMovieReleasedate instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Movieselect s = Movieselect.instan();
		List<Moviegetset> list = s.selectmoviereleasedate();
		re.setAttribute("movielist", list);
		return null;
	}

}