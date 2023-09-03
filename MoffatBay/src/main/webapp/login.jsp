<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.moffat.bay.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
        <style>
       



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

/* Center-align the form elements */
        form {
            display: inline-block; /* Ensures the form is centered */
            text-align: left; /* Reset text alignment within the form */
            max-width: 300px; /* Limit the width of the form for better readability */
            margin: 0 auto; /* Center the form horizontally within the container */
        }

        /* Style the labels for better alignment */
        label {
            display: block; /* Make labels appear on separate lines */
            margin-bottom: 5px; /* Add some vertical spacing between labels and inputs */
        }

        /* Style the text inputs */
        input[type="text"] {
            width: 100%; /* Make the text inputs take up the full width of the form */
            padding: 10px; /* Add some padding for better visual spacing */
            margin-bottom: 10px; /* Add some vertical spacing between inputs */
            border: 1px solid #ccc; /* Add a border for better visual separation */
            border-radius: 4px; /* Add rounded corners */
            box-sizing: border-box; /* Include padding and border in the total width */
        }

/* Login button styles */
.login-button {
    margin-right: 0;
}

.login-button a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    border: 2px solid rgb(38, 165, 181);
    border-radius: 4px;
    transition: background-color 0.3s ease-in-out, border-color 0.3s ease-in-out;
}

.login-button a:hover {
    background-color: rgb(38, 165, 181);
    color: #333;
    border-color: transparent;
}


.login-now-button {
    background-color: rgb(38, 165, 181);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 18px;
}

.login-now-button:hover {
    color: #f39c12;
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
	            <li><a href="#">Home</a></li>
	            <li><a href="#">About</a></li>
	            <li><a href="#">Attractions</a> </li>
	
	            <li>
	                <a href="#">Reservation</a>
	                <ul>
	                    <li><a href="#">Book a Reservation</a></li>
	                    <li><a href="#">Reservation Look up</a></li>
	                    <li><a href="#">Create an Account</a></li>
	                </ul>
	            </li>
	            <li><a href="#">Contact</a></li>
	            <li class="login-button"><a href="login.jsp">Login</a></li>
	        </ul>
	    </div>

    </nav>
    <div class="center-container">
        <h2 class>Please enter your credentials to login</h2>

        <form action="/MoffatBay/login" method="post">

            <label for="email">Email:  </label>
            <input type="text" name="email" id="email" required><br>
            <p>
            
            <label for="password">Password:</label>
            <input type="text" name="password" id="password" required><br>
            <p>
            <input type="submit" value="Submit" class="login-now-button">
            
            <%
                String error_msg = (String) request.getAttribute("message");
            %>
            
            <h3 style="color: red">${message}</h3>
        </form>
    </div>
    
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
	                <li><a href="#">Book Now</a></li>
	                <li><a href="#">Reservation Look up</a></li>
	            </ul>
	        </div>
	        <div class="footer-section">
	            <h3>Account</h3>
	            <ul>
	                <li><a href="#">Login</a></li>
	            </ul>
	        </div>
	    </div>
	    <div class="footer-bottom">
	        <p>&copy; 2023 Moffat Bay Resort. All rights reserved.</p>
	    </div>
	</footer>


</body>
</html>
