package mybatis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.snc.vo.SnCgetset;

public class SnCselect {
	static SnCselect mo = new SnCselect();
	public static SnCselect instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public List<SnCgetset> selectsnc(HashMap<String, Object> map) {
		SqlSession s = f.openSession();
		List<SnCgetset> list=s.selectList("selectsnc",map);
		s.close();
		return list;		
	}
}