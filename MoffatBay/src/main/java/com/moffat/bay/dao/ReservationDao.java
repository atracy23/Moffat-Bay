/* Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
									Rashmi Sathiyanarayanan
									Joseph Youskievicz
									Angie Tracy
*/

package com.moffat.bay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.sql.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/*import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.ZoneId;
*/
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.sql.*;
import java.math.*;
//import java.util.Date;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.*;
import java.text.DecimalFormat;



import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.util.*;

public class ReservationDao {
	Date inDate;
	Date outDate;
	
	
	public ReservationDao() {
		
	}
	public void getData(HttpServletRequest request) {
		String inDateStr = (String)request.getAttribute("inDateStr");
		String outDateStr = (String)request.getAttribute("outDateStr");
		
		//Converting data types on string attributes
		Date inDate = java.sql.Date.valueOf(inDateStr);
		Date outDate = java.sql.Date.valueOf(outDateStr);
		
		this.inDate = inDate;
		this.outDate = outDate;
		
	}
	
	public class AvailableRoomsArrayList{
		public static ArrayList<Object> availableRoomsArrayList = new ArrayList<Object>();
	}

	public ReservationBean getRoom(String roomSize, int roomNum, int maxOccup, String price, Date date) throws ClassNotFoundException, SQLException {
	
System.out.println("entered Dao");
		//Initializing new variables
		//Date currentDate = new Date();
		java.sql.Date dates = new java.sql.Date(System.currentTimeMillis());
		
		//Creating objects to be returned depending on whether there were rooms Available
		ReservationBean noAvailableReservations = null;
		ReservationBean availableReservations = new ReservationBean(roomSize, roomNum, maxOccup, price, dates);
		
		Connection dbConn = null;
		PreparedStatement checkRoom = null;
		ResultSet roomDB = null;
		PreparedStatement updateRoom = null;
		ResultSet updatingRoom = null;
		
		try {
System.out.println("entered try on Dao");
	
			dbConn = dbConnection();
			
			String checkAvailability = "SELECT roomNum FROM rooms WHERE roomSize = ?";
			checkRoom = dbConn.prepareStatement(checkAvailability);
			checkRoom.setDate(1, dates);
			
/*			
			String checkAvailability = "SELECT currentDate, roomNum, maxOccup, price FROM rooms WHERE currentDate BETWEEN inDate AND outDate AND roomSize = ? AND available = true";
			
			checkRoom = dbConn.prepareStatement(checkAvailability);
			checkRoom.setDate(1, dates);
			checkRoom.setInt(2, roomNum);
			checkRoom.setInt(3, maxOccup);
			checkRoom.setString(4, price);
			roomDB = checkRoom.executeQuery();
*/
System.out.println("executed Query on Dao");

/*			
			QueryRunner run = new QueryRunner();
			ResultSetHandler<ReservationBean> resultHandler = new BeanHandler<ReservationBean>(ReservationBean.class);
			
			try {
				reservation = run.query(dbConn,"SELECT currentDate AND roomNum AND maxOccup AND price FROM reservations"  
					+ " WHERE currentDate >= inDate=? AND currentDate <= outDate=? AND roomSize = ? AND availability = TRUE", resultHandler);

				QueryRunner run = new QueryRunner(dataSource);
			List<Person> personList = run.query("SELECT currentDate AND roomNum AND maxOccup AND price FROM reservations"
					+ " WHERE currentDate >= inDate=? AND currentDate <= outDate=? AND roomSize = ? AND availability = TRUE", new BeanListHandler<>(Person.class));
			

			if(numGuests > maxOccup) maxOccup = 0;
			BeanProcessor bp = new BeanProcessor();
			reservation = bp.toBean(roomDB, ReservationBean.class);
*/

			ArrayList<Object> availableRooms = new ArrayList<Object>();


			
			if(roomDB.next()) {//there are available rooms
/*				
				dates = roomDB.getDate("dates");
				roomNum = roomDB.getInt("roomNum");
				maxOccup = roomDB.getInt("maxOccup");
				price = roomDB.getBigDecimal("price");
*/	
				
	
				//roomNumArray.add(roomNum);
				//availableRooms.add(dates);
				availableRooms.add(roomNum);
				//availableRooms.add(maxOccup);
				//availableRooms.add(price);
		
				return availableReservations;
				
			} else {//there are no available rooms
				return noAvailableReservations;
			}
			
			if(int i = 101; i <= 315; i++) {
				int frequency = Collections.frequency(availableRooms, i);
				if(frequency == numDays) {
					roomNum = i;
					break;
				}
			}
			
			
//System.out.println("created ArrayList on Dao");	
			
			
		}finally {
			if(null!=roomDB) {
				roomDB.close();
		}
				
		checkRoom.close();
		dbConn.close();
	}
	
	}
	public Connection dbConnection() throws ClassNotFoundException, SQLException{
        String dbUrl = "jdbc:mysql://localhost:3306/moffat_bay";
        String dbUsername = "root";
        String dbPassword = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        return conn;
	}
}

		
			


		
	

