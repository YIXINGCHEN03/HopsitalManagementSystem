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
import com.entity.Patient;

@WebServlet("/UpdatePatient")
public class updatPatient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("name");
			String dob = req.getParameter("dob");
			String blood = req.getParameter("blood");
			String gender = req.getParameter("gender");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			int did = Integer.parseInt(req.getParameter("doctor"));
			String treatment = req.getParameter("treatment");
			String medicalHis = req.getParameter("medicalHistory");
			String allergies = req.getParameter("allergies");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Patient upP = new Patient(id, fullName, dob, blood, gender,phone,email, address, did, treatment, medicalHis, allergies);
			
			PatientDAO dao = new PatientDAO(DBConnect.getConn());
			HttpSession session = req.getSession();
			
			if (dao.updatePatient(upP)) {
				session.setAttribute("succMsg", "Patient Updated Successfully");
			} else {
				session.setAttribute("errMsg", "Something Wrong On Server");
			}
			
			resp.sendRedirect("admin/view_patient.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
