package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.theater.vo.Theatergetset;
import mybatis.Theaterselectwhere;

public class SelectwhereTheater implements Hicinemainterface {
	static SelectwhereTheater im = new SelectwhereTheater();
	public static SelectwhereTheater instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub		
		Theaterselectwhere s = new Theaterselectwhere();
		String movieid = re.getParameter("movieid");
		List<Theatergetset> list = s.selectwheretheater(movieid);
		re.setAttribute("list", list);
		return null;
	}

}

