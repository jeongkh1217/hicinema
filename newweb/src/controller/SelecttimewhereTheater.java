package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mybatis.Theaterselect;
import mybatis.Theaterselecttimewhere;
import hicinema.theater.vo.Theatergetset;


public class SelecttimewhereTheater implements Hicinemainterface {

	static SelecttimewhereTheater im = new SelecttimewhereTheater();
	public static SelecttimewhereTheater instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Theaterselecttimewhere s = Theaterselecttimewhere.instan();
		String theatername = re.getParameter("theatername");
		String movieid = re.getParameter("movieid");
		HashMap <String,Object> map = new HashMap<>();
		map.put("movieid",movieid);
		map.put("theatername",theatername);
		List<Theatergetset> list = s.selecttimetheater(map);
		re.setAttribute("theaterlist", list);
		return null;
	}

}