package com.example.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/EditNotebook")
public class EditNotebook extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type=req.getParameter("newType");
		String id=String.valueOf(req.getParameter("newId"));
		String name=String.valueOf(req.getParameter("newName"));
		HttpSession session=req.getSession();
		System.out.println(id+" "+type );
		if(type.equals("notebook")) {
			if(EditNotebook(id,name)) {
				UserModel.noteBookListCopy.clear();
				UserModel.noteList.clear();
				AddNotebook.loadNotebooks(String.valueOf(session.getAttribute("Id")));
				AddNotes.loadNotes(req);
				RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
				rd.forward(req, resp);
			}
		}
	}
	
	private boolean EditNotebook(String id, String name) {
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "UPDATE remind.notebooks SET name=? WHERE id=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, id);
		int rs=stmt.executeUpdate();
		if(rs>0) {
			return true;
		}else {
			return false;
		}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
