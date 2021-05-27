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

@WebServlet(value = "/DeleteNoteBook")
public class DeleteNoteBook extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type=req.getParameter("type");
		String id=String.valueOf(req.getParameter("id"));
		HttpSession session=req.getSession();
		System.out.println(id+" "+type );
		if(type.equals("notebook")) {
			if(DeleteNoteBook(id)) {
				UserModel.noteBookListCopy.clear();
				UserModel.noteList.clear();
				AddNotebook.loadNotebooks(String.valueOf(session.getAttribute("Id")));
				AddNotes.loadNotes(req);
				RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
				rd.forward(req, resp);
			}
		}else if(type.equals("notes")){
			if(DeleteNotes(id)){
				UserModel.noteBookListCopy.clear();
				UserModel.noteList.clear();
				AddNotebook.loadNotebooks(String.valueOf(session.getAttribute("Id")));
				AddNotes.loadNotes(req);
				RequestDispatcher rd=req.getRequestDispatcher("/notes.jsp");
				rd.forward(req, resp);
			}
		}else {
			if(DeleteNotes(id)){
				UserModel.noteBookListCopy.clear();
				UserModel.noteList.clear();
				AddNotebook.loadNotebooks(String.valueOf(session.getAttribute("Id")));
				AddNotes.loadNotes(req);
				RequestDispatcher rd=req.getRequestDispatcher("/viewnotes.jsp");
				rd.forward(req, resp);
			}
		}
	}

	private boolean DeleteNotes(String id) {
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "DELETE FROM remind.notes WHERE id=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, id);
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

	private boolean DeleteNoteBook(String id) {
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "DELETE FROM remind.notebooks WHERE id=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, id);
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
