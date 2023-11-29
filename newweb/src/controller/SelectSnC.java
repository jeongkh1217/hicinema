package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mybatis.SnCselect;
import hicinema.snc.vo.SnCgetset;


public class SelectSnC implements Hicinemainterface {

	static SelectSnC im = new SelectSnC();
	public static SelectSnC instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		SnCselect s = SnCselect.instan();
		String movieid=re.getParameter("movieid");	
		int page = Integer.parseInt(re.getParameter("page"));
		int offset = (page-1)*10;
		int limit = 10;
		HashMap <String,Object> map = new HashMap<>();
		map.put("movieid",movieid);
		map.put("offset",offset);
		map.put("limit",limit);
		List<SnCgetset> list = s.selectsnc(map);
		re.setAttribute("snclist", list);
		return null;
	}
}
