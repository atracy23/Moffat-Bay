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
import javax.servlet.http.Cookie;
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
import java.util.HashSet;
import java.util.Set;
//import java.util.Date;
import java.sql.Date;
import java.math.BigDecimal;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.util.ArrayList;

import com.moffat.bay.dao.ReservationDao;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
//import com.moffat.bay.util.Validations;
import com.moffat.bay.util.PasswordHash;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

//@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

	public ReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
    	
//		final long serialVersionUID = 1L;
		
		ReservationDao reservationDao = new ReservationDao();
  
    	System.out.println("entered doPost on Servlet");
 try {   	
    	ReservationBean reservation = new ReservationBean();
    	Date inDate = java.sql.Date.valueOf(request.getParameter("inDate"));
    	Date outDate = java.sql.Date.valueOf(request.getParameter("outDate"));
    	String roomSize = request.getParameter("roomSize");
    	int numGuests = Integer.parseInt(request.getParameter("numGuests"));

    	//verifying minimum 1 night stay
    	if(inDate.after(outDate)) {
			String dateError = "We're sorry to hear this.  You've decided to check-out before you've even checked in.  Please reconsider.";
			request.setAttribute("dateError",  dateError);
			request.setAttribute("numGuests", numGuests);
			request.setAttribute("roomSize", roomSize);
			request.setAttribute("inDate", inDate);
			request.setAttribute("outDate", outDate);
			RequestDispatcher rd = request.getRequestDispatcher("/reservation.jsp");
			rd.forward(request, response);
			response.sendRedirect("reservation.jsp");
			return;
		}
   	
    	
    	System.out.println("The room size selected is: "+ roomSize);
    	System.out.println("The number of guests is: " + numGuests);
    	
    	// Verifying numGuests selection against roomSize selection
    	Boolean answer = verifyNumGuests(numGuests, roomSize);
    	if(answer == false) {
    		System.out.println("The room size error was sent to user.");
    		String roomSizeError = "The number of guests you are traveling with has exceeded our maximum occupancy for your room choice.  Please change your selections.";
    		request.setAttribute("roomSizeError", roomSizeError);
    		request.setAttribute("numGuests", numGuests);
			request.setAttribute("roomSize", roomSize);
			request.setAttribute("inDate", inDate);
			request.setAttribute("outDate", outDate);
    		RequestDispatcher rd = request.getRequestDispatcher("reservation.jsp");
    		rd.forward(request, response);
    		//response.sendRedirect("reservation.jsp");
    		return;
    	}
    	
    	System.out.println("The number of guests was verified ");
    	
    	
    	reservation.setNumGuests(Integer.parseInt(request.getParameter("numGuests")));
    	
    	reservation.setRoomSize(roomSize);
    	reservation.setInDate(inDate);
    	reservation.setOutDate(outDate);
    	
    	System.out.println("The Reservation Bean was updated.");
    	
    	ArrayList<Integer> roomNumList = new ArrayList<>();
    	
    	roomNumList = reservationDao.fetchRoom(reservation);
    	int numDays = calculateNumberOfNights(inDate, outDate);
    	System.out.println("numDays = "+numDays);
    	int roomNum = -1;
    	if(roomNumList!=null) {  //Rooms were found during time frame
    		System.out.println("The room list is not null");
    		for(Integer element : roomNumList) {
    			if(Collections.frequency(roomNumList, element) >= numDays){
    				roomNum = element;
    				System.out.println("The room number is: "+ roomNum);
    				break;
    			} 
    		}
    	if (roomNum < 0) {// No room available for all nights of stay
    		System.out.println("There were no available rooms found");    	
    		String noAvailableRooms = "Unfortunately we do not have any rooms of that size available during that time frame.  "
    				+ "Please pick different dates or a different room size.";
   			request.setAttribute("noAvailableRooms", noAvailableRooms);
   			request.setAttribute("numGuests", numGuests);
			request.setAttribute("roomSize", roomSize);
			request.setAttribute("inDate", inDate);
			request.setAttribute("outDate", outDate);
   			request.getRequestDispatcher("reservation.jsp").forward(request, response);
   			return;
   		} else {
   			System.out.println("The room number is: "+roomNum);
   			reservation.setRoomNum(roomNum);
   	   		Double price = calculatePrice(roomSize, inDate, outDate);
   	   		reservation.setPrice(price);
   	       	request.setAttribute("reserveSummary", reservation);   	
   	        RequestDispatcher reserveSummary = request.getRequestDispatcher("/summary.jsp");
   	        reserveSummary.forward(request, response);
   	        return;
   	            
   		}
   		
    	} 

 	}  catch (NullPointerException e1) {
    	 System.out.println("User not logged in");
    	 UserBean user = new UserBean();
    	 user.setEmail("anyone@email.com");
    	 user.setPassword(PasswordHash.hash("Password1"));
    }  catch (Exception e) {
    	 System.out.println("In catch block of reservationServlet");
     }	
    	 
     }

	
	
	public double  calculatePrice(String roomSize, Date inDate, Date outDate) {
		Double price = 0.0;
		Double tax = .07;
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
         
        
        Double totalPrice = price*days*tax;
        
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
    
    public Boolean verifyNumGuests(int numGuests, String roomSize) {
    	int double_full_max = 4;
    	int queen_max = 2;
    	int double_queen_max = 5;
    	int king_max = 3;
    	Boolean answer = true;
    	
    	// Verify the number of guests does not exceed the maximum occupancy for room size selection
    	switch(roomSize) {
    	
    	case "Double Full":
    		if(numGuests > double_full_max) {
    			answer = false;
    		}
    		break;
    	case "Queen":
    		if(numGuests > queen_max) {
    			answer = false;
    		}
    		break;
    	case "Double Queen":
    		if(numGuests > double_queen_max) {
    			answer = false;
    		}
    		break;
    	default:
    		if(numGuests > king_max) {
    			answer = false;
    		}
    		break;
    	}
    	return answer;
    }
    
    


}