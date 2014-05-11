package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import database.DataBase;
import database.Select;

public class LoginService {
	private final String verify="verify";
	
	public final ResultSet getLoginDetail(String fromtable, String contactnum, String password){
		
		 ResultSet j = null;
		if(verify.equals("verify")){
			j  = getLoginDetails(fromtable, contactnum, password);
		}
		return j ;
	}
	
	private final ResultSet getLoginDetails(String fromvalue, String contactnum, String password){
		 ResultSet j = null;
		 DataBase db = new DataBase();
		try {
			String sql1 = "SELECT * FROM "+fromvalue+" where contact1=? and password=?";
			//System.out.println(sql1+":::::"+contactnum+":::"+password);
			PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
			pst1.setString(1, contactnum);
			pst1.setString(2, password);
			  j = pst1.executeQuery();
			  pst1.closeOnCompletion();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return j;
		
	}
}
