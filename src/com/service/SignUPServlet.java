package com.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resources/jsp/signup")
public class SignUPServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String mobilenumber = request.getParameter("mno");
		if (uname != null && password != null && email != null && mobilenumber != null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "kevin", "password");

				PreparedStatement st = con.prepareStatement("insert into login values(?,?,?,?)");
				st.setString(1, uname);
				st.setString(2, password);
				st.setString(3, email);
				st.setString(4, mobilenumber);
				st.executeUpdate();
				st.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("welcome.jsp");

	}
}