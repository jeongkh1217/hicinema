package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.movie.vo.*;

public class Movieselect {
	static Movieselect mo = new Movieselect();
	public static Movieselect instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<Moviegetset> selectmovietotalview() {
		SqlSession s = f.openSession();
		List<Moviegetset> list=s.selectList("selectmovietotalview");
		s.close();
		return list;		
	}
	public List<Moviegetset> selectmoviemovietitle() {
		SqlSession s = f.openSession();
		List<Moviegetset> list=s.selectList("selectmoviemovietitle");
		s.close();
		return list;		
	}
	public List<Moviegetset> selectmoviereleasedate() {
		SqlSession s = f.openSession();
		List<Moviegetset> list=s.selectList("selectmoviereleasedate");
		s.close();
		return list;		
	}
	public List<Moviegetset> selectmovieratingvalue() {
		SqlSession s = f.openSession();
		List<Moviegetset> list=s.selectList("selectmovieratingvalue");
		s.close();
		return list;		
	}
}