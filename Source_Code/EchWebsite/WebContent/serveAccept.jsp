<%@page import="mypkg.Connect"%>
<%@page language="java" import="java.sql.*"%>
<%  
 String req=request.getParameter("rcode");
 Connection con=Connect.database();
 Statement st=con.createStatement();
 String query="UPDATE Anurag.REQUESTS SET STATUS='Accepted' WHERE REQ_CODE='"+req+"'";
 st.executeUpdate(query);
 response.getWriter().println("Success in accepting" + req);  
 
%>