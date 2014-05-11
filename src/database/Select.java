package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



public class Select {
	DataBase db = new DataBase();
	private final String verify="verify";
	public final HashMap<Integer, String> selectwhere(String fromtable, String wherecoloumn, String wherecoloumnvalue){
		HashMap<Integer, String> inputfileds=null;
		if(verify.equals("verify")){
			inputfileds = selectwhereprivate(fromtable, wherecoloumn, wherecoloumnvalue);
		}
		return inputfileds;
	}
	
	public final JSONObject selectListing(String fromtable, String wherecoloumn, String wherecoloumnvalue){
		JSONObject jsonA=null;
		if(verify.equals("verify")){
			//System.out.println("1");
			jsonA = selectListingPrivate(fromtable, wherecoloumn, wherecoloumnvalue);
		}
		return jsonA;
	}
	public final ResultSet selectAll(String fromvalue){
		 ResultSet j = null;
		try {
			String sql1 = "SELECT * FROM "+fromvalue+"";
			PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
			  j = pst1.executeQuery();
			  pst1.closeOnCompletion();
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return j;
		
	}
		private final HashMap<Integer, String> selectwhereprivate(String fromtable, String wherecoloumn, String wherecoloumnvalue){
					 ResultSet j = null;
					 HashMap<Integer, String> listingvalues = new HashMap<Integer, String>();int k=1;
					 Select sa = new Select();
					 int x=sa.getTableColumnCount(fromtable);
					try {
						String sql1 = "SELECT * FROM "+fromtable+" WHERE "+wherecoloumn+"= ? ";
						//System.out.println(sql1);
						PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
						pst1.setString( 1, wherecoloumnvalue);
						  j = pst1.executeQuery();
						  while (j.next()) {
							 
							  for(int g=1;g<=x;g++)
							  { 
								  
								  listingvalues.put(g, j.getString(g));
								 
							  }
							 
						}
						  pst1.closeOnCompletion();
						
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					return listingvalues;
					
				}
		private final JSONObject selectListingPrivate(String fromtable, String wherecoloumn, String wherecoloumnvalue){
			 ResultSet j = null;JSONObject jobj = new JSONObject();
			int k=1,f=0;
			 Select sa = new Select();
			 int x=sa.getTableColumnCount(fromtable);
			try {
				String sql1 = "SELECT * FROM "+fromtable+" WHERE "+wherecoloumn+"= ? ";
				//System.out.println(wherecoloumnvalue+"::::"+sql1);
				PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
				pst1.setString( 1, wherecoloumnvalue);
				  j = pst1.executeQuery();
				  while (j.next()) {
					  HashMap<Integer, String> listingvalues = new HashMap<Integer, String>(); 
					  for(int g=1;g<=x;g++)
					  { 
						  
						  listingvalues.put(g, j.getString(g));
						
					  }
				jobj.put(f, listingvalues);f++;
				listingvalues=null;
					
				}
				  pst1.closeOnCompletion();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return jobj;
			
		}
		
		public final String getTableId(String fromtable,String prifixId){
			 ResultSet j = null; String value=null;
			try {
				String sql1 = "SELECT AUTO_INCREMENT as ai FROM information_schema.TABLES WHERE TABLE_SCHEMA ='deshoppa' AND TABLE_NAME ='"+fromtable+"' ";
				PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
				//System.out.println(sql1); 
				j = pst1.executeQuery();
				while(j.next()){
					  value= prifixId+j.getString("ai");
				}
			  pst1.closeOnCompletion();
			
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return value;
			
		}
		public final int getTableColumnCount(String fromtable){
			 ResultSet j = null; int value=0;
			try {
				String sql1 = "SELECT COUNT( * ) as count FROM information_schema.columns WHERE table_schema =  'deshoppa' AND table_name =  '"+fromtable+"'";
				PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
				
				j = pst1.executeQuery();
				while(j.next()){
					  value= j.getInt("count");
				}
			  pst1.closeOnCompletion();
			
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return value;
			
		}
		public final String getColoumnNamesFromTable(String fromtable){
			String value="";
			ResultSet j = null; 
			
			int k=1;
			try {
				String sql1 = "SELECT `COLUMN_NAME` as coulumnname FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='deshoppa' AND `TABLE_NAME`='"+fromtable+"'";
				PreparedStatement pst1 = db.getConnection().prepareStatement(sql1);
				//System.out.println(sql1); 
				j = pst1.executeQuery();
				while(j.next()){
					if(k!=1 && k!=2){
					if(j.isLast()){
						value = value+j.getString("coulumnname")+"=?";
						
						}else{
							value = value+j.getString("coulumnname")+"=?,";
						
						}
					}else{
					
					}
					
					k++;
					
				}
			  pst1.closeOnCompletion();
			
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println(value);
			return value;
		}
	
}
