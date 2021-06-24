<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
Connection con = main.Student.connectToDb();
%>
<!DOCTYPE html>
<html>
<body>

<h1>STUDENT MARK SHEET</h1>
<table border="1" >
<tr>
<td>Student Id</td>
<td>Student Name</td>
<td>Marks</td>

</tr>
<%
try{

String sql ="select * from public.student order by studentid asc";
String avg = "select avg(marks) as average from public.student";
PreparedStatement pst = con.prepareStatement(sql);
PreparedStatement pstavg = con.prepareStatement(avg);
ResultSet rs = pst.executeQuery();
ResultSet rsavg = pstavg.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString("studentid") %></td>
<td><%=rs.getString("studentname") %></td>
<td><%=rs.getString("marks") %></td>
</tr>
<%
}
while(rsavg.next()){
	%>
	<tr>
	<td>Average</td>
	<td></td>
	<td><%=rsavg.getInt("average") %></td>
	</tr>
	<% 
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>