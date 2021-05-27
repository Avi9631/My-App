package com.example.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchNotebook")
public class SearchNotebook extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String name="";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		name=req.getParameter("search");
		resp.sendRedirect("home.jsp");
	}
	
	

}
