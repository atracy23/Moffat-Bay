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

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" type="text/css" href="home_css.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

                <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
                    rel="stylesheet">

                <title>Registration Page</title>

                <style>
                    /* Reset some default styles */
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: 'Raleway', sans-serif;
                        /* Apply Raleway font to all text */
                    }

                    /* Global styles */
                    body {
                        background-color: #f0f0f0;
                        display: flex;
                        flex-direction: column;
                        min-height: 100vh;
                    }

                    .body-container {
                        */
                        /* Creates scrollbar */
                        height: 500px;
                        overflow: auto;
                        margin-bottom: 200px;
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

                    /* Breadcrum styles */
                    ul.breadcrumb {
                        padding: 10px 16px;
                        list-style: none;
                        background-color: #26a5b5;
                    }

                    ul.breadcrumb li {
                        display: inline;
                        font-size: 18px;
                    }

                    ul.breadcrumb li+li:before {
                        padding: 8px;
                        color: white;
                        content: "/\00a0";
                    }

                    ul.breadcrumb li a {
                        color: white;
                        text-decoration: none;
                    }

                    ul.breadcrumb li a:hover {
                        color: #01447e;
                        text-decoration: underline;
                    }

                    .breadcrumb {
                        display: flex;
                        justify-content: center;
                        width: 100%;
                    }

                    h1 {
                        text-align: center;
                        margin-bottom: 5px;
                        margin-top: 5px;
                    }

                    .button {
                        background-color: rgb(38, 165, 181);
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        font-size: 18px;
                    }

                    .center-container {
                        text-align: center;
                        margin-top: 20px;
                        /* Add spacing at the top */
                        margin-bottom: 1px;
                        /* Add spacing at the bottom */
                    }

                    /* Form styles */
                    form {
                        display: inline-block;
                        text-align: center;
                        max-width: 300px;
                        margin: 0 auto;
                    }

                    label {
                        display: block;
                        /* margin-bottom: 1px; */
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

                    .required {
                        bottom: 0px;
                        text-align: right;
                        right: 0;
                        width: 70%;
                    }


                    /* Footer styles */
                    footer {
                        width: 100%;
                        background-color: #26a5b5;
                        /* Teal background color */
                        color: white;
                        padding: 30px 0;
                        text-align: center;
                        margin-top: auto;
                        /* Push the footer to the bottom */
                    }

                    .footer-content {
                        max-width: 1200px;
                        margin: 0 auto;
                        display: flex;
                        justify-content: space-between;
                        align-items: flex-start;
                        gap: 40px;
                        /* Increase the gap for more spacing */
                    }

                    .footer-section-info {
                        /* Adjust the width to create spacing */
                        box-sizing: border-box;
                        text-align: center;
                        width: 40%;
                        /* Adjust the width as needed */
                    }

                    .footer-section {
                        /* Adjust the width to create spacing */
                        box-sizing: border-box;
                        text-align: center;
                        width: 60%;
                        /* Adjust the width as needed */
                    }

                    .footer-section h3 {
                        font-size: 18px;
                        margin-bottom: 10px;
                    }

                    .footer-section p {
                        font-size: 14px;
                        margin-bottom: 10px;
                    }

                    .footer-section ul {
                        list-style: none;
                        padding: 0;
                    }

                    .footer-section ul li {
                        margin-bottom: 15px;
                        /* Increase the margin for more spacing */
                        text-align: center;
                        /* Center the text */
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
                        <h2 class="hotel-title">Moffat Bay</h2>
                        <ul class="navbar">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="Aboutus.jsp">About</a></li>
                            <li><a href="Attractions.jsp">Attractions</a> </li>

                            <li>
                                <a href="#">Reservation</a>
                                <ul>
                                    <li><a href="reservation.jsp">Book a Reservation</a></li>
                                    <li><a href="lookup.jsp">Reservation Look up</a></li>
                                    <li><a href="registration.jsp">Create an Account</a></li>
                                </ul>
                            </li>
                            <li class="login-button"><a href="login.jsp">Login</a></li>
                        </ul>
                    </div>

                </nav>
                <h1>Registration Page</h1>
                <ul class="breadcrumb">
                    <li>Registration</li>
                    <li><a href="login.jsp">LogIn</a></li>
                    <li><a href="reservation.jsp">Reservation</a></li>
                    <li><a href="summary.jsp">Reservation Summary</a></li>
                </ul>
                <br><br>
                <div class="body-container">
                    <div class="center-container">
                        <form action="/MoffatBay/register" method="post">

                            <label for="firstName">Enter your first name:*</label>
                            <input type="text" id="firstName" name="firstName" value="${param.firstName}" required>

                            <label for="lastName">Enter your last name:*</label>
                            <input type="text" id="lastName" name="lastName" value="${param.lastName}" required>

                            <label for="email">Enter your email address:*</label>
                            <input type="text" id="email" name="email" value="${param.email}" required>

                            <label for="phoneNum">Enter your phone number:*</label>
                            <input type="text" id="phoneNum" name="phoneNum" value="${param.phoneNum}" required>

                            <label for="password">Create a password:* (Must contain at least one number,
                                one uppercase letter, one lowercase letter, and at least 8 or more characters)</label>
                            <input type="password" name="password" id="password" value="${param.password}"
                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number,
				 one uppercase letter, one lowercase letter, and at least 8 or more characters" required>

                            <label for="confirmPassword" data-success="">Please confirm password:*</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" value="${param.password}"
                                class="validate" required>
                            <h3 style="color: red">${passwordMatchError}</h3>

                            <input type="submit" class="button" value="Sign Up" style="margin: auto;"><br><br>

                        </form>
                        <div class="required">
                            * indicates required field
                        </div>
                        <br>
                        <h3 style="color: red">${message}</h3>

                        <p>Already have an account? <a href="login.jsp"> Login</a></p>
                    </div>

                </div>
                <br>
                <footer>
                    <div class="footer-content">
                        <div class="footer-section-info">
                            <p>10 Moffat Bay,
                                Joviedsa,
                                WA 98250</p>
                            <p>info@moffatbay.com</p>
                            <p>223-445-0678</p>
                        </div>

                        <div class="footer-section">

                            <h3>About Us</h3>
                            <ul>
                                <li><a href="Aboutus.jsp">Discover the beauty of Moffat Bay Resort, where nature meets
                                        luxury.</a></li>
                            </ul>


                        </div>
                        <div class="footer-section">
                            <h3>Attractions</h3>
                            <ul>
                                <li><a href="Attractions.jsp">Check Out What We have to Offer!</a></li>

                            </ul>
                        </div>
                        <div class="footer-section">
                            <h3>Reservations</h3>
                            <ul>
                                <li><a href="reservation.jsp">Book Now</a></li>
                                <li><a href="lookup.jsp">Reservation Look up</a></li>
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