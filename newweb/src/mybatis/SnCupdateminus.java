package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.snc.vo.SnCgetset;

public class SnCupdateminus {
	static SnCupdateminus mo = new SnCupdateminus();
	public static SnCupdateminus instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void updateSnCminus(SnCgetset snc) {
		SqlSession s = f.openSession();
		s.update("minussnclike", snc);
		s.commit();
		s.close();
	}
}