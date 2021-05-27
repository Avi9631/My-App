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

@WebServlet(value = "/EditUser")
public class EditUser extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String uName = req.getParameter("userName");
		String uMob = req.getParameter("mobileNo");
		String uEmail = (String) session.getAttribute("Email");
		System.out.println(uEmail);
		String uPass = req.getParameter("password");
		if(editUserDB(uName,uMob,uEmail, uPass, req)) {
			RequestDispatcher rDispatcher =  req.getRequestDispatcher("/home.jsp");
			rDispatcher.include(req, resp);
		}		
	}
	
	public boolean editUserDB(String uName, String uMob, String uEmail, String uPass, HttpServletRequest req){
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "UPDATE remind.new_table SET name = ?, password=?, mobile=?  WHERE email=?;";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, uName);
		stmt.setString(2, uPass);
		stmt.setString(3, uMob);
		stmt.setString(4, uEmail);
		int rs=stmt.executeUpdate();
		if(rs>0) {
			HttpSession session=req.getSession();
				session.setAttribute("Email", uEmail);
		        session.setAttribute("Name", uName);
		        session.setAttribute("Mobile", uMob);
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
