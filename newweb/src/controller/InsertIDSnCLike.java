package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.snclike.vo.SnCLikegetset;
import mybatis.SnCLikeinsertID;

public class InsertIDSnCLike implements Hicinemainterface{
	
	static InsertIDSnCLike im = new InsertIDSnCLike();
	public static InsertIDSnCLike instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		SnCLikegetset s = new SnCLikegetset();
		SnCLikeinsertID i = new SnCLikeinsertID();
		s.setId(re.getParameter("id"));
		s.setSncno(Integer.parseInt(re.getParameter("sncno")));
		i.insertsnclikeid(s);		
		return null;
	}
}
