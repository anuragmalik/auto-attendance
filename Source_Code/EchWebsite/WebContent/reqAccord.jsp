<%@page import="mypkg.Connect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
Connection con=Connect.database();
Statement st=con.createStatement();
String query="SELECT * FROM Anurag.REQUESTS WHERE Anurag.REQUESTS.TO='"+session.getAttribute("uid").toString()+"'";
ResultSet rs=st.executeQuery(query);
%>
<table class="accord" width="95%" align="center">
	<tr bgcolor="#c0c0c0">
		<th>Request Code
		</td>
		<th>Sender</th>
		<th>Details</th>
		<th>STATUS</th>
		<th colspan="3">Options</th>
	</tr>
	<%while(rs.next()){ %>
	<tr>
		<td class="rcode"><%=rs.getString("REQ_CODE")%></td>
		<td><%=rs.getString("FROM")%></td>
		<td><%=rs.getString("SUB")%></td>
		<td><%=rs.getString("STATUS")%></td>
		<td class="slider">View</td>
		<td class="acc">Accept</td>
		<td class="rej">Reject</td>
	</tr>
	<tr class="data">
		<td colspan="6"><p><%=rs.getString("MSG")%></p></td>
	</tr>
	<%} %>
</table>
