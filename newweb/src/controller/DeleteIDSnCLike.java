package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.SnCLikedeleteID;

public class DeleteIDSnCLike implements Hicinemainterface {

	static DeleteIDSnCLike im = new DeleteIDSnCLike();
	public static DeleteIDSnCLike instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		SnCLikedeleteID s = SnCLikedeleteID.instan();
		int sncno = Integer.parseInt(re.getParameter("sncno"));
		String id=re.getParameter("id");		
		s.deletesnclikeid(sncno,id);
		return null;
	}
}