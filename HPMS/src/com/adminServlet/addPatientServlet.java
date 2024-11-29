package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.*;
import java.util.*;

import com.dao.PatientDAO;
import com.db.DBConnect;
import com.entity.*;

@WebServlet("/addPatient")
public class addPatientServlet extends HttpServlet {
	
	Stack<Patient> PStack = new Stack<Patient>();
	
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
			
			Patient p = new Patient(fullName, dob, blood, gender,phone,email, address, did, treatment, medicalHis, allergies);
			PStack.push(p);
			
			if(!PStack.isEmpty()) {
				Patient pat = PStack.pop() ;
				
				PatientDAO dao = new PatientDAO(DBConnect.getConn());
				HttpSession session = req.getSession();
				
				if(dao.addPatientRecord(pat)) {
					session.setAttribute("succMsg", "Patient Record Added");
				} else {
					session.setAttribute("errMsg", "Something Wrong On Server");
				}
				
				resp.sendRedirect("admin/patient.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
