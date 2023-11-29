package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.movie.vo.*;

public class Movieinsert {
	static Movieinsert mo = new Movieinsert();
	public static Movieinsert instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void insertDb(Moviegetset m) {

		SqlSession s = f.openSession();
		s.insert("insertmovie",m);
		s.commit();
		s.close();

	}
}