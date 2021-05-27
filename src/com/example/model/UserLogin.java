package com.example.model;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(value = "/UserLogin")
public class UserLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uEmail = req.getParameter("Email");
		String uPass = req.getParameter("Password");
		if(loginUser(uPass, uEmail, req)) {
			RequestDispatcher rDispatcher =  req.getRequestDispatcher("/home.jsp");
			rDispatcher.forward(req, resp);
		}else {
			PrintWriter out= resp.getWriter();
			req.setAttribute("msg","Invalid Login"); 
            out.println("alert(\"" +"Invalid Login"+ "\")");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
            dispatcher.forward( req, resp );
		}
	}
	
	public boolean loginUser(String uPass, String uEmail, HttpServletRequest req){
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "SELECT * FROM remind.new_table WHERE email=? AND password=?";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, uEmail);
		stmt.setString(2, uPass);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
			HttpSession session=req.getSession();
				int id=rs.getInt("id");
				String email= rs.getString("email");
				String name= rs.getString("name");
				String mobile= rs.getString("mobile");
				session.setAttribute("Id", id);
				session.setAttribute("Email", email);
		        session.setAttribute("Name", name);
		        session.setAttribute("Mobile", mobile);
				AddNotebook.loadNotebooks(String.valueOf(id));
				AddNotes.loadNotes(req);
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
