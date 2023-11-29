package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.theater.vo.Theatergetset;

public class Theaterselectwhere {
	static Theaterselectwhere mo = new Theaterselectwhere();
	public static Theaterselectwhere instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<Theatergetset> selectwheretheater(String movieid) {
		SqlSession s = f.openSession();
		List<Theatergetset> list=s.selectList("selectwheretheater",movieid);
		s.close();
		return list;
		
	}

}