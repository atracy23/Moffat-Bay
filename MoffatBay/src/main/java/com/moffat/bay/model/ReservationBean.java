/* Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
*/

package com.moffat.bay.model;

import java.text.ParseException;
import java.time.LocalDate;
import java.sql.Date;
import java.math.BigDecimal;
import java.io.Serializable;

public class ReservationBean {
	
	private int userId;
	private Date inDate;
	private Date outDate;
	private String roomSize;
	private int numGuests;
	private long numDays;
	private int roomNum;
	private int maxOccup;
	private Double price;
	/*
	 * private Date date; private int minStay; private BigDecimal totalPrice;
	 */
	
	public ReservationBean (long numDays, Date inDate, Date outDate, int numGuests, String roomSize, int roomNum, 
			int maxOccup, Double price, Date date, int userID, int minStay) {
		
		this.numDays = numDays;
		this.inDate = inDate;
		this.outDate = outDate;
		this.numGuests = numGuests;
		this.roomSize = roomSize;
		this.roomNum = roomNum;
		this.maxOccup = maxOccup;
		//this.date = date;
		this.userId = userID;
		
		Double tax = .07;
		Double totalPrice = price+(price*(tax));
		
		//this.totalPrice = totalPrice;
	}
	
	public ReservationBean() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}

	public int getNumGuests() {
		return numGuests;
	}

	public void setNumGuests(int numGuests) {
		this.numGuests = numGuests;
	}

	public long getNumDays() {
		return numDays;
	}

	public void setNumDays(long numDays) {
		this.numDays = numDays;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public int getMaxOccup() {
		return maxOccup;
	}

	public void setMaxOccup(int maxOccup) {
		this.maxOccup = maxOccup;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	/*
	 * public Date getDate() { return date; }
	 * 
	 * public void setDate(Date date) { this.date = date; }
	 * 
	 * public int getMinStay() { return minStay; }
	 * 
	 * public void setMinStay(int minStay) { this.minStay = minStay; }
	 */

	//Functions for Reservation Calculations
	public String toString() {
		
		return "ReservationBean [roomSize=" + roomSize + ", numGuests=" + numGuests + ", inDate=" + inDate +
				", outDate=" + outDate + ", price=" + price + "]";
		
		
	}

	
	
}