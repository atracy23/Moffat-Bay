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
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import java.util.Iterator;
import java.util.List;
import java.util.Set;
//import java.util.Date;
import java.sql.Date;
import java.math.BigDecimal;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.util.ArrayList;

import com.moffat.bay.dao.LookUpDao;
import com.moffat.bay.dao.ReservationDao;
import com.moffat.bay.model.LookUpBean;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;
import com.moffat.bay.util.Counter;
import com.moffat.bay.util.PasswordHash;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

//@WebServlet("/lookup")
public class LookUpServlet extends HttpServlet implements Serializable  {
	
	public LookUpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Counter counter;
		counter = (Counter)request.getSession().getAttribute("counter");
		
		if(counter == null) {
			counter = new Counter();
			request.getSession().setAttribute("counter", counter);
		}
		
		String increment = request.getParameter("increment");
		if(increment != null) {
			counter.increment();
		}
		
		String decrement = request.getParameter("decrement");
		if(decrement != null) {
			counter.decrement();
		}
		
		request.setAttribute("counter", counter.getCounter());
		
		LookUpBean lookupbean = new LookUpBean();
		String id = lookupbean.getId();
		HttpSession session = request.getSession();
		
		Integer size = (Integer)session.getAttribute("size");
		Integer index = (Integer)session.getAttribute("index");
		
		System.out.println("size in session is: "+size);
		// + " and index is: "+ index
		
		List<ReservationBean>reservationBeanList =(List<ReservationBean>)session.getAttribute("reservationBeanList");
		if(reservationBeanList.isEmpty()) {
			System.out.println("bean list is empty in doGet");
		} else {
		System.out.println("bean list is NOT empty doGet - size of list is "+ reservationBeanList.size());
		}
		
		session.setAttribute("index", counter.getCounter());
		index = (Integer) session.getAttribute("index");
		

		request.setAttribute("roomSize", reservationBeanList.get(index).getRoomSize());
		request.setAttribute("numGuests", reservationBeanList.get(index).getNumGuests());
		request.setAttribute("inDate", reservationBeanList.get(index).getInDate());
		request.setAttribute("outDate", reservationBeanList.get(index).getOutDate());
		request.setAttribute("id", id);
		request.setAttribute("size", reservationBeanList.size());
		request.setAttribute("current", index+1);
		request.getRequestDispatcher("lookup.jsp").forward(request, response);
		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
					
		try {
			String id = request.getParameter("reserveID");
			
			// Declare and initialize
			LookUpDao lookupdao = new LookUpDao();
			List<ReservationBean> reservationBeanList = new ArrayList<ReservationBean>();
			LookUpBean lookupbean = new LookUpBean();
			HttpSession session = request.getSession();
			
			lookupbean.setId(id);
			String beanId = lookupbean.getId();
			System.out.println("lookupbean has id of " + beanId);
			
			if(id != null) { // Either email or reserveID was entered in input field
				
				int selectReserveID = 0;
				int index = -1;
				
				// Get userID from DB table using email
				if(id.contains("@")) { 
					String email = id;
					
					System.out.println("The email entered is: "+email);
					
					// Getting userID from table using email address
					int userID = lookupdao.fetchUserID(email); 
				
					if(userID != 0) { // Found email in DB & returned userID
						System.out.println("email was found. userID = "+userID);
						
						// Setting userID in LookUpBean
						lookupbean.setUserID(userID);
						
					} else { // email was not found in database
						String idErrorMessage = "So sorry but we can't find that email address in our records.  Please verify the information you entered or "
								+ "enter a Reservation ID number.";
						request.setAttribute("idErrorMessage", idErrorMessage);
						request.setAttribute("id", id);
						request.getRequestDispatcher("lookup.jsp").forward(request, response);
						return;
					}
			
				} else { // Setting reservation ID in LookUpBean
					selectReserveID =Integer.parseInt(id); 
					lookupbean.setReservationID(selectReserveID);
				
					System.out.println("The reserveID: "+selectReserveID);
				
				} 
				
				//Getting reservation info from DB tables
				reservationBeanList = lookupdao.fetchReservation(lookupbean);
				
				if(reservationBeanList.isEmpty()) { //  Reservation ID does not exist in database
					
					System.out.println("reservationBeanList is empty from DAO");
					
					String idErrorMessage = "There were no reservation records found.  Please verify you entered the correct Reservation ID/email address.";
					request.setAttribute("idErrorMessage", idErrorMessage);
					RequestDispatcher rd = request.getRequestDispatcher("/lookup.jsp");
					rd.forward(request, response);
					return;
				}
				
				session.setAttribute("reservationBeanList", reservationBeanList);
				session.setAttribute("index", index);
				
			}
			int index = (int) session.getAttribute("index");
			index++;
			session.setAttribute("index", index);
				
			doGet(request, response);
				
		}catch (NullPointerException e1) {
			UserBean user = new UserBean();
			user.setEmail("anyone@email.com");
		   	user.setPassword(PasswordHash.hash("Password1"));
		   	 	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
}
	


}
