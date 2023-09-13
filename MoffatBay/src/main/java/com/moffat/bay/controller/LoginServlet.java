package com.moffat.bay.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moffat.bay.dao.UserDao;
import com.moffat.bay.model.UserBean;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        
    	final long serialVersionUID = 1L;
    	
    	UserDao userDao = new UserDao();
    	
        //login logic - checking credentials in the database
    	UserBean user = null;
		try {
			user = userDao.getUser(username, password);
	        if (user!=null) {
	            // Successful login
	            // You can redirect to the reservation page or include the reservation form here
	        	System.out.println("User exists: "+ user.toString());
                String successfulLoginMessage = "Welcome "+ user.getFirstName() + "!";
                request.setAttribute("successfulLoginMessage",  successfulLoginMessage);
                RequestDispatcher successReg = request.getRequestDispatcher("/index.jsp");
                successReg.forward(request, response);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                return;
	            
	        } else if (user == null) {
	            // Invalid credentials, redirect back to login.jsp with an error message
	        	System.out.println("Incorrect credentials!");
	        	request.setAttribute("message", "Oops!! Incorrect username or password. <br/>Please try again!");
	        	response.setContentType("text/html");
	        	request.getRequestDispatcher("login.jsp").forward(request, response);
	        }		
        } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}

