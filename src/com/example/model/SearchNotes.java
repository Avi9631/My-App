package com.example.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value="/SearchNotes")
public class SearchNotes extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String noteName="";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		noteName=req.getParameter("searchNotes");
		resp.sendRedirect("notes.jsp");
	}

}
