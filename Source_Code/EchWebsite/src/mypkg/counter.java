
package mypkg;
import java.sql.*;
public class counter {

	public static synchronized  int get_ctrvalue(String ctr_name) throws Exception 
	{	
		java.sql.Connection con=Connect.database();
		java.sql.Statement st=con.createStatement();
		String query="Select VALUE FROM Anurag.COUNTERS WHERE CTR_NAME='"+ctr_name+"'";
		java.sql.ResultSet rs=st.executeQuery(query);
		rs.next();
		return rs.getInt("VALUE");
		
	}
	
	public static synchronized void inc_ctrvalue(String ctr_name) throws Exception
	{
		int ctr_value=get_ctrvalue(ctr_name);
		ctr_value++;
		String query="UPDATE Anurag.COUNTERS SET VALUE="+ctr_value+" WHERE CTR_NAME='"+ctr_name+"'";
		Connection con=Connect.database();
		Statement st=con.createStatement();
		st.executeUpdate(query);
		
	}
	
	public static synchronized int getset_ctr(String ctr_name) throws Exception
	{
		int ctr_value=get_ctrvalue(ctr_name);
		inc_ctrvalue(ctr_name);
		return ctr_value;
		
	}
}
