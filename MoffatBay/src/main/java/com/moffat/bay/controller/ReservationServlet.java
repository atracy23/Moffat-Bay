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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.sql.Date;
import java.util.ArrayList;

import com.moffat.bay.dao.ReservationDao;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
//import com.moffat.bay.util.Validations;
import com.moffat.bay.util.PasswordHash;

import java.io.IOException;

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
    	System.out.println("The check in date is: " + inDate);
    	System.out.println("The check out date is: " + outDate);
    	
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
    	if(roomNumList.isEmpty() ) { // No rooms found
    		System.out.println("roomNumList was empty");
    		} else { // Available rooms were found
    			System.out.println("The room list is not empty");
    			for(Integer element : roomNumList) { //Searching available rooms to see if a single room is available on all dates of stay
    				if(Collections.frequency(roomNumList, element) >= numDays){
    					roomNum = element;
    					System.out.println("The room number is: "+ roomNum);
    					break;
    				} 
    			}
    		}
    		
    		if (roomNum < 0) {// No room available for all nights of stay
    			ArrayList<String> altRoomSize = new ArrayList<>();
    			altRoomSize = reservationDao.fetchAltRoom(reservation);
    			String noAvailableRooms = "";
    			System.out.println("There were no available rooms found");
    			if(altRoomSize.isEmpty()) { // No other room sizes were found
    				noAvailableRooms = "Unfortunately we do not have any rooms available during that time frame.  "
    						+ "Please pick different dates.";
    			} else { // Other room sizes were found
    				String roomSizes = findUniqueRoomSizes(altRoomSize);
    				noAvailableRooms = "Unfortunately we do not have any rooms of that size available during that time frame.  "
    						+ "However we do have the following room sizes available: <br>" + roomSizes;
    			}
    			
    			request.setAttribute("noAvailableRooms", noAvailableRooms);
    			request.setAttribute("numGuests", numGuests);
    			request.setAttribute("roomSize", roomSize);
    			request.setAttribute("inDate", inDate);
    			request.setAttribute("outDate", outDate);
    			request.getRequestDispatcher("reservation.jsp").forward(request, response);
    			return;
    		} else { // Room was found available for all nights of stay
    			System.out.println("The room number is: "+roomNum);
    			reservation.setRoomNum(roomNum);
   	   			Double price = calculatePrice(roomSize, inDate, outDate);
   	   			reservation.setPrice(price);
   	   			HttpSession session = request.getSession();
   	   			session.setAttribute("reserveSummary", reservation);
   	   			request.setAttribute("reserveSummary", reservation);   	
   	   			RequestDispatcher reserveSummary = request.getRequestDispatcher("/summary.jsp");
   	   			reserveSummary.forward(request, response);
   	   			return;
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

	
	
	public Double calculatePrice(String roomSize, Date inDate, Date outDate) {
		Double price = 0.00;
		Double tax = .07;
	    final double QUEEN_PRICE = 120.75;
	    final double KING_DOUBLE_PRICE = 157.50;
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
       
        Double totalPrice = price*days*tax + price * days;
        DecimalFormat df = new DecimalFormat("#.00");
        String totalPriceDecimal = df.format(totalPrice);
        totalPrice = Double.parseDouble(totalPriceDecimal);
        
        System.out.println("Price = " + price);
        System.out.println("Tax = " + tax);
        System.out.println("Days = " + days);
        System.out.println("Total Price = " + totalPrice);
        
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
    
    public String findUniqueRoomSizes(ArrayList<String> roomSizes) {
    	List<String> uniqueSizes = roomSizes.stream().distinct().collect(Collectors.toList());
    	
    	//Adding List values to string
    	StringBuilder stringBuilder = new StringBuilder();
    	for(String item : uniqueSizes) {
    		stringBuilder.append(item);
    		stringBuilder.append(", ");
    	}
    	String uniqueRoomSizes = stringBuilder.toString();
    	//Removing last comma and space
    	uniqueRoomSizes = uniqueRoomSizes.substring(0, uniqueRoomSizes.length() -2);
    	
    	return uniqueRoomSizes;
    }
}