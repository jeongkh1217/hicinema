package mybatis;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class Leftseatselect {
	static Leftseatselect mo = new Leftseatselect();
	public static Leftseatselect instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public int selectleftseat(Map<String, String> map) {
		SqlSession s = f.openSession();
		int seat=s.selectOne("selectleftseat",map);
		s.close();
		return seat;		
	}
}