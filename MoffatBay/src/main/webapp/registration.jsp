<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="com.moffat.bay.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="home_css.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
  
    <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
        rel="stylesheet">
        
<title>Registration Page</title>

	<style>
		body{background-color: #4444;}
    	h1{text-align: center; text: bold;}
    	img{height: 200px; width: auto;}
    	ul.breadcrumb{padding: 10px 16px; list-style: none; background-color: #eee;}
    	ul.breadcrumb li{display: inline; font-size: 18px;}
    	ul.breadcrumb li+li:before{padding: 8px; color: darkblue; content: "/\00a0";}
    	ul.breadcrumb li a{color: #0275d8; text-decoration: none;}
    	ul.breadcrumb li a:hover{color: #01447e; text-decoration: underline;}
    	.breadcrumb{display: flex; justify-content: center; width: 100%;}
    	button{background-color: darkblue; color: white; width: fit-content; margin: auto}
    	.container{border: solid gray; height: fit-content; width: fit-content; align-items: center; padding: 10px 10px 5px 10px; justify-content: center; margin: auto; background-color: cornflowerblue; color: white;}
    	.form_container{height: fit-content; width: fit-content; align-items: center; justify-content: center; display: flex-box; padding: 30px 100px 10px 100px; margin: auto;}
    	.sub_container{height: fit-content; justify-content: center; margin: auto;}
    	.header{text-align: center; border: solid gray; width: 100%; height: 50px; background-color: white;}
    	.footer{text-align: center; border: solid gray; width: 100%; height: 50px; position: fixed; bottom: 0; background-color: white;}
    	#message{display: none; color: #000; position: relative; padding: 20px; margin-top: 10px;}
    	#message p{padding: 10px 35px; font-size: 18px;}
ul.navbar {
    list-style: none;
    padding: 0;
    margin: 0;
    background-color: #333;
}

/* Main navigation bar styles */
body {
    background-color: #4444;
}

/* Container for the menu */
.navbar-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background-color: #333;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);

}

/* Menu styles */
ul.navbar li {
    position: relative;
    display: inline-block;
    margin-right: 20px;
}

ul.navbar li a {
    color: white;
    text-decoration: none;
    transition: color 0.3s ease-in-out;

}

ul.navbar li:hover a {
    color: #f39c12;

}

/* Dropdown styles */
ul.navbar li ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #444;
    padding: 0;
    z-index: 1;
    border-radius: 4px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    transition: opacity 0.3s ease-in-out;

}

ul.navbar li:hover ul {
    display: block;
    opacity: 1;

}

ul.navbar li ul li {
    display: block;
    width: 100%;
    margin: 0;
}

ul.navbar li ul li a {
    color: white;
    padding: 10px;
    display: block;
    text-decoration: none;
    transition: background-color 0.3s ease-in-out;

}

ul.navbar li ul li a:hover {
    background-color: #555;

}
/* Hotel title styles */
.hotel-title {
    color: white;
    margin: 0;
    font-size: 34px;

    font-weight: bold;
    font-family: 'Jim Nightshade', 'Arial', sans-serif;

    padding: 8px;

}

.center-container {
	text-align: center
}
    	
    	/* styling for the footer */
footer {
    background-color: #333;
    color: white;
    padding: 30px 0;
}

.footer-content {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-section {
    width: 25%;
    padding: 0 15px;
    box-sizing: border-box;
}

.footer-section h3 {
    font-size: 18px;
    margin-bottom: 10px;
}

.footer-section p, .footer-section ul {
    font-size: 14px;
}

.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section ul li {
    margin-bottom: 5px;
}

.footer-section ul li a {
    color: white;
    text-decoration: none;
}

.footer-bottom {
    text-align: center;
    margin-top: 20px;
    padding-top: 10px;
    border-top: 1px solid #555;
}

.footer-bottom p {
    font-size: 12px;
}
    	
    </style>

</head>
<body>
	<nav>
	    <div class="navbar-container">
	        <h2 class="hotel-title">Moffat Bay</h2>
	        <ul class="navbar">
	            <li><a href="index.jsp">Home</a></li>
	            <li><a href="#">About</a></li>
	            <li><a href="#">Attractions</a> </li>
	
	            <li>
	                <a href="#">Reservation</a>
	                <ul>
	                    <li><a href="#">Book a Reservation</a></li>
	                    <li><a href="#">Reservation Look up</a></li>
	                    <li><a href="registration.jsp">Create an Account</a></li>
	                </ul>
	            </li>
	            <li><a href="#">Contact</a></li>
	            <li class="login-button"><a href="login.jsp">Login</a></li>
	        </ul>
	    </div>

    </nav>
	<h1>Registration Page</h1>
	<ul class="breadcrumb">
		<li>Registration</li>
		<li><a href="http://localhost:7070/MoffatBay/login.jsp">LogIn</a></li>
		<li><a href="http://localhost:7070/MoffatBay/reservation.jsp">Reservation</a></li>
		<li><a href="#">Reservation Summary</a></li>
	</ul>
	<br><br>
	
	<div class="center-container">
		<form action="/MoffatBay/register" method="post">
			
			<label for="firstName">Enter your first name:*</label><br>
			<input type="text" id="firstName" name="firstName" required><br><br>
				
			<label for="lastName">Enter your last name:*</label><br>
			<input type="text" id="lastName" name="lastName" required><br><br>
				
			<label for="email">Enter your email address:*</label><br>
			<input type="text" id="email" name="email" required><br><br>
				
			<label for="phoneNum">Enter your phone number:*</label><br>
			<input type="text" id="phoneNum" name="phoneNum" required><br><br>
				
			<label for="password">Create a password:*</label><br>
			<input type="password" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number,
				 one uppercase letter, one lowercase letter, and at least 8 or more characters" required><br><br>
				
			<label for="confirmPassword" data-success="">Please confirm password:*</label><br>
			<input type="password" id="confirmPassword" name="confirmPassword" value="{param.email}" class="validate" required ><br><br>
			<h3 style="color: red">${passwordMatchError}</h3>
						
			<input type="submit" value="Sign Up" style="margin: auto;"><br><br>
			
		</form>
		<br>
		<h3 style="color: red">${message}</h3>
				
		<p>Already have an account? <a href="http://localhost:7070/MoffatBay/login.jsp"> Login</a></p>
	</div>
	<div class="required">
		* indicates required field
	</div>
	<br>
	<footer>
	    <div class="footer-content">
	        <div class="footer-section">
	            <h3>About Us</h3>
	            <p>Discover the beauty of Moffat Bay Resort, where nature meets luxury.</p>
	        </div>
	        <div class="footer-section">
	            <h3>Attractions</h3>
	            <ul>
	                <li><a href="#">Beaches</a></li>
	                <li><a href="#">Hiking Trails</a></li>
	                <li><a href="#">Wildlife Tours</a></li>
	            </ul>
	        </div>
	        <div class="footer-section">
	            <h3>Reservations</h3>
	            <ul>
	                <li><a href="http://localhost:7070/MoffatBay/reservation.jsp">Book Now</a></li>
	                <li><a href="#">Reservation Look up</a></li>
	            </ul>
	        </div>
	        <div class="footer-section">
	            <h3>Account</h3>
	            <ul>
	                <li><a href="login.jsp">Login</a></li>
	                <li><a href="registration.jsp">Create an Account</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="footer-bottom">
	        <p>&copy; 2023 Moffat Bay Resort. All rights reserved.</p>
	    </div>
	</footer>
	
</body>
</html>