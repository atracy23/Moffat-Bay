package com.moffat.bay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.String;

import com.moffat.bay.dao.RegistrationDao;
import com.moffat.bay.model.RegistrationBean;
import com.moffat.bay.util.ValidatePassword;

import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
    }
    
    public class CustomException extends RuntimeException{
    	public CustomException(String message) {
    		super(message);
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		RegistrationDao registerDao = new RegistrationDao();
		ValidatePassword validate = new ValidatePassword();
		
		if(validate.confirmMatch(password, confirmPassword)==false) {
			String passwordMatchError = "Password entries must match.  Please try again.";
			request.setAttribute("passwordMatchError",  passwordMatchError);
			RequestDispatcher pwError = request.getRequestDispatcher("/registration.jsp");
			pwError.forward(request, response);
			return;
		};
		
		//get info from Bean
		//RegistrationBean register = new RegistrationBean(firstName, lastName, email, phoneNum, password);
		
		//verifying user email doesn't exist in DB
		try {
			RegistrationBean register = registerDao.getRegisterInfo(firstName, lastName, email, phoneNum, password);
		
			if(register == null) { //email was found in database
				System.out.println("entered if register on servlet");
				String message = "This email already exists in the system.  Please login or enter another email address.";
				request.setAttribute("message",  message);
				RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
				rd.forward(request, response);
				return;
			} else { //user created
				
				response.sendRedirect("/MoffatBay/login.jsp");
				return;
				
			} //end else
				
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}