<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="pagination.jsp?page=1">1</a>
	<a href="pagination.jsp?page=2">2</a>
	<a href="pagination.jsp?page=3">3</a>
	<table border="1">
		<tr>
		<th>name</th>
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
		String query="select * from login limit ?,10";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,name,password);
		PreparedStatement st=con.prepareStatement(query);
		st.setInt(1, pageno);
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
		%>
			<tr>
			<td><%=rs.getString("uname")%></td>
			</tr>
		<% 
		}
		%>
	</table>
</body>
</html>