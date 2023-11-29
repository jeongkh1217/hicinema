package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.SnCcheck;


public class CheckSnC implements Hicinemainterface {

	static CheckSnC im = new CheckSnC();
	public static CheckSnC instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		SnCcheck s = SnCcheck.instan();
		String movieid=re.getParameter("movieid");
		String id = re.getParameter("id");
		int count = s.checksnc(movieid,id);
		re.setAttribute("count", count);
		return null;
	}
}
