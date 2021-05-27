package com.example.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/ViewNote")
public class ViewNote extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static List<NotesModel> noteSubList=new ArrayList<>();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		req.getRequestDispatcher("/notes.jsp").forward(req, resp);
	}

}
