package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.snc.vo.SnCgetset;

public class SnCupdateplus {
	static SnCupdateplus mo = new SnCupdateplus();
	public static SnCupdateplus instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void updateSnCplus(SnCgetset snc) {
		SqlSession s = f.openSession();
		s.update("plussnclike", snc);
		s.commit();
		s.close();
	}
}