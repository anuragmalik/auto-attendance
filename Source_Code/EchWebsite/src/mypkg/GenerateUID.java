package mypkg;

import java.util.Calendar;
import java.util.Date;

public class GenerateUID {

	static String UID;
	static int ctr_value;
	
	public static synchronized String Student(String Trade)throws Exception
	{
		int year = Calendar.getInstance().get(Calendar.YEAR);	
		
		ctr_value=counter.getset_ctr(Trade);
		String years=Integer.toString(year);
		UID="S"+years.charAt(2)+years.charAt(3)+"-"+Trade+"-"+ctr_value;
		return UID;
		}
	public static synchronized String Professor() throws Exception
	{
		ctr_value=counter.getset_ctr("P");
		UID="P-"+ctr_value;
		return UID;
		
	}
	public static synchronized String Teacher() throws Exception
	{
		ctr_value=counter.getset_ctr("T");
		UID="T-"+ctr_value;
		return UID;
		
	}
	public static synchronized String Admin() throws Exception
	{
		ctr_value=counter.getset_ctr("A");
		UID="A-"+ctr_value;
		return UID;
		
	}
}
