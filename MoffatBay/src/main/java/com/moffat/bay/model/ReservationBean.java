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

import java.sql.Date;
import java.math.BigDecimal;

public class ReservationBean {
	
	private String roomSize;
	private int roomNum;
	private int maxOccup;
	private String price;
	private Date date;
	
	public ReservationBean (String roomSize, int roomNum, int maxOccup, String price, Date date) {
		
		this.roomSize = roomSize;
		this.roomNum = roomNum;
		this.maxOccup = maxOccup;
		this.price = price;
		this.date = date;
		
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
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

	
}
