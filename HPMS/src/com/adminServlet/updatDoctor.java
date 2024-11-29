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
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class updatDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String quali = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String em = req.getParameter("email");
			String mobNo = req.getParameter("mobno");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			
			Doctor updateDoc = new Doctor(id,fullName, dob, quali, spec, em, mobNo);
			
				
				DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
				HttpSession session = req.getSession();
				
				if(dao.updateDoctor(updateDoc)) {
					session.setAttribute("succMsg","Doctor Updated Successfully");
				} else {
					session.setAttribute("errMsg","Something Wrong On Server");
				}
				
				resp.sendRedirect("admin/view_doctor.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
