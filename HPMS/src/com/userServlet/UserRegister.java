package com.userServlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			 String fullName = req.getParameter("fullname");
			 String email = req.getParameter("email");
			 String password = req.getParameter("password");
			 
			 User u = new User(fullName, email, password);
			 UserDAO dao = new UserDAO(DBConnect.getConn());
			 
			 HttpSession session = req.getSession();
			 boolean f = dao.UserRegister(u);
			
			 if(f) {
				 session.setAttribute("succMsg","Register Successfully");
				 resp.sendRedirect("signup.jsp");
			 } else {
				 session.setAttribute("errMsg","Something Wrong On Server");
				 resp.sendRedirect("signup,jsp");
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
 
