package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.snc.vo.SnCgetset;
import mybatis.SnCupdateminus;

public class UpdateSnCMinus implements Hicinemainterface{
	
	static UpdateSnCMinus im = new UpdateSnCMinus();
	public static UpdateSnCMinus instan() {
		return im;
	}
	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		re.setCharacterEncoding("UTF-8");
		SnCgetset s = new SnCgetset();
		SnCupdateminus u = new SnCupdateminus();
		s.setSncno(Integer.parseInt(re.getParameter("sncno")));
		u.updateSnCminus(s);	
		return null;
	}
}