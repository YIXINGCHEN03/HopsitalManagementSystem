package com.userServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.appointmentDAO;
import com.db.DBConnect;

@WebServlet("/delAppt")
public class deleteAppt extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("id"));
        appointmentDAO appointmentDAO = new appointmentDAO(DBConnect.getConn());
        boolean result = appointmentDAO.cancelAppointment(appointmentId);
        
       

        if (result) {
            response.sendRedirect("index.jsp?message=Appointment+Canceled+Successfully");
        } else {
            response.sendRedirect("index.jsp?message=Failed+to+Cancel+Appointment");
        }
    }
}
