package com.moffat.bay.model;

public class LookUpBean {
	
	private int userID = 0;
	private int reservationID = 0;
	private String id;
	
	public LookUpBean(int userID, int reservationID) {
		
		this.userID = userID;
		this.reservationID = reservationID;
	}
	
	public void lookupbean(String id) {
		this.id = id;
	}
	
	public LookUpBean() {
		
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getReservationID() {
		return reservationID;
	}

	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
