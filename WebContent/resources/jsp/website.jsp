<%@page import="com.repository.loginDoa"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>website page</title>
<link rel="stylesheet" type="text/css" href="../css/website.css">
</head>
<body>	
	<form action="Logout" method="post">
	<%
		response.setHeader("Cache-Control","no-store");
		if (session.getAttribute("username") == null) 
		{
			response.sendRedirect("login.jsp");
		}
	%> 
		<%
			String page1=request.getParameter("page");
			if(page1==null)
			page1="1";
			int pageno=Integer.parseInt(page1)-1;
			int k=0;
			if(pageno>0)
			{
				while(pageno>0)
				{
					k=k+2;
					pageno--;
				}
			}
			System.out.print(pageno+" "+k);
			loginDoa doa=new loginDoa();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "kevin", "password");
			PreparedStatement st = con.prepareStatement("select * from inventory limit ?,3");
			st.setInt(1,k);
			ResultSet rs = st.executeQuery();
			String name=(String)session.getAttribute("username");
			if(name.equals("koti"))
			{
			boolean b=rs.next();
			if(b==true)
			{
			%>
				<%
		Cookie[] ck = request.getCookies();
		out.println("welcome "+ck[0].getValue().toString());
				%>
				<table border="1">
				<tr class="heading">
				<th>name</th>
				<th>weight</th>
				<th>price</th>
				<th>quantity</th>
				</tr>
				<tr class="data" align="center">
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("weight")%></td>
				<td><%=rs.getString("price")%></td>
				<td><%=rs.getString("quantity")%></td>
				</tr>
			<%
			}
			else
			{
				out.println("there is no data to access");
			}
			while (rs.next()) 
			{
			%>
				<tr class="data" align="center">
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("weight")%></td>
				<td><%=rs.getString("price")%></td>
				<td><%=rs.getString("quantity")%></td>
				</tr>
			<%
			}
			}
			
			
			else
			{
				%>
				<table border="1">
				<tr class="heading">
				<th>name</th>
				<th>weight</th>
				<th>price</th>
				<th>quantity</th>
				</tr>
				<%
				for(int i=0;i<3;i++)
				{
					rs.next();
			%>
		<tr class="data" align="center">
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("weight")%></td>
			<td><%=rs.getString("price")%></td>
			<td><%=rs.getString("quantity")%></td>
		</tr>
		<%
			}
			}
			
		%>
		</table>
		<%
			if(name.equals("koti"))
			{
		%>
		<div align="center">
		<% 
		out.print("</br></br></br><a href='website.jsp?page=1'>1</a> ");  
        out.print("<a href='website.jsp?page=2'>2</a>  ");  
        out.print("<a href='website.jsp?page=3'>3</a> ");
        out.print("<a href='website.jsp?page=4'>4</a> "); 
        out.print("<a href='website.jsp?page=5'>5</a> "); 
        out.print("<a href='website.jsp?page=6'>6</a> "); 
		%>
		</div>
		<%
			}
		%>
		
		
	<div align="center">
		<input  id="logout" type="submit" value="Logout"></br>
	</div>



	</form>
</body>
</html>