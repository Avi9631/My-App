package com.example.model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/SearchViewNotes")
public class SearchViewNotes extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String viewNoteName="";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		viewNoteName=req.getParameter("searchName");
		String subString=req.getParameter("sub");
		req.setAttribute("sub", "subString");
		RequestDispatcher rd=req.getRequestDispatcher("/viewnotes.jsp");
		rd.forward(req, resp);
	}

}
