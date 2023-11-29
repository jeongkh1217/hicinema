package mybatis;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SnCLikecheckID {
	static SnCLikecheckID mo = new SnCLikecheckID();
	public static SnCLikecheckID instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public int checksnclikeid(int sncno, String id) {
		SqlSession s = f.openSession();
		HashMap<String,Object> map = new HashMap<>();
		map.put("sncno",sncno);		
		map.put("id",id);
		int count=s.selectOne("checksnclike",map);
		s.close();	
		return count;	
		
	}
}