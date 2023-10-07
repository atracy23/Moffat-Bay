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

import com.moffat.bay.model.*;

public class ReservationDao {
	
	public ReservationDao() {
		
	}
	
	public ArrayList<Integer> fetchRoom(ReservationBean reservationBean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement roomStatement = null;
		ResultSet roomResult = null;
		
		System.out.println("Entered Dao");
		
		try {
			
			dbConn = dbConnection();
			
			ArrayList<Integer> userResult = new ArrayList<Integer>();
			
			String fetchAvailableRoom = "SELECT roomNum FROM rooms WHERE currentDate BETWEEN ? AND ? AND roomSize = ? AND maxOccup >= ? AND available = '1'";
			roomStatement = dbConn.prepareStatement(fetchAvailableRoom);

			roomStatement.setDate(1, reservationBean.getInDate());
			roomStatement.setDate(2, reservationBean.getOutDate());
			roomStatement.setString(3, reservationBean.getRoomSize());
			roomStatement.setInt(4, reservationBean.getNumGuests());

			roomResult = roomStatement.executeQuery();
			
			while (roomResult.next()) {
	        	userResult.add(roomResult.getInt("roomNum")); // Get the roomNum from the ResultSet
	        }
	        
	        System.out.println("Room number retrieved: "+userResult);
	        return userResult;

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(roomStatement != null) {
				roomStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
			
		}
		return null;

	}
	
	public ArrayList<String> fetchAltRoom(ReservationBean reservationBean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement roomStatement = null;
		ResultSet roomResult = null;
		
		System.out.println("Entered Dao");
		
		try {
			
			dbConn = dbConnection();
			
			ArrayList<String> sizeResult = new ArrayList<String>();
			
			String fetchAvailableRoom = "SELECT roomsize FROM rooms WHERE currentDate BETWEEN ? AND ? AND maxOccup >= ? AND available = '1'";
			roomStatement = dbConn.prepareStatement(fetchAvailableRoom);

			roomStatement.setDate(1, reservationBean.getInDate());
			roomStatement.setDate(2, reservationBean.getOutDate());
			roomStatement.setInt(3, reservationBean.getNumGuests());

			roomResult = roomStatement.executeQuery();
			
			while (roomResult.next()) {
	        	sizeResult.add(roomResult.getString("roomSize")); // Get the roomSize from the ResultSet
	        }
	        
	        System.out.println("Room size retrieved: "+sizeResult);
	        return sizeResult;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(roomStatement != null) {
				roomStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
		}
		return null;
	}
	
	public int updateRooms(ReservationBean reservationBean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement roomStatement = null;
		ResultSet roomResult = null;
		
		try {
			
			dbConn = dbConnection();
			
			int roomUpdateRows;
			
			String updateRooms = "UPDATE rooms SET available = 'false' WHERE roomNum = ? AND currentDate BETWEEN ? AND ? "; 
			roomStatement = dbConn.prepareStatement(updateRooms);
			roomStatement.setInt(1, reservationBean.getRoomNum());
			roomStatement.setDate(2, reservationBean.getInDate());
			roomStatement.setDate(3, reservationBean.getOutDate());
			roomUpdateRows = roomStatement.executeUpdate();
			
			System.out.println("Room table updated with number rows "+ roomUpdateRows);	
			
			return roomUpdateRows;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(roomStatement != null) {
				roomStatement.close();
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
