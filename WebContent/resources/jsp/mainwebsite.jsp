<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import=java.sql.*; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Logout" method="post">
	<table border="1">
		<tr>
				<th>name</th>
				<th>weight</th>
				<th>price</th>
				<th>quantity</th>
		</tr>
	<%
	
		String page1=request.getParameter("page");
		if(page1==null)
		page1="1";
		int pageno=Integer.parseInt(page1);
		System.out.println("int"+pageno);
		String url="jdbc:mysql://localhost:3306/users";
		String name="kevin";
		String password="password";
		String query="select * from inventory limit ?,3";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,name,password);
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, pageno);
		ResultSet rs=st.executeQuery();
		while(rs.next())
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
		%>
		</table>
	<a href="pagination.jsp?page=1">1</a>
	<a href="pagination.jsp?page=2">2</a>
	<a href="pagination.jsp?page=3">3</a>
	</form>
</body>
</html>