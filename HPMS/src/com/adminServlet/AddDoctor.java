package com.adminServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Stack;

import com.entity.Doctor;
import com.dao.DoctorDAO;
import com.db.DBConnect;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	
	Stack<Doctor> doctorStack = new Stack<Doctor>();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String quali = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String em = req.getParameter("email");
			String mobNo = req.getParameter("mobno");
			
			
			Doctor doc = new Doctor(fullName, dob, quali, spec, em, mobNo);
			doctorStack.push(doc);
			
			if(!doctorStack.isEmpty()) {
				Doctor docSave = doctorStack.pop();
				
				DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
				HttpSession session = req.getSession();
				
				if(dao.addDoctor(docSave)) {
					session.setAttribute("succMsg","Doctor Added Successfully");
				} else {
					session.setAttribute("errMsg","Something Wrong On Server");
				}
				
				resp.sendRedirect("admin/doctors.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
