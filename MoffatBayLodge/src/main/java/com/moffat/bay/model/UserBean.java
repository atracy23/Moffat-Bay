package com.moffat.bay.model;

import java.util.Date;

public class UserBean {
	
	 private int id;
	 private String firstName; 
	 private String lastName;
	 private Date dateOfBirth;
	 private String email;
	 private String phoneNumber;
	 private String password; 
	 
	 public UserBean (int id, String firstName, String lastName, Date dateOfBirth, String email, String phoneNumber, String password) {
		 this.id = id;
		 this.firstName = firstName;
		 this.lastName = lastName;
		 this.dateOfBirth = dateOfBirth;
		 this.email = email;
		 this.phoneNumber = phoneNumber;
		 this.password = password;
	 }
	 
	 public UserBean() {
		 
	 }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	 
}
