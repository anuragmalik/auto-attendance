package mypkg;

import java.sql.Connection;
public class Connect {
	static java.sql.Connection con;
	public static Connection database()
	{
		
		try {
			javax.naming.InitialContext ctx= new javax.naming.InitialContext();
		

	javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
	con = ds.getConnection(); 
	 
	 }
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
		

}
}
