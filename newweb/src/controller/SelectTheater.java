package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mybatis.Theaterselect;

import hicinema.theater.vo.Theatergetset;


public class SelectTheater implements Hicinemainterface {

	static SelectTheater im = new SelectTheater();
	public static SelectTheater instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Theaterselect s = Theaterselect.instan();
		List<Theatergetset> list = s.selecttheater();
		re.setAttribute("theaterlist", list);
		return null;
	}

}
