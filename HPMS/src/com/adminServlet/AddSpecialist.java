package com.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import javax.servlet.annotation.*;

import com.dao.SpecialistDAO;
import com.db.DBConnect;


@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		
		SpecialistDAO dao = new SpecialistDAO(DBConnect.getConn());
		boolean f = dao.addSpecialist(specName);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Specialist Added");
			resp.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("errMsg", "Something Wrong On Server");
			resp.sendRedirect("admin/index.jsp");
		}
	}
}

