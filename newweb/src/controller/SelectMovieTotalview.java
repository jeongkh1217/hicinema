package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Movieselect;
import hicinema.movie.vo.*;

public class SelectMovieTotalview implements Hicinemainterface {

	static SelectMovieTotalview im = new SelectMovieTotalview();
	public static SelectMovieTotalview instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Movieselect s = Movieselect.instan();
		List<Moviegetset> list = s.selectmovietotalview();
		re.setAttribute("movielist", list);
		return null;
	}

}
