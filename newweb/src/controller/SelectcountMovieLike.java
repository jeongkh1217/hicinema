package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.MovieLikeselectcount;

public class SelectcountMovieLike implements Hicinemainterface {

	static SelectcountMovieLike im = new SelectcountMovieLike();
	public static SelectcountMovieLike instan() {
		return im;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		MovieLikeselectcount s = MovieLikeselectcount.instan();
		String movieid=re.getParameter("movieid");
		int count = s.selectcountMovieLike(movieid);
		re.setAttribute("movielikecount", count);
		return null;
	}
}