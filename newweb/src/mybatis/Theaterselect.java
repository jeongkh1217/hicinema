package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.theater.vo.*;

public class Theaterselect {
	static Theaterselect mo = new Theaterselect();
	public static Theaterselect instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<Theatergetset> selecttheater() {
		SqlSession s = f.openSession();
		List<Theatergetset> list=s.selectList("selecttheater");
		s.close();
		return list;		
	}
}