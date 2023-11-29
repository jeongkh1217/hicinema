package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mybatis.Movieselecttotalview;

public class SelecttotalviewMovie implements Hicinemainterface {

	static SelecttotalviewMovie im = new SelecttotalviewMovie();
	public static SelecttotalviewMovie instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		re.setCharacterEncoding("UTF-8");
		Movieselecttotalview s = Movieselecttotalview.instan();
		int totalview = s.selecttotalviewmovie();
		re.setAttribute("movietotalview", totalview);
		return null;
	}
	
}
