/* Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
*/

package com.moffat.bay.controller;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
//import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Collections;
//import java.util.Date;
import java.sql.Date;
import java.math.BigDecimal;
import java.util.ArrayList;

import com.moffat.bay.dao.ReservationDao;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
//import com.moffat.bay.util.Validations;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

//@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

	public ReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		final long serialVersionUID = 1L;
		
		ReservationDao reservationDao = new ReservationDao();
  
    	System.out.println("entered doPost on Servlet");
 try {   	
    	ReservationBean reservation = new ReservationBean();
    	Date inDate = java.sql.Date.valueOf(request.getParameter("inDate"));
    	Date outDate = java.sql.Date.valueOf(request.getParameter("outDate"));
    	String roomSize = request.getParameter("roomSize");
    	
    	System.out.println("The room size selected is: "+ roomSize);
    	
    	reservation.setNumGuests(Integer.parseInt(request.getParameter("numGuests")));
    	reservation.setRoomSize(roomSize);
    	reservation.setInDate(inDate);
    	reservation.setOutDate(outDate);
    	
    	int roomNum = 0;
    	
    	roomNum = reservationDao.fetchRoom(reservation);
    	
    	if(roomNum!=0) {
    		reservation.setRoomNum(roomNum);
    		Double price = calculatePrice(roomSize, inDate, outDate);
    		reservation.setPrice(price);
        	request.setAttribute("reserveSummary", reservation);   	
            RequestDispatcher reserveSummary = request.getRequestDispatcher("/summary.jsp");
            reserveSummary.forward(request, response);
            return;
    	} 	
    	
     }  catch (Exception e) {
    	 System.out.println("In catch block of reservationServlet");
     }
    	
	}
	
	
	public double  calculatePrice(String roomSize, Date inDate, Date outDate) {
		Double price = 0.0;
	    final double QUEEN_PRICE = 120.75;
	    final double KING_DOUBLE_PRICE = 157.5;
	    int days = 0;
	    
        // Determine the room price based on roomSize
        if ("Queen".equalsIgnoreCase(roomSize)) {
        	price = QUEEN_PRICE;
        } else if ("King".equalsIgnoreCase(roomSize) || "Double Queen".equalsIgnoreCase(roomSize) || "Double Full".equalsIgnoreCase(roomSize)) {
        	price = KING_DOUBLE_PRICE;
        } else {
            // Handle invalid room size here (optional)
            System.out.println("Invalid room size: " + roomSize);
        }
         days = calculateNumberOfNights(inDate, outDate);
	    
        Double totalPrice = price*days;
        
        System.out.println("Total price is: "+ totalPrice);
		
		return totalPrice;
	}
	
    public int calculateNumberOfNights(Date checkInDate, Date checkOutDate) {
        // Convert java.sql.Date to LocalDate
        LocalDate startLocalDate = checkInDate.toLocalDate();
        LocalDate endLocalDate = checkOutDate.toLocalDate();

        // Calculate the number of days between the two dates
        long days = ChronoUnit.DAYS.between(startLocalDate, endLocalDate);
        
        System.out.println("The number of days of stay: "+ days);

        return (int) days;
    }

}