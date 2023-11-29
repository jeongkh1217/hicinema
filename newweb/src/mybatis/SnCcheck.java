package mybatis;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SnCcheck {
	static SnCcheck mo = new SnCcheck();
	public static SnCcheck instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public int checksnc(String movieid, String id) {
		SqlSession s = f.openSession();
		HashMap<String,String> map = new HashMap<>();
		map.put("movieid",movieid);
		map.put("id",id);
		int count=s.selectOne("checksnc",map);
		s.close();	
		return count;		
	}
}