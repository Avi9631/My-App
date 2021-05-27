package com.example.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/AddNotes")
public class AddNotes extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String noteName = req.getParameter("noteName");
		String noteCategory = req.getParameter("sub");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");	
		if(notesRegister(noteName, noteCategory, startDate, endDate, req)) {
			req.setAttribute("noteList", UserModel.noteList);
			RequestDispatcher rDispatcher =  req.getRequestDispatcher("/home.jsp");
			rDispatcher.forward(req, resp);
		}

	}
	
	
	public boolean notesRegister(String name, String category, String startDate, String endDate, HttpServletRequest req){
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "INSERT INTO remind.notes (name, category, startDate, endDate, noteBookID) VALUES (?, ?, ?, ?, ?);";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, category);
		stmt.setString(3, startDate);
		stmt.setString(4, endDate);
		stmt.setString(5, String.valueOf(getNoteBookID(category)));
		int rs=stmt.executeUpdate();
		if(rs>0) {
			return loadNotes(req);
		}else {
			return false;
		}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public int getNoteBookID(String category) {
		int id=-3;
		for(NotebookModel i: UserModel.noteBookListCopy) {
			if(i.getName().equals(category)) {
				id=i.getId();
			}
		}
		return id;
	}
	
	public static boolean loadNotes(HttpServletRequest req){
		if(UserModel.noteList.size()>0) {
			UserModel.noteList.clear();
		}
		HttpSession session=req.getSession();
		String userid= String.valueOf(session.getAttribute("Id"));
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "SELECT b.id, b.name, b.category, b.startDate, b.endDate FROM "
				+ "remind.notebooks a INNER JOIN remind.notes b ON b.notebookID=a.id AND a.userid=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, userid);
		ResultSet rs=stmt.executeQuery();
		while (rs.next()) {
			UserModel.noteList.add(new NotesModel(rs.getInt("id"), rs.getString("name"), rs.getString("category"),
					rs.getString("startDate"), rs.getString("endDate")));
		}
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
