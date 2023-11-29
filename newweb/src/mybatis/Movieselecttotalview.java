package mybatis;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class Movieselecttotalview {
	static Movieselecttotalview mo = new Movieselecttotalview();
	public static Movieselecttotalview instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public int selecttotalviewmovie() {
		SqlSession s = f.openSession();
		int totalview=s.selectOne("selecttotalviewmovie");
		s.close();
		return totalview;		
	}
}