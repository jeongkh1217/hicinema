package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.movie.vo.Moviegetset;

public class Movieselectwhere {
	static Movieselectwhere mo = new Movieselectwhere();
	public static Movieselectwhere instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<Moviegetset> selectwheremovie(String movieid) {
		SqlSession s = f.openSession();
		List<Moviegetset> list=s.selectList("selectwheremovie",movieid);
		s.close();
		return list;		
	}
}