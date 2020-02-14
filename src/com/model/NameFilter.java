package com.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("/resources/jsp/signup")
public class NameFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		PrintWriter out=res.getWriter();
		String fullname=req.getParameter("fullname");
		if(fullname.length()>3 && fullname.matches("^[a-zA-Z]*$"))
		{
			chain.doFilter(request, response);
		}
		else
		{
			out.println("name must above 3 characters and not with integers(0-9)");
		}
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	@Override
	public void destroy() {
		
	}
}
