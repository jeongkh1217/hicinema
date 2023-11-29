package hicinema.store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Indexstoretotalsales {
	Connection conn = null; 
	Statement stmt = null;
	
	public void con() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
		stmt = conn.createStatement();
	}	
	public void discon() {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {			
		}		
	}	
	public ArrayList<Storegetset> indexstore() throws Exception {				
				ArrayList<Storegetset> arr = new ArrayList<Storegetset>();				
				try{
					con();			
				ResultSet rs = stmt.executeQuery("select*from store order by totalsales desc;");
				
				while(rs.next()) {
					Storegetset table = new Storegetset();
					
					table.setItemid(rs.getString("itemid"));
					table.setItemname(rs.getString("itemname"));
					table.setPrice(rs.getInt("price"));
					table.setComposition(rs.getString("composition"));
					table.setOrigin(rs.getString("origin"));
					table.setIntroduce(rs.getString("introduce"));
					table.setCategory(rs.getString("category"));
					table.setTotalsales(rs.getInt("totalsales"));
					arr.add(table);
				}				
			} finally {
				discon();
			}
				return arr;  
	}	
}