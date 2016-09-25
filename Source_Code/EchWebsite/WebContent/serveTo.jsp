<%@page language="java" import="java.sql.*"%>
<%  
 String name=request.getParameter("name");  
 String buffer="<table width='100%'>";   
javax.naming.InitialContext ctx= new javax.naming.InitialContext();
javax.sql.DataSource ds =(javax.sql.DataSource)ctx.lookup("java:comp/env/jdbc/MyDataSource");
java.sql.Connection con = ds.getConnection(); //Assume pool name as jdbc/mydbpool
java.sql.Statement st = con.createStatement();
String q="(select NAME,SUID as UID from Anurag.STUDENT where (Anurag.STUDENT.name like '%"+name+"%')) UNION ( select NAME,UID from Anurag.PROF_ADMIN where (Anurag.PROF_ADMIN.name like '%"+name+"%'))";
java.sql.ResultSet rs = st.executeQuery(q);
int x=0;
String color;
 while(rs.next()){
	 if(x==0)
	 {color="e0eeee";
	 x=1;}
	 else
	 {color="c1ffc1";
	 x=0;}
   buffer=buffer+"<tr><td class='msg' bgcolor='#"+color+"' name='"+rs.getString("NAME")+"' id='"+rs.getString("UID")+"'><div style='width:100%' align='center'>"+rs.getString("NAME")+"("+rs.getString("UID")+")</div></td></tr>";  
   }  
 buffer=buffer+"</table>";  
 response.getWriter().println(buffer);  
%>