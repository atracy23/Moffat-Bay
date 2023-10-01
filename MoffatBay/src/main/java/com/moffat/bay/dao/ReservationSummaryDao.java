package com.moffat.bay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.moffat.bay.model.ReservationBean;
import com.moffat.bay.model.UserBean;

public class ReservationSummaryDao {
	
	public ReservationSummaryDao() {
		
	}
	
	public void saveReservation(ReservationBean reservationBean, UserBean userBean) throws SQLException, ClassNotFoundException {
		Connection dbConn = null;
		PreparedStatement summaryStatement = null;
		ResultSet summaryResult = null;
		
		try {
			
			dbConn = dbConnection();
			
			int userResult;
			
			String createReservation = "INSERT INTO reservations (userID, inDate, outDate, roomSize, numGuests, roomNum, price)" + "VALUES(?, ?, ?, ?, ?, ?, ?)";
			summaryStatement = dbConn.prepareStatement(createReservation);
			summaryStatement.setInt(1, userBean.getId());
			summaryStatement.setDate(2, reservationBean.getInDate());
			summaryStatement.setDate(3, reservationBean.getOutDate());
			summaryStatement.setString(4, reservationBean.getRoomSize());
			summaryStatement.setInt(5, reservationBean.getNumGuests());
			summaryStatement.setInt(6, reservationBean.getRoomNum());
			summaryStatement.setDouble(7, reservationBean.getPrice());
			userResult = summaryStatement.executeUpdate();
			
			System.out.println("User inserted into reservations table "+ userResult);			
			//return userResult;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(summaryStatement != null) {
				summaryStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
			
		}
		
		//return 0;
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
	
	public int getLastReserveID(ReservationBean reservationBean, UserBean userBean) throws SQLException, ClassNotFoundException {
	    Connection dbConn = null;
	    PreparedStatement lastReserveStatement = null;
	    ResultSet lastReserveResult = null;

	    try {
	        dbConn = dbConnection();

	        int lastReserveID = -1;

	        String getLastReservation = "SELECT reserveID FROM reservations WHERE userID = ? AND inDate = ? AND outDate = ?";
	        lastReserveStatement = dbConn.prepareStatement(getLastReservation);
	        lastReserveStatement.setInt(1, userBean.getId());
	        lastReserveStatement.setDate(2, reservationBean.getInDate());
	        lastReserveStatement.setDate(3, reservationBean.getOutDate());
	        lastReserveResult = lastReserveStatement.executeQuery();

	        if (lastReserveResult.next()) {
	            lastReserveID = lastReserveResult.getInt(1);
	        }

	        return lastReserveID;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (lastReserveStatement != null) {
	            lastReserveStatement.close();
	        }
	        if (dbConn != null) {
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
