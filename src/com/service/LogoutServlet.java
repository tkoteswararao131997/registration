package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/resources/jsp/Logout")
public class LogoutServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		HttpSession session=request.getSession();
		//System.out.print(session.getAttribute("username"));
		session.removeAttribute("username");
		//System.out.print(session.getAttribute("username"));
		session.invalidate();
		response.sendRedirect("login.jsp");
	}

}
