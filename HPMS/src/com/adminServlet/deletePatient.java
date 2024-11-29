package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.db.DBConnect;

@WebServlet("/delPatient")
public class deletePatient extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		PatientDAO patDAO = new PatientDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(patDAO.deletePatient(id)) {
			session.setAttribute("suuccMsg", "Patient Already Deleted");
		} else {
			session.setAttribute("errMsg", "Something Wrong On Server");
		}
		
		resp.sendRedirect("admin/view_patient.jsp");
	}
	
}
