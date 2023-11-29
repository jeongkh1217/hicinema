package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.SnCLikecheckID;

public class CheckIDSnCLike implements Hicinemainterface {

	static CheckIDSnCLike im = new CheckIDSnCLike();
	public static CheckIDSnCLike instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		SnCLikecheckID s = SnCLikecheckID.instan();
		int sncno = Integer.parseInt(re.getParameter("sncno"));
		String id=re.getParameter("id");		
		int count = s.checksnclikeid(sncno,id);
		re.setAttribute("count", count);
		return null;
	}
}
