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
			
			String getUserQuery = "SELECT * FROM user WHERE email = ? AND password = ?";
			findUser = dbConn.prepareStatement(getUserQuery);
			
			String encryptedPassword = PasswordHash.hash(password);
			
			findUser.setString(0, email);
			findUser.setString(1, encryptedPassword);
			
			userFromDb = findUser.executeQuery();
			
			if(userFromDb.next()) {
				int id = userFromDb.getInt("id");
				String firstName = userFromDb.getString("firstName");
				String lastName = userFromDb.getString("lastName");
				String emailFromDb = userFromDb.getString("email");
				Date dob = userFromDb.getDate("dateOfBirth");
				String phNb = userFromDb.getString("phoneNumber");
				String pass1 = userFromDb.getString("password");
				
				// use the userId during construction
				user = new UserBean(id, firstName, lastName, dob, emailFromDb, phNb, pass1 );
				
			}
			
			return user;
		
		} finally {
			userFromDb.close();
			findUser.close();
			dbConn.close();
		}
		
	}
	
	public Connection dbConnection() throws ClassNotFoundException, SQLException {
        String dbUrl = "jdbc:mysql://localhost:3306/moffat_bay";
        String dbUsername = "root";
        String dbPassword = "Yogesh@05";

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        return conn;
	}

}
