package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Update {
DataBase db = new DataBase();
private final String verify="verify";
public boolean update(String fromtable,String value,Map<Integer,String> inputvalues,String searchcolumnname, String searchcolumnvalue){
	
	boolean x=false;
	if(verify.equals("verify")){
	x=updateprivate(fromtable,value,inputvalues,searchcolumnname, searchcolumnvalue);
	}
	return x;
}

private boolean updateprivate(String fromtable,String value,Map<Integer,String> inputvalues,String searchcolumnname, String searchcolumnvalue){

    int k=1;Select sa = new Select();int c=0;
	 String[] arrayvalue =null;
	try {
		arrayvalue = value.split("=?");
		if(arrayvalue.length>1){
			arrayvalue = value.split("=?,");
		}
		String sql1 = "UPDATE "+fromtable+" SET "+value+" where "+searchcolumnname+"=?";
		//System.out.println(sql1);
		PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
		for(int g=1;g<=arrayvalue.length;g++){
			
			pst1.setString(g, inputvalues.get(g));
			//System.out.println(inputvalues.get(g));
		}
		//System.out.println("::"+searchcolumnvalue);
		pst1.setString(arrayvalue.length+1, searchcolumnvalue);
		c = pst1.executeUpdate();
	  pst1.closeOnCompletion();
		return true;
	} catch (Exception e) {
		System.out.println(e.getMessage());
		return false;
	}

}

}
