package com.userServlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.appointmentDAO;
import com.entity.appointment;
import com.db.*;

@WebServlet("/appAppointment")
public class AppointmentServlet extends HttpServlet{

	private Queue<appointment> queue = new LinkedList<>();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int u_id = Integer.parseInt(req.getParameter("userid"));
			String fullname =  req.getParameter("fullname");
			String gender = req.getParameter("gender");
			String age = req.getParameter("age");
			String appoint_date = req.getParameter("appoint_date");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String disease = req.getParameter("diseases");
			int did = Integer.parseInt(req.getParameter("doct"));
			String address = req.getParameter("address");
			
			appointment user_appo = new appointment(u_id,fullname,gender,age,appoint_date,email,phno,disease,did,address,"Pending");
			queue.add(user_appo);
			
			if(!queue.isEmpty()) {
				appointment ap_result = queue.poll();
				
				appointmentDAO dao = new appointmentDAO(DBConnect.getConn());
				boolean f  = dao.addAppoint(ap_result);
				HttpSession session = req.getSession();
				
				if (f) {
					session.setAttribute("succMsg", "Booking Successfully");
				} else {
					session.setAttribute("errMsg", "Something Wrong On Server");
				}
				
				resp.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
