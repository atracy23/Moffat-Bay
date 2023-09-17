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
import java.util.ArrayList;
import java.util.List;

import com.moffat.bay.model.LookUpBean;
import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;

public class LookUpDao {

	public LookUpDao() {
		
	}
	
	public List<ReservationBean> fetchReservation(LookUpBean lookupbean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement reserveStatement = null;
		ResultSet reserveResult = null;
		
		System.out.println("Entered Lookup Dao");
		
		try {
			
			dbConn = dbConnection();
			
			List<ReservationBean> resultList = new ArrayList<>();
			
			String fetchReservations = "SELECT roomSize, numGuests, inDate, outDate FROM reservations WHERE reserveID = ? || userID = ?";
			reserveStatement = dbConn.prepareStatement(fetchReservations);

			reserveStatement.setInt(1, lookupbean.getReservationID());
			reserveStatement.setInt(2, lookupbean.getUserID());
			
			reserveResult = reserveStatement.executeQuery();
			
			// Get the reservation data from the ResultSet
			while (reserveResult.next()) {
				ReservationBean reservation = new ReservationBean();
				reservation.setRoomSize(reserveResult.getString("roomSize"));
				reservation.setNumGuests(reserveResult.getInt("numGuests"));
				reservation.setInDate(reserveResult.getDate("inDate"));
				reservation.setOutDate(reserveResult.getDate("outDate")); 
				resultList.add(reservation);
	        	
	        }
	        
	        System.out.println("Reservation Info retrieved");
	        return resultList;

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(reserveStatement != null) {
				reserveStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
			
		}
		return null;

	}
	
	public int fetchUserID(String email) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement idStatement = null;
		ResultSet idResult = null;
		
		try {
			
			dbConn = dbConnection();
			
			int userID = 0;
			
			String userIDRetrieve = "Select userID FROM users WHERE email = ?"; 
			idStatement = dbConn.prepareStatement(userIDRetrieve);
			idStatement.setString(1, email);
			
			idResult = idStatement.executeQuery();
			
			while(idResult.next()) {
				userID = idResult.getInt("userID"); // Getting userID from resultSet
			}
			
			System.out.println("Retrieved userID from user table "+ userID);
			
			return userID;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(idStatement != null) {
				idStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
			
		}
		
		return 0;
	}
	
	


	
	public Connection dbConnection() throws ClassNotFoundException, SQLException {
        String dbUrl = "jdbc:mysql://localhost:3306/moffat_bay";
        String dbUsername = "root";
        String dbPassword = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        return conn;
	}

}

