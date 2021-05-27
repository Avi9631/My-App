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

@WebServlet(value = "/UserRegister")
public class UserRegister extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uName = req.getParameter("username");
		String uMob = req.getParameter("mobile");
		String uEmail = req.getParameter("Email");
		String uPass = req.getParameter("Password");
		boolean cond=registerUser(uName, uPass, uEmail, uMob);
		if(cond) {
			RequestDispatcher rDispatcher =  req.getRequestDispatcher("/index.jsp");
			rDispatcher.include(req, resp);
		}
	}
	
	public boolean registerUser(String uName, String uPass, String uEmail, String uMob){
		Connection connection=null;
		PreparedStatement stmt=null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/remind", "root", "password");
		String sql= "INSERT INTO remind.new_table (name, email, password, mobile) VALUES (?,?,?,?);";
		stmt= connection.prepareStatement(sql);
		stmt.setString(1, uName);
		stmt.setString(2, uEmail);
		stmt.setString(3, uPass);
		stmt.setString(4, uMob);
		int rs=stmt.executeUpdate();
		System.out.println("123");
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
