package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Leftseatselect;


public class Selectleftseatwhere implements Hicinemainterface {

	static Selectleftseatwhere im = new Selectleftseatwhere();
	public static Selectleftseatwhere instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		Leftseatselect s = Leftseatselect.instan();
		Map<String, String> map = new HashMap<String,String>();
		String theater = re.getParameter("theater");
		String date=re.getParameter("date");
		String time=re.getParameter("time");
		map.put("theater", theater);
		map.put("date", date);
		map.put("time", time);	
		
		int seat = s.selectleftseat(map);
		
		re.setAttribute("leftseat", seat);
		return null;
	}

}