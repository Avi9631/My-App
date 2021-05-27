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

@WebServlet(value = "/AddNotebook")
public class AddNotebook extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String notebook = req.getParameter("notebookName");
		String useridString=req.getParameter("userid");
		if(notebookRegister(notebook,useridString, req)) {
			RequestDispatcher rDispatcher =  req.getRequestDispatcher("/home.jsp");
			req.setAttribute("noteBook", UserModel.noteBookListCopy);
			rDispatcher.forward(req, resp);
		}else {
			
		}
		
	}
	
	public boolean notebookRegister(String name, String userid, HttpServletRequest req){

		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "INSERT INTO remind.notebooks (name, userid) VALUES (?, ?);";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, userid);
		int rs=stmt.executeUpdate();
		if(rs>0) {
			return loadNotebooks(userid);
		}else {
			return false;
		}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean loadNotebooks(String userid){
		if(UserModel.noteBookListCopy.size()>0) {
			UserModel.noteBookListCopy.clear();
		}
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "SELECT * FROM remind.notebooks WHERE userid=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, userid);
		ResultSet rs=stmt.executeQuery();
		while (rs.next()) {
			UserModel.noteBookListCopy.add(new NotebookModel(rs.getInt("id"), rs.getString("name")));
		}
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
