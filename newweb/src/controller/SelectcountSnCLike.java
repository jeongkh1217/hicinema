package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.SnCLikeselectcount;

public class SelectcountSnCLike implements Hicinemainterface {

	static SelectcountSnCLike im = new SelectcountSnCLike();
	public static SelectcountSnCLike instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		SnCLikeselectcount s = SnCLikeselectcount.instan();
		int sncno=Integer.parseInt(re.getParameter("sncno"));
		int count = s.selectcountSnCLike(sncno);
		re.setAttribute("count", count);
		return null;
	}
}