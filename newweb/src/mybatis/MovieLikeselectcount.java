package mybatis;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MovieLikeselectcount {
	static MovieLikeselectcount mo = new MovieLikeselectcount();
	public static MovieLikeselectcount instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public int selectcountMovieLike(String movieid) {
		SqlSession s = f.openSession();
		String mid=movieid;
		int count=s.selectOne("totalcountmovielike",mid);
		s.close();	
		return count;	
		
	}
}