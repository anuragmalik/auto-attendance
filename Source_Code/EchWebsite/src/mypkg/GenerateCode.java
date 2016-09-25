package mypkg;

public class GenerateCode {

	static String Code;
	static int ctr_value;
	public static synchronized String Request() throws Exception
	{
		ctr_value=counter.getset_ctr("Req");
		Code="Req-"+ctr_value;
		return Code;
		
	}
	public static synchronized String Notify() throws Exception
	{
		ctr_value=counter.getset_ctr("Not");
		Code="Not-"+ctr_value;
		return Code;
		
	}
	
	public static synchronized String Test() throws Exception
	{
		ctr_value=counter.getset_ctr("Test");
		Code="Test-"+ctr_value;
		return Code;
		
	}
}
