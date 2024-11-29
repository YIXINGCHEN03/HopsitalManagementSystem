package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;

@WebServlet("/delDoc")
public class deleteDoc extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDAO drDao = new DoctorDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
	
		if(drDao.deleteDoc(id)) {
			session.setAttribute("succMsg", "Doctor Already Deleted");
		}else {
			session.setAttribute("errMsg", "Something Wrong On Server");
		}
		resp.sendRedirect("admin/view_doctor.jsp");
	}
	
}
