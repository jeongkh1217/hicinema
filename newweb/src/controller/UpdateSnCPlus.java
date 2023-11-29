package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.snc.vo.SnCgetset;
import mybatis.SnCupdateplus;

public class UpdateSnCPlus implements Hicinemainterface{
	
	static UpdateSnCPlus im = new UpdateSnCPlus();
	public static UpdateSnCPlus instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		re.setCharacterEncoding("UTF-8");
		SnCgetset s = new SnCgetset();
		SnCupdateplus u = new SnCupdateplus();
		s.setSncno(Integer.parseInt(re.getParameter("sncno")));
		u.updateSnCplus(s);	
		return null;
	}
}