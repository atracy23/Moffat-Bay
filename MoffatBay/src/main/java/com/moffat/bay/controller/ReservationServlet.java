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

//import com.moffat.bay.dao.ReservationDao;
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
  
    	System.out.println("entered doPost on Servlet");
 try {   	
    	ReservationBean reservation = new ReservationBean();
    	Date inDate = new Date(123,8,1);
    	Date outDate = new Date(123,8,4);
    	
    	reservation.setNumGuests(3);
    	reservation.setRoomSize("King");
    	reservation.setRoomNum(104);
    	reservation.setInDate(inDate);
    	reservation.setOutDate(outDate);
    	reservation.setPrice(157.5);
    	
    	request.setAttribute("reserveSummary", reservation);   	
        RequestDispatcher reserveSummary = request.getRequestDispatcher("/summary.jsp");
        reserveSummary.forward(request, response);
        return; 
     }  catch (Exception e) {
    	 System.out.println("In catch block of reservationServlet");
     }
    	;
	}

}