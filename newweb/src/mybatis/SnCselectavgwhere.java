package mybatis;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class SnCselectavgwhere {
	static SnCselectavgwhere mo = new SnCselectavgwhere();
	public static SnCselectavgwhere instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public double selectavgwheresnc(String movieid) {
		SqlSession s = f.openSession();
		double avg=s.selectOne("selectsncaverage",movieid);
		s.close();
		return avg;
		
	}

}