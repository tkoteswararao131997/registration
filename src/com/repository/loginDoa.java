package com.repository;

import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
public class loginDoa {
	String sql = "select * from login where uname=? and password=?";
	String url = "jdbc:mysql://localhost:3306/users";
	String usname = "kevin";
	String pwd = "password";

	public boolean isuser(String uname, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, usname, pwd);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) 
			{
					return true;
			}
			}
			catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
}
