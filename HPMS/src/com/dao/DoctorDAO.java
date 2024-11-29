package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Stack;


import com.entity.Doctor;

public class DoctorDAO {
	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addDoctor(Doctor d) {
		boolean f = false;
		
		try {
			String sql = "insert into doctor(full_name, dob, qualification, specialist, email, mobno) values (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
		
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public Stack<Doctor> getAllDoctor(){
		Stack<Doctor> allDoc = new Stack<Doctor>();
		Doctor d = null;
		try {
			String sql = "select * from doctor order by id";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				
				allDoc.add(d);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return allDoc;
		
	}
	
	public Doctor getDocById(int id){
		Doctor d = null;
		try {
			String sql = "select * from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return d;
	}
	
	
	public boolean updateDoctor(Doctor d) {
		boolean f = false;
		
		try {
			String sql = "update doctor set full_name=? , dob=? , qualification=? , specialist=? , email=? , mobno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setInt(7, d.getId());
		
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		return f;
	}
	
	public boolean deleteDoc(int id) {
		boolean f = false;
		
		try{
			String sql = "delete from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			
			int i = ps.executeUpdate();
			if ( i == 1 ) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Stack<Doctor> getAllDoctor(String searchTerm) {
	    Stack<Doctor> allDoc = new Stack<Doctor>();
	    Doctor d = null;
	    
	    try {
	        String sql = "select * from doctor where full_name like ? order by id";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        // Adding the search term to the query
	        ps.setString(1, "%" + searchTerm + "%"); // Search by name
	        
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	            d = new Doctor();
	            d.setId(rs.getInt(1));
	            d.setFullName(rs.getString(2));
	            d.setDob(rs.getString(3));
	            d.setQualification(rs.getString(4));
	            d.setSpecialist(rs.getString(5));
	            d.setEmail(rs.getString(6));
	            d.setMobNo(rs.getString(7));
	            
	            allDoc.add(d);
	                        
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return allDoc;
	}
	
	public Doctor binarySearchByName(Stack<Doctor> allDoctors, String name) {
		List<Doctor> DocList = new ArrayList<>(allDoctors);
		
		DocList.sort(Comparator.comparing(Doctor::getFullName));
		
		int l = 0;
		int r = DocList.size() - 1;
		
		while(l<=r) {
			int mid = l + (r-l) / 2 ;
			Doctor midDoc = DocList.get(mid);
			
			int comparison = midDoc.getFullName().compareToIgnoreCase(name);
			
			if(comparison == 0) {
				return midDoc;
			}
			
			if(comparison < 0) {
				l = mid + 1;
			} else {
				r = mid - 1;
			}
		}
		
		return null;		
	}
	
	public List<Doctor> getDoctorsBySpecialty(String specialty) {
	    List<Doctor> doctors = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM doctor WHERE specialist = ? ORDER BY full_name";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, specialty);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Doctor d = new Doctor();
	            d.setId(rs.getInt("id"));
	            d.setFullName(rs.getString("full_name"));
	            d.setDob(rs.getString("dob"));
	            d.setQualification(rs.getString("qualification"));
	            d.setSpecialist(rs.getString("specialist"));
	            d.setEmail(rs.getString("email"));
	            d.setMobNo(rs.getString("mobno"));
	            doctors.add(d);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return doctors;
	}

}