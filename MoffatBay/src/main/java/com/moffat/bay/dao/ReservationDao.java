package com.moffat.bay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.moffat.bay.model.*;

public class ReservationDao {
	
	public ReservationDao() {
		
	}
	
	public int fetchRoom(ReservationBean reservationBean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement roomStatement = null;
		ResultSet roomResult = null;
		
		try {
			
			dbConn = dbConnection();
			
			int userResult = 0;
			
			String fetchAvailableRoom = "SELECT roomNum FROM rooms WHERE currentDate BETWEEN ? AND ? AND roomSize = ? AND maxOccup >= ? AND available = 'true' limit 1";
			roomStatement = dbConn.prepareStatement(fetchAvailableRoom);

			roomStatement.setDate(1, reservationBean.getInDate());
			roomStatement.setDate(2, reservationBean.getOutDate());
			roomStatement.setString(3, reservationBean.getRoomSize());
			roomStatement.setInt(4, reservationBean.getNumGuests());

			roomResult = roomStatement.executeQuery();
			
	        if (roomResult.next()) {
	        	userResult = roomResult.getInt("roomNum"); // Get the roomNum from the ResultSet
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
		return 0;

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
        String dbPassword = "Yogesh@05";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        return conn;
	}

}
