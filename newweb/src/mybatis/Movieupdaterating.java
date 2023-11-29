package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.movie.vo.Moviegetset;

public class Movieupdaterating {
	static Movieupdaterating mo = new Movieupdaterating();
	public static Movieupdaterating instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void updateMovierating(Moviegetset movie) {
		SqlSession s = f.openSession();
		s.update("updatemovieratingvalue", movie);
		s.commit();
		s.close();

	}
}