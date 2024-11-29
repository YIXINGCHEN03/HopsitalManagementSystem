package com.entity;

public class Patient {
	private int id;
	private String fullName;
	private String dob;
	private String blood;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private int did;
	private String treatment;
	private String medicalHistory;
	private String allergies;
	
	
	public Patient() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getBlood() {
		return blood;
	}


	public void setBlood(String blood) {
		this.blood = blood;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getDid() {
		return did;
	}


	public void setDid(int did) {
		this.did = did;
	}


	public String getTreatment() {
		return treatment;
	}


	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}


	public String getMedicalHistory() {
		return medicalHistory;
	}


	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}


	public String getAllergies() {
		return allergies;
	}


	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}


	public Patient(String fullName, String dob, String blood, String gender, String phone, String email, String address,
			int did, String treatment, String medicalHistory, String allergies) {
		super();
		this.fullName = fullName;
		this.dob = dob;
		this.blood = blood;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.did = did;
		this.treatment = treatment;
		this.medicalHistory = medicalHistory;
		this.allergies = allergies;
	}


	public Patient(int id, String fullName, String dob, String blood, String gender, String phone, String email,
			String address, int did, String treatment, String medicalHistory, String allergies) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.blood = blood;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.did = did;
		this.treatment = treatment;
		this.medicalHistory = medicalHistory;
		this.allergies = allergies;
	}
	
	

	
	
}
