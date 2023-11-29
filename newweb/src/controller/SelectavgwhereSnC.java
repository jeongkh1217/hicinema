package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.SnCselectavgwhere;

public class SelectavgwhereSnC implements Hicinemainterface {
	static SelectavgwhereSnC im = new SelectavgwhereSnC();
	public static SelectavgwhereSnC instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub		
		re.setCharacterEncoding("UTF-8");
		SnCselectavgwhere s = new SnCselectavgwhere();
		String movieid = re.getParameter("movieid");
		double avg = s.selectavgwheresnc(movieid);
		re.setAttribute("avg", avg);
		return null;
	}

}