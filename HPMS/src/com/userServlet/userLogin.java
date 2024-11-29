package com.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.dao.UserDAO;
import com.db.DBConnect;

@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                session.setAttribute("adminObj", new User()); 
                resp.sendRedirect("admin/index.jsp"); 
            } else {
                // Regular user login
                UserDAO dao = new UserDAO(DBConnect.getConn());
                User user = dao.login(email, password);
                
                if (user != null) {
                    session.setAttribute("userObj", user);
                    session.setAttribute("userEmail", user.getEmail());
                    session.setAttribute("userPass", user.getPassword());
                    resp.sendRedirect("index.jsp");       
                } else {
                    session.setAttribute("errMsg", "Invalid email & password");
                    resp.sendRedirect("login.jsp");   
                }
            }
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
