package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hicinema.snc.vo.SnCpagegetset;
import mybatis.SnCboardlist;

public class SnCPaging implements Hicinemainterface {
	static SnCPaging im = new SnCPaging();
	public static SnCPaging instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		int page=1;
		int limit=10;		
		if(re.getParameter("page")!=null){
			page=Integer.parseInt(re.getParameter("page"));}  		
		SnCboardlist Sb = new SnCboardlist();
		String movieid = re.getParameter("movieid");
		int listCount = Sb.getListCount(movieid);
		int maxPage=(int)((double)listCount/limit+0.95); 		
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	    
   	 if (endPage> maxPage) endPage= maxPage;
		SnCpagegetset SnCpagegetset = new SnCpagegetset();
		SnCpagegetset.setEndPage(endPage);
		SnCpagegetset.setListCount(listCount);
		SnCpagegetset.setMaxPage(maxPage);
		SnCpagegetset.setPage(page);
		SnCpagegetset.setStartPage(startPage);	
		re.setAttribute("SnCpagegetset", SnCpagegetset);		
		return null;
	}

}
