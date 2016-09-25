
package mypkg;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//import org.myorg.SystemUnavailableException;
import sun.misc.BASE64Encoder;
import sun.misc.CharacterEncoder;
import java.sql.*;
public class Password 

{

	 public static synchronized String encrypt(String plaintext) throws Exception
	  {
		 String text=plaintext+Password.getsalt(plaintext);
	    MessageDigest md = null;
	    try
	    {
	      md = MessageDigest.getInstance("SHA"); //step 2
	    }
	    catch(NoSuchAlgorithmException e)
	    {
	      throw new Exception(e.getMessage());
	    }
	    try
	    {
	      md.update(text.getBytes("UTF-8")); //step 3
	    }
	    catch(UnsupportedEncodingException e)
	    {
	      throw new Exception(e.getMessage());
	    }
	 
	    byte raw[] = md.digest(); //step 4
	    String hash = (new BASE64Encoder()).encode(raw); //step 5
	    return hash; //step 6
	  }
	 
	 public static synchronized String getsalt(String password) throws SQLException
	 {
		 Connection con=Connect.database();
		 Statement st=con.createStatement();
		 String q="SELECT VALUE from Anurag.SALT where NAME='SALT1'";
		 ResultSet rt=st.executeQuery(q);
		 rt.next();
		 String salt=rt.getString("VALUE").trim();
		 int len=password.length();
		 salt=salt+password.charAt(0)+password.charAt(len-1);
		 return salt;
	 }
	 
}
