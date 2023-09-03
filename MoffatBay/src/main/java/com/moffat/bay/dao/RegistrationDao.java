package com.moffat.bay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.moffat.bay.model.RegistrationBean;
import com.moffat.bay.util.*;


public class RegistrationDao {
	
	public RegistrationDao() {
		
	}
	
	public RegistrationBean getRegisterInfo(String firstName, String lastName, String email, String phoneNum, String password) throws ClassNotFoundException, SQLException{
		
		//Creating objects to be returned depending on whether user was updated in database table or not
		RegistrationBean register = null;
		RegistrationBean newUser = new RegistrationBean(firstName, lastName, email, phoneNum, password);
		
		Connection dbConn = null;
		PreparedStatement emailStatement = null;
		ResultSet emailResult = null;
		PreparedStatement createUserStatement = null;
		
		try {
			
			dbConn = dbConnection();
			
			String getEmailQuery = "SELECT lastName FROM users WHERE email = ?";
			
			emailStatement = dbConn.prepareStatement(getEmailQuery);
			emailStatement.setString(1, email);
			emailResult = emailStatement.executeQuery();
			
			//if email does exist in db user table
			if(emailResult.next()) {
				return register;
			} 

			//email does not exist currently - adding user info to user table
			String encryptedPassword = PasswordHash.hash(password);
			int userResult;
			
			String createUser = "INSERT INTO users (firstName, lastName, email, phoneNum, password)" + "VALUES(?, ?, ?, ?, ?)";
			createUserStatement = dbConn.prepareStatement(createUser);
			createUserStatement.setString(1, firstName);
			createUserStatement.setString(2, lastName);
			createUserStatement.setString(3, email);
			createUserStatement.setString(4, phoneNum);
			createUserStatement.setString(5, encryptedPassword);
			userResult = createUserStatement.executeUpdate();
			
			return newUser;
			
		}finally {
			if(emailResult != null) {
				emailResult.close();
			}
			if(emailStatement !=null) {
				emailStatement.close();
			}
			if(createUserStatement != null) {
				createUserStatement.close();
			}
			if(dbConn != null) {
				dbConn.close();
			}
		}
	}
	
	public Connection dbConnection() throws ClassNotFoundException, SQLException{
        String dbUrl = "jdbc:mysql://localhost:3306/moffat_bay";
        String dbUsername = "root";
        String dbPassword = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, dbUsername, "Yogesh@05");

        return conn;
	}
}
