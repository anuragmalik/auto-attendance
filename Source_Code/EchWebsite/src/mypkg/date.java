package mypkg;

import java.util.Calendar;

public class date {

	public static String now()
	{
		int year = Calendar.getInstance().get(Calendar.YEAR);	
		int month = Calendar.getInstance().get(Calendar.MONTH);	
		int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
		String str=year+"-"+month+"-"+day;
		return str;
	}
}
