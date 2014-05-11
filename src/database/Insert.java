package database;

import java.sql.PreparedStatement;

import java.util.*;

public class Insert {
	database.DataBase db;
	
	

					public final boolean insert(String insertTable,Map<Integer, String> inputvalues){
						 int j = 0;
						 try {
							 Select se = new Select();
							 int insert_num= se.getTableColumnCount(insertTable);
							 db = new DataBase();
							 String x ="?";
							 for(int i=1; i<insert_num; i++){
								 
								 x= x.concat(",?");
							 }
							 String NOIV = x;
							 String query="insert into "+insertTable+" values("+NOIV+")";
								//System.out.println(query);
								PreparedStatement pst = db.getConnection().prepareStatement(query);
						
								for(int k=1; k<=insert_num;k++){
									pst.setString(k, inputvalues.get(k));
									//System.out.println(inputvalues.get(k));
								}
								j = pst.executeUpdate();
							pst.closeOnCompletion();
							return true;
						} catch (Exception e) {
							System.out.println(e.getMessage());
							return false;
						}
						
					}
					
					
					
					
					
					
}
