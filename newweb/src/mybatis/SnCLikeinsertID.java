package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import hicinema.snclike.vo.SnCLikegetset;

public class SnCLikeinsertID {
	static SnCLikeinsertID mo = new SnCLikeinsertID();
	public static SnCLikeinsertID instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void insertsnclikeid(SnCLikegetset sc) {
		SqlSession s = f.openSession();
		s.insert("insertsnclike",sc);
		s.commit();
		s.close();
	}
}