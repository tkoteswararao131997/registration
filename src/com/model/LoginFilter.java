package com.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.repository.loginDoa;
@WebFilter("/resources/jsp/login")
public class LoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		loginDoa doa=new loginDoa();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pwd");
		if(doa.isuser(uname, pass)==true)
		{
			HttpSession session=req.getSession();
			session.setAttribute("username",uname);
			Cookie ck=new Cookie("user",uname);
			res.addCookie(ck);
			if(uname.equals("koti") && pass.equals("9084"))
			{
				req.setAttribute("check","yes");
				chain.doFilter(req, res);
			}
			else
			{
				req.setAttribute("check","no");
				chain.doFilter(req, res);
			}
		}
		else {
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
			
		}
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
