package com.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userLogout")
public class userLogout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("userObj") != null) {
            session.removeAttribute("userObj");
            session.setAttribute("succMsg", "User logged out successfully");
            resp.sendRedirect("login.jsp");
        } else if (session.getAttribute("adminObj") != null) {
            session.removeAttribute("adminObj");
            session.setAttribute("succMsg", "Admin logged out successfully");
            resp.sendRedirect("login.jsp");
        } else {
            resp.sendRedirect("index.jsp");
        }
		
	}
	
}
