package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Delete {
	DataBase db = new DataBase();
	public final ResultSet deleteAll(String fromtable){
		 ResultSet j = null;
		try {
			String sql1 = "DELETE * FROM "+fromtable+"";
			PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
			  j = pst1.executeQuery();
			  pst1.closeOnCompletion();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return j;
		
	}
	
	public final int deletewhere(String fromtable, String wherevalue, String deletevalue){
		 int j = 0;
		try {
		
			String sql1 = "DELETE FROM "+fromtable+" WHERE "+wherevalue+"= ? ";
			
			PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
			pst1.setString(1, deletevalue);
		
			  j = pst1.executeUpdate();
		
			  pst1.closeOnCompletion();
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return j;
		
	}
}
