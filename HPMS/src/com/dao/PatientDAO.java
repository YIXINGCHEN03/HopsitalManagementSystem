package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Stack;

import com.entity.Patient;

public class PatientDAO {
	private Connection conn;

	public PatientDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addPatientRecord(Patient p ) {
		boolean f = false;
		
		String sql = "insert into patient (fullName,dob,blood,gender,phone,email,address,did,treatment,medicalHistory,allergies) values (?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getFullName());
			ps.setString(2, p.getDob());
			ps.setString(3, p.getBlood());
			ps.setString(4, p.getGender());
			ps.setString(5, p.getPhone());
			ps.setString(6, p.getEmail());
			ps.setString(7, p.getAddress());
			ps.setInt(8, p.getDid());
			ps.setString(9, p.getTreatment());
			ps.setString(10, p.getMedicalHistory());
			ps.setString(11, p.getAllergies());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	
	public Patient getPatientById(int id) {
		Patient p = null;
		try {
			String sql = "select * from patient where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				p = new Patient();
				p.setId(rs.getInt(1));
				p.setFullName(rs.getString(2));
				p.setDob(rs.getString(3));
				p.setBlood(rs.getString(4));
				p.setGender(rs.getString(5));
				p.setPhone(rs.getString(6));
				p.setEmail(rs.getString(7));
				p.setAddress(rs.getString(8));
				p.setDid(rs.getInt(9));
				p.setTreatment(rs.getString(10));
				p.setMedicalHistory(rs.getString(11));
				p.setAllergies(rs.getString(12));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public boolean updatePatient(Patient p) {
		boolean f = false;
		
		try {
			String sql ="update patient set fullName=?, dob=?, blood=?, gender=?, phone=?, email=?, address=?, did=?, treatment=?, medicalHistory=?, allergies=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getFullName());
			ps.setString(2, p.getDob());
			ps.setString(3, p.getBlood());
			ps.setString(4, p.getGender());
			ps.setString(5, p.getPhone());
			ps.setString(6, p.getEmail());
			ps.setString(7, p.getAddress());
			ps.setInt(8, p.getDid());
			ps.setString(9, p.getTreatment());
			ps.setString(10, p.getMedicalHistory());
			ps.setString(11, p.getAllergies());
			ps.setInt(12, p.getId());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deletePatient(int id) {
		boolean f = false;
		
		try {
			String sql = "delete from patient where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public Stack<Patient> getAllPatient(String searchTerm) {
	    Stack<Patient> allP = new Stack<Patient>();
	    Patient p = null;
	    
	    try {
	        String sql = "select * from patient where fullName like ? order by id";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        // Adding the search term to the query
	        ps.setString(1, "%" + searchTerm + "%"); // Search by name
	        
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	            p = new Patient();
	            p.setId(rs.getInt(1));
	            p.setFullName(rs.getString(2));
	            p.setDob(rs.getString(3));
	            p.setBlood(rs.getString(4));
	            p.setGender(rs.getString(5));
	            p.setPhone(rs.getString(6));
	            p.setEmail(rs.getString(7));
	            p.setAddress(rs.getString(8));
	            p.setDid(rs.getInt(9));
	            p.setTreatment(rs.getString(10));
	            p.setMedicalHistory(rs.getString(11));
	            p.setAllergies(rs.getString(12));
	            
	            allP.add(p);                
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return allP;
	}
	
	// Binary Search function to find a patient by name
    public Patient binarySearchByName(Stack<Patient> allPatients, String name) {
        // Convert Stack to ArrayList for easier random access
        List<Patient> patientsList = new ArrayList<>(allPatients);

        // Sort the list by name (or any other attribute)
        patientsList.sort(Comparator.comparing(Patient::getFullName));  // Sorting by full name

        int left = 0;
        int right = patientsList.size() - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            Patient midPatient = patientsList.get(mid);
            
            int comparison = midPatient.getFullName().compareToIgnoreCase(name); // Case-insensitive comparison
            
            if (comparison == 0) {
                return midPatient;  // Found
            }
            if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null; // Not found
    }
}
