package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Queue;

import com.entity.appointment;


public class appointmentDAO {
	private Connection connection;

	public appointmentDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addAppoint(appointment ap) {
		boolean f = false;
		
		try {
			String sql = "insert into appointment(userid, fullname, gender, age, appoint_date, email, phNo, disease, docId, address, status) values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt( 1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppointDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDisease());
			ps.setInt(9, ap.getDocId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Queue< appointment > getRecentAppointments(int userId){
		Queue<appointment> appointments = new LinkedList<>();
		
		try {
			String sql = "SELECT * FROM appointment WHERE userid = ? ORDER BY appoint_date DESC ";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				appointment ap = new appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
                ap.setFullName(rs.getString(3));
                ap.setGender(rs.getString(4));
                ap.setAge(rs.getString(5));
                ap.setAppointDate(rs.getString(6));
                ap.setEmail(rs.getString(7));
                ap.setPhNo(rs.getString(8));
                ap.setDisease(rs.getString(9));
                ap.setDocId(rs.getInt(10));
                ap.setAddress(rs.getString(11));
                ap.setStatus(rs.getString(12));
                
                appointments.add(ap);
                }
			} catch (Exception e){
				e.printStackTrace();
			}
		return appointments;
	}
	
	public boolean cancelAppointment(int appointmentId) {
	    boolean f = false;
	    try {
	        String query = "DELETE FROM appointment WHERE id = ?";
	        PreparedStatement pstmt = connection.prepareStatement(query);
	        pstmt.setInt(1, appointmentId);
	        f = pstmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	
	public appointment getAppointmentByIdAndUserId(int appointmentId, int userId) {
	    appointment appt = null;
	    try {
	        String query = "SELECT * FROM appointment WHERE id = ? AND userid = ?";
	        PreparedStatement pstmt = connection.prepareStatement(query);
	        pstmt.setInt(1, appointmentId);
	        pstmt.setInt(2, userId);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            appt = new appointment();
	            appt.setId(rs.getInt(1));
	            appt.setUserId(rs.getInt(2));
	            appt.setFullName(rs.getString(3));
	            appt.setGender(rs.getString(4));
	            appt.setAge(rs.getString(5));
	            appt.setAppointDate(rs.getString(6));
	            appt.setEmail(rs.getString(7));
	            appt.setPhNo(rs.getString(8));
	            appt.setDisease(rs.getString(9));
	            appt.setDocId(rs.getInt(10));
	            appt.setAddress(rs.getString(11));
	            appt.setStatus(rs.getString(12));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return appt;
	}



}
