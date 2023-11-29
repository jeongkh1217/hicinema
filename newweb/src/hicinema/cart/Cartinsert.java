package hicinema.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Cartinsert {
	Connection conn = null; 
	Statement stmt = null;

	public void cartinsert(String id,String itemid, int quantity) throws Exception {
							
	try{
	   Class.forName("com.mysql.jdbc.Driver"); /*데이테베이스에 연결*/	   
	   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pf_jkh","root","1234");
	   
	   while(conn== null)
	      throw new Exception("데이터베이스에 연결할 수 없습니다.");
	   stmt=conn.createStatement(); 
	   
	   String command = "insert into cart (id, itemid, quantity) values ("+id+","+itemid+","+quantity+");";					  
	   
			 int rowNum = stmt.executeUpdate(command); 
			 
			 if(rowNum < 1) 
			 throw new Exception("데이터를 DB에 입력할 수 없습니다.");			 
			 
	} finally {
	   try {
	      stmt.close();
	   } catch (Exception ignored) {
	      
	   } try {
	      conn.close();
	   } catch (Exception ignored){
	      
	   } }
	}}