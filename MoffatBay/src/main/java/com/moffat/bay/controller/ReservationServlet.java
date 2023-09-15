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
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
//import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Scanner;
//import java.sql.Date;
import java.math.BigDecimal;
import java.util.ArrayList;

import com.moffat.bay.dao.ReservationDao;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
import com.moffat.bay.util.Validations;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.net.URLConnection;


@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
	
	public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Setting session attributes to be used in Dao
		String inDateStr = (String)request.getAttribute("inDateStr");
		String outDateStr = (String)request.getAttribute("outDateStr");
				
		RequestDispatcher rd = request.getRequestDispatcher("/ReservationDao.java");
		rd.forward(request, response);
		return;
		
		//Retrieving ArrayList from DAO
/*		ReservationDao dao = new ReservationDao();
		ArrayList<Object> availableRoomsList = dao.getAvailableRoomsList();
		request.setAttribute("availableRooms", availableRoomsList);
		RequestDispatcher rd = request.RequestDispatcher()
*/		
	}

	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	final long serialVersionUID = 1L;
  
System.out.println("entered doPost on Servlet");


		String numGuestsStr = request.getParameter("numGuests");
    	String roomSize = request.getParameter("roomSize");
    	String inDateStr = request.getParameter("inDate");
    	String outDateStr = request.getParameter("outDate");
    
    	
System.out.println(inDateStr);    	    	
System.out.println("received parameters  on Servlet");
		
		//Setting Attributes to be used in doGet
		request.setAttribute("numGuestsStr", numGuestsStr);
		request.setAttribute("roomSize", roomSize);
		request.setAttribute("inDateStr", inDateStr);
		request.setAttribute("outDateStr", outDateStr);


		//Converting Strings to other data types
    	int numGuests = Integer.valueOf(numGuestsStr);
System.out.println("numGuests = " + numGuests);   
    		
    	//Creating more variables for Reservation Bean
    	
    	int roomNum = 0;
    	int maxOccup = 0;
    	Date inDate = java.sql.Date.valueOf(inDateStr);
    	Date outDate = java.sql.Date.valueOf(outDateStr);
    	String price = "";
    	Date date = new Date(); 
    	
    	
    	//verifying minimum 1 night stay
    	if(inDate.after(outDate)) {
			String dateError = "We're sorry to hear this.  You've decided to check-out before you've even checked in.  Please reconsider.";
			request.setAttribute("dateError",  dateError);
			RequestDispatcher rd = request.getRequestDispatcher("/reservation.jsp");
			rd.forward(request, response);
			return;
		}
  
System.out.println("created variables on Servlet");
  	
    	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    	LocalDate inDateLocal = LocalDate.parse(inDateStr, dtf);
    	LocalDate outDateLocal = LocalDate.parse(outDateStr, dtf);

System.out.println("created LocalDates on Servlet");

    	//Calculating number of days of stay
    	long numDays = ChronoUnit.DAYS.between(inDateLocal, outDateLocal);
    	
    	
    	
    	//Creating array of dates within stay
/*    	LocalDate[] dates = new LocalDate[numDays];
    	if(int i = 0; i < numDays; i++) {
    		dates[i] = LocalDate.of(inDate);
    		inDate = inDate.plusDays(1);
    	}
*/    	
    	
    	
    	//Checking availability in database
    	ReservationDao reservationDao = new ReservationDao();
    	//ReservationBean reservation;
    	try {
System.out.println("entered try on Servlet");
		
			ReservationBean reservation = reservationDao.getRoom(roomSize, roomNum, maxOccup, price, date);
System.out.println("entered after Dao Servlet");

			//HttpSession session = request.getSession();
			//ArrayList<Object> availableRoomsList = new ArrayList<Object>();

			//Retrieving ArrayList from DAO
			ReservationDao dao = new ReservationDao();
			ArrayList<Object> availableRoomsList = dao.getAvailableRoomsList();

			while(reservation.next()) {//there are room available
				//finding if any room has availability for all nights being requested
				int roomNum = reservation.getInt(2);
				availableRoomsList.add(roomNum);
			}
				
			}

/*   		
    		maxOccup = reservation.getMaxOccup();
    		if(numGuests > maxOccup) {
    			String roomSizeError = "You have too many guests for this room size.";
				request.setAttribute("roomSizeError",  roomSizeError);
				RequestDispatcher rd = request.getRequestDispatcher("/reservation.jsp");
				rd.forward(request, response);
				return;
    		
    		} else {
    			ArrayList<Integer> roomNumArray = new ArrayList<Integer>();
    			request.getAttribute("roomNumArray");
    			Boolean available = false;
    			for(int i = 0; i <= 1000; i++) {
    				int count = Collections.frequency(roomNumArray, i);
    				if(count == numDays) {
    					available = true;
    					roomNum = i;
    					break;
    				}
    			}
    			if(available == true) { 
    				ArrayList<Object> reservationArray = new ArrayList<Object>();
    				request.getAttribute("reservationArray");
    				request.setAttribute("reservationArray", reservationArray);
    				RequestDispatcher rd = request.getRequestDispatcher("/SummaryServlet");
        			rd.forward(request, response);
        			return;
    				
    			} else {
    				String noAvailability = "These dates are not available for this room size.";
    				request.setAttribute("noAvailability", noAvailability);
    				RequestDispatcher rd = request.getRequestDispatcher("/reservation.jsp");
        			rd.forward(request, response);
        			return;
    			}
    			
   			
    		}
 		
    	}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
 */   		
    	}
    	
    }	
	

