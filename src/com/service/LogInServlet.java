package com.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.repository.*;

@WebServlet("/resources/jsp/login")
public class LogInServlet extends HttpServlet {
	loginDoa doa = new loginDoa();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			String check=(String) request.getAttribute("check");
			if(check.equals("yes"))
			{
				request.setAttribute("check2","yes");
			}
			if(check.equals("no"))
			{
				request.setAttribute("check2","no");
			}
			RequestDispatcher req=request.getRequestDispatcher("website.jsp");
			req.forward(request,response);
	}

}
