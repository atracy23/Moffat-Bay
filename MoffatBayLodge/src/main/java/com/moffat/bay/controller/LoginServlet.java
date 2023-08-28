package com.moffat.bay.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moffat.bay.dao.UserDao;
import com.moffat.bay.model.UserBean;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
    	final long serialVersionUID = 1L;
    	
    	UserDao userDao = new UserDao();
    	
        //login logic - checking credentials in the database
    	UserBean user;
		try {
			user = userDao.getUser(username, password);
	        if (user!=null) {
	            // Successful login
	            // You can redirect to the reservation page or include the reservation form here
	            response.sendRedirect("reservation.jsp");
	        } else {
	            // Invalid credentials, redirect back to index.jsp with an error message
	        	request.setAttribute("message", "Incorrect username or password. <br/>Please try again!");
	        }		
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}

