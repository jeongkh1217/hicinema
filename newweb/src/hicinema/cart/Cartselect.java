package hicinema.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Cartselect {
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
	public ArrayList<Cartgetset> cartselect(String id) throws Exception {				
				ArrayList<Cartgetset> arr = new ArrayList<Cartgetset>();				
				try{
					con();			
				ResultSet rs = stmt.executeQuery("select*from cart where id= '"+id+
													"' and purchased = 'n';");				
				while(rs.next()) {
					Cartgetset cart = new Cartgetset();					
					cart.setItemid(rs.getString("itemid"));
					cart.setId(rs.getString("id"));
					cart.setQuantity(rs.getInt("quantity"));					
					arr.add(cart);
				}				
			} finally {
				discon();
			}
			return arr;  
	}	
}