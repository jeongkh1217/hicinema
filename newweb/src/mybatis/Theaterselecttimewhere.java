package mybatis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.theater.vo.Theatergetset;

public class Theaterselecttimewhere {
	static Theaterselecttimewhere mo = new Theaterselecttimewhere();
	public static Theaterselecttimewhere instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<Theatergetset> selecttimetheater(HashMap<String, Object> map) {
		SqlSession s = f.openSession();
		List<Theatergetset> list=s.selectList("selecttimewheretheater",map);
		s.close();
		return list;
		
	}

}