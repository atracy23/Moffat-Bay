package com.moffat.bay.model;

import java.util.Date;

public class UserBean {
	
	 private int userID;
	 private String firstName; 
	 private String lastName;
	 //private Date dateOfBirth;
	 private String email;
	 private String phoneNumb;
	 private String password; 
	 
	 public UserBean (int id, String firstName, String lastName, String email, String phoneNumber, String password) {
		 this.userID = id;
		 this.firstName = firstName;
		 this.lastName = lastName;
		 this.email = email;
		 this.phoneNumb = phoneNumber;
		 this.password = password;
	 }
	 
	 public UserBean() {
		 
	 }

	public int getId() {
		return userID;
	}

	public void setId(int id) {
		this.userID = id;
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

	/*
	 * public Date getDateOfBirth() { return dateOfBirth; }
	 * 
	 * public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth =
	 * dateOfBirth; }
	 */

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumb;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumb = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	 
}
