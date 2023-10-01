package com.moffat.bay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.moffat.bay.model.UserBean;
import com.moffat.bay.util.*;

public class UserDao {
	
	public UserDao() {
		
	}
	
	public UserBean getUser(String email, String password) throws ClassNotFoundException, SQLException {
		
		UserBean user = null;
		
		Connection dbConn = null;
		PreparedStatement findUser = null;
		ResultSet userFromDb = null;
		
		try {
		
			dbConn = dbConnection();
			
			String getUserQuery = "SELECT * FROM users WHERE email = ? AND password = ?";
			findUser = dbConn.prepareStatement(getUserQuery);
			
			String encryptedPassword = PasswordHash.hash(password);
			
			findUser.setString(1, email);
			findUser.setString(2, encryptedPassword);
			
			userFromDb = findUser.executeQuery();
			
			if(userFromDb.next()) {
				int id1 = userFromDb.getInt("userID");
				String firstName = userFromDb.getString("firstName");
				String lastName = userFromDb.getString("lastName");
				String emailFromDb = userFromDb.getString("email");
				//Date dob = userFromDb.getDate("dateOfBirth");
				String phNb = userFromDb.getString("phoneNum");
				String pass1 = userFromDb.getString("password");
				
				// use the userId during construction
				user = new UserBean(id1, firstName, lastName, emailFromDb, phNb, pass1);
				
			}
			
			return user;
		
		} finally {
			if(null!=userFromDb) {
				userFromDb.close();
			}
			
			findUser.close();
			dbConn.close();
		}
		
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
