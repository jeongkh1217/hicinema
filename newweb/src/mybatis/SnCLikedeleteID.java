package mybatis;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SnCLikedeleteID {
	static SnCLikedeleteID mo = new SnCLikedeleteID();
	public static SnCLikedeleteID instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public void deletesnclikeid(int sncno, String id) {
		SqlSession s = f.openSession();
		HashMap<String,Object> map = new HashMap<>();
		map.put("sncno",sncno);
		map.put("id",id);
		s.delete("deletesnclike",map);
		s.commit();
		s.close();	
		return;		
	}
}