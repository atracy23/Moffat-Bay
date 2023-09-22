<!-- Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*" %>
        <%@ page import="com.moffat.bay.*" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


                <!DOCTYPE html>
                <html>
                <meta charset="ISO-8859-1">
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
                    rel="stylesheet">
                <title>About Us</title>
                <style>
                   /* Reset some default styles */
       			 * {
            			margin: 0;
            			padding: 0;
            			box-sizing: border-box;
            			font-family: 'Raleway', sans-serif; 
        			}
                        /* Apply Raleway font to all text */
                    }

                    /* Global styles */
                    body {
                        background-color: #f0f0f0;
                        /* Lighter background color */
                    }

                    /* Navigation bar styles */
                    ul.navbar {
                        list-style: none;
                        padding: 0;
                        margin: 0;
                        background-color: #26a5b5;
                        /* Teal navbar color */
                        display: flex;
                        /* Add flex display for positioning elements */
                        align-items: center;
                        /* Vertically center elements */
                    }

                    .navbar-container {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 15px 20px;
                        background-color: #26a5b5;
                        /* Teal navbar color */
                        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                        width: 100%;
                        /* Make the navbar full-width */
                    }

                    /* Add a new div for the logo and image */
                    .logo {
                        display: flex;
                        align-items: center;
                    }

                    /* Style the logo image */
                    .logo img {
                        width: 40px;
                        /* Adjust the width as needed */
                        height: 40px;
                        /* Adjust the height as needed */
                        margin-right: 10px;
                        /* Add spacing between the logo and text */
                    }

                    ul.navbar li {
                        position: relative;
                        display: inline-block;
                        margin-right: 20px;
                    }

                    ul.navbar li a {
                        color: white;
                        text-decoration: none;
                        transition: color 0.3s ease-in-out;
                        padding: 5px 10px;
                        /* Add padding for better visual appearance */
                    }

                    ul.navbar li.active a {
                        border: 2px solid white;
                        /* Add a white outline for the active link */
                    }


                    ul.navbar li:hover a {
                        color: #f39c12;
                    }

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
                        padding: 8px;
                    }

                    .center-container {
                        text-align: center;
                        margin-top: 20px;
                        /* Add spacing at the top */
                        margin-bottom: 20px;
                        /* Add spacing at the bottom */
                    }

                    /* Form styles */
                    form {
                        display: inline-block;
                        text-align: left;
                        max-width: 300px;
                        margin: 0 auto;
                    }

                    label {
                        display: block;
                        margin-bottom: 10px;
                        /* Add more spacing below labels */
                    }

                    input[type="text"],
                    input[type="password"] {
                        width: 100%;
                        padding: 10px;
                        margin-bottom: 15px;
                        /* Add more spacing below text inputs */
                        border: 1px solid #ccc;
                        border-radius: 4px;
                        box-sizing: border-box;
                        font-family: 'Raleway', sans-serif;
                        /* Apply Raleway font to text inputs */
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
                        background-color: #26a5b5;
                        /* Teal background color for the button */
                        font-size: 18px;
                        color: white;
                        cursor: pointer;
                    }

                    .login-button a:hover {
                        background-color: rgb(38, 165, 181);
                        color: #333;
                        border-color: transparent;
                    }

                    .login-now-button {
                        background-color: rgb(38, 165, 181);
                        color: white;
                        padding: 15px 30px;
                        /* Increase padding for a larger button */
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        font-size: 18px;
                        margin-top: 15px;
                        /* Add spacing at the top */
                    }

                    .login-now-button:hover {
                        color: #f39c12;
                    }

                    /* Footer styles */
                    footer {
                        background-color: #26a5b5;
                        /* Teal background color */
                        color: white;
                        padding: 30px 0;
                        margin-top: 20px;
                        /* Add spacing at the top */
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
                        text-align: center;
                        /* Center text within each div */
                    }

                    .footer-section h3 {
                        font-size: 18px;
                        margin-bottom: 10px;
                    }

                    .footer-section p,
                    .footer-section ul {
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
                        /* Add spacing at the top */
                        padding-top: 10px;
                        border-top: 1px solid #555;
                    }

                    .footer-bottom p {
                        font-size: 12px;
                    }

                    /* Adjust font size for the login header */
                    .login-header {
                        font-size: 18px;
                        /* Change the font size as needed */
                    }
                </style>
                </head>

                <body>

                    <nav>
                        <div class="navbar-container">
                            <div class="logo">
                                <img src="Landing_images/LOGO.jpeg" alt="Logo">
                                <h2 class="hotel-title">Moffat Bay</h2>
                            </div>
                            <ul class="navbar">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="Aboutus.jsp">About</a></li>
                                <li><a href="Attractions.jsp">Attractions</a> </li>

                                <li>
                                    <a href="reservation.jsp">Reservation</a>
                                    <ul>
                                        <li><a href="reservation.jsp">Book a Reservation</a></li>
                                        <li><a href="lookup.jsp">Reservation Look up</a></li>
                                        <li><a href="registration.jsp">Create an Account</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Contact</a></li>
                                <li class="login-button"><a href="login.jsp">Login</a></li>
                            </ul>
                        </div>

                    </nav>
                    <div class="center-container">

                        <c:if test="${not empty successfulRegistrationMessage}">
                            <h2>${successfulRegistrationMessage}</h2>
                        </c:if>
                        <h2 class>Please enter your credentials to login</h2>

                        <form action="/MoffatBay/login" method="post">

                            <label for="email">Email: </label>
                            <input type="text" name="email" id="email" required><br>
                            <p>

                                <label for="password">Password:</label>
                                <input type="text" name="password" id="password" required><br>
                            <p>
                                <input type="submit" value="Submit" class="login-now-button">

                                <% String error_msg=(String) request.getAttribute("message"); %>

                                    <h3 style="color: red">${message}</h3>
                                    <br>
                                    <br>
                                    <br>
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
                                    <li><a href="reservation.jsp">Book Now</a></li>
                                    <li><a href="#">Reservation Look up</a></li>
                                </ul>
                            </div>
                            <div class="footer-section">
                                <h3>Account</h3>
                                <ul>
                                    <li><a href="login.jsp">Login</a></li>
                                    <li><a href="registration.jsp">Create an account</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <p>&copy; 2023 Moffat Bay Resort. All rights reserved.</p>
                        </div>
                    </footer>


                </body>

                </html>