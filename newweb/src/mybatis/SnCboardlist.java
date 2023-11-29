package mybatis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class SnCboardlist {
	static SnCboardlist mo = new SnCboardlist();
	public static SnCboardlist instan() {
		return mo;
	}
	SqlSessionFactory f = SqlCon.getSqlSession();

	public int getListCount(String movieid) throws Exception{
		SqlSession s = f.openSession();
		int listCount = s.selectOne("countsnc",movieid);
		return listCount;		
	}

	public List<Object> getArticleList(int page, String movieid) throws Exception{
		
		List<Object> articleList = null;
		SqlSession s = f.openSession();
		int startrow=(page-1)*10; 	
		RowBounds rowbounds = new RowBounds(0, 10);
		HashMap<String, Object> map = new HashMap<>();
		map.put("movieid", movieid);
		map.put("startrow", startrow);
		articleList = s.selectList("selectpage", map,rowbounds);
		s.close();
		return articleList;
		
	}

}
