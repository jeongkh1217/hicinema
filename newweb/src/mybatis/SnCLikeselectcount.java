package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SnCLikeselectcount {
	static SnCLikeselectcount mo = new SnCLikeselectcount();
	public static SnCLikeselectcount instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public int selectcountSnCLike(int sncno) {
		SqlSession s = f.openSession();
		int forselectsncno=sncno;
		int count=s.selectOne("totalcountsnclike",forselectsncno);
		s.close();	
		return count;	
		
	}
}