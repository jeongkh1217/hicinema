package hicinema.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import hicinema.member.vo.Membergetset;

public class Indexmembergenre {
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
	public ArrayList<Membergetset> membergenre(String id) throws Exception {				
				ArrayList<Membergetset> arr = new ArrayList<Membergetset>();				
				try{
					con();
				ResultSet rs = stmt.executeQuery("select genre1, genre2 from "
												 + "member where id='"+id+"';");
				
				while(rs.next()) {
					Membergetset table = new Membergetset();
					
					table.setGenre1(rs.getString("genre1"));
					table.setGenre2(rs.getString("genre2"));
					
					arr.add(table);
				}				
			} finally {
				discon();
			}
				return arr;  
	}		
}	
