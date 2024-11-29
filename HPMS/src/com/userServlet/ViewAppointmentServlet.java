package com.userServlet;

import com.dao.appointmentDAO;
import com.dao.DoctorDAO;
import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.appointment;
import com.entity.Doctor;
import com.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ViewAppointment")
public class ViewAppointmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        
        String em = (String) session.getAttribute("userEmail");
        String pw = (String) session.getAttribute("userPass");
        
        UserDAO dao = new UserDAO(DBConnect.getConn());
        User user = dao.login(em, pw);
        

        if (user != null) {
            int appointmentId = Integer.parseInt(request.getParameter("id"));
            int userId = user.getId();

            appointmentDAO appointmentDAO = new appointmentDAO(DBConnect.getConn());
            DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConn());
            
            appointment appt = appointmentDAO.getAppointmentByIdAndUserId(appointmentId, userId);

            if (appt != null) {
                Doctor doctor = doctorDAO.getDocById(appt.getDocId());
                request.setAttribute("appointment", appt);
                request.setAttribute("doctor", doctor);
                request.getRequestDispatcher("viewappointment.jsp").forward(request, response);
            } else {
                response.sendRedirect("index.jsp?message=Appointment+details+not+found");
            }
        } else {
            response.sendRedirect("login.jsp?message=Please+log+in+to+view+appointment+details");
        }
    }
}
