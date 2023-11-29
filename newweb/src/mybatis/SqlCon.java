package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlCon {
	private static SqlSessionFactory sqlSession;
	
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}

	static{
		try {
			String resource = "mybatis/Dbcon.xml";  
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}