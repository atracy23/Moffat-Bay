package com.moffat.bay.util;

import java.io.Serializable;

public class ValidatePassword  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String password, confirmPassword;
	
	public boolean confirmMatch(String pass, String confirm) { 
		this.password = pass;
		this.confirmPassword = confirm;
		
		if(password.equals(confirmPassword)) {
			return true;
		} else { 
			return false;
		}
	}
	
}
