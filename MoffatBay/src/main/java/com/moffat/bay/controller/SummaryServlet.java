package com.moffat.bay.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
import com.moffat.bay.dao.*;

//@WebServlet("/summary")
public class SummaryServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReservationSummaryDao resevationSummaryDao = new ReservationSummaryDao();
		
		
		
    	try {
    		
    	System.out.println("Inside summary servlet doPost");
    	
        // Retrieve the UserBean from the HttpSession
        HttpSession session = request.getSession();
        UserBean userFromLogin = (UserBean) session.getAttribute("user");
        
        
        
        // Check which button was clicked
        String submitButtonValue = request.getParameter("submitButton");
        String cancelButtonValue = request.getParameter("cancelButton");
        
        System.out.println("the button selected is "+ submitButtonValue);
        
        if(submitButtonValue!=null) {
            
            if (userFromLogin != null) {
            	// Retrieve values from request parameters
                String roomSize = request.getParameter("roomSize");
                int numGuests = Integer.parseInt(request.getParameter("numGuests"));
                String inDate = (request.getParameter("inDate"));
                String outDate = (request.getParameter("outDate"));
                Double price = Double.parseDouble(request.getParameter("price"));
                int roomNum = Integer.parseInt(request.getParameter("roomNum"));
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf.parse(inDate);
                Date checkInDate = new Date(date.getTime());

                java.util.Date date1 = sdf.parse(outDate);
                Date checkOutDate = new Date(date1.getTime());
                // Create the reserveSummary object
                ReservationBean rSummary = new ReservationBean();
                rSummary.setRoomSize(roomSize);
                rSummary.setNumGuests(numGuests);
                rSummary.setInDate(checkInDate);
                rSummary.setOutDate(checkOutDate);
                rSummary.setPrice(price);
                rSummary.setRoomNum(roomNum);
                rSummary.setUserId(userFromLogin.getId());
                
                System.out.println("values from summaryServlet inDate" + rSummary.getInDate());
                System.out.println("values from summaryServlet outDate" + rSummary.getOutDate());
                
                resevationSummaryDao.saveReservation(rSummary,userFromLogin);
                
              //update rooms table
                int roomsUpdated = resevationSummaryDao.updateRooms(rSummary);
                System.out.println("Room table updated with num rows " + roomsUpdated);
                
                int lastReserveID = resevationSummaryDao.getLastReserveID(rSummary,userFromLogin );
                System.out.println("reservation inserted in the table " + lastReserveID);
            	String successfulReservationMessage = "Thank you for booking your stay with us! Your reservation ID is : "+lastReserveID  + " and room number is :" + rSummary.getRoomNum();
            	request.setAttribute("reserveSummary", rSummary); 
                request.setAttribute("successfulReservationMessage",  successfulReservationMessage);
                RequestDispatcher successReserve = request.getRequestDispatcher("/summary.jsp");
                successReserve.forward(request, response);
                
                
                
            } else if (null==userFromLogin) {
            	String successfulRegistrationMessage = "Please login to make a reservation";
                request.setAttribute("successfulRegistrationMessage",  successfulRegistrationMessage);
                RequestDispatcher successReg = request.getRequestDispatcher("/login.jsp");
                successReg.forward(request, response);
            }
        } else if(cancelButtonValue!=null) {
            RequestDispatcher cancelReg = request.getRequestDispatcher("/reservation.jsp");
            cancelReg.forward(request, response);
        }
    	
        
    	} catch (Exception e) {
    		System.out.println("In  summaryServelet catch block");
    		e.printStackTrace();
    	}
	}

}