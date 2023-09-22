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

                <head>
                    <meta charset="ISO-8859-1">
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
                        rel="stylesheet">
                    <title>About Us</title>
                    <style>
                        container {
                            max-width: 1200px;
                            margin: 0 auto;
                            padding: 20px;

                        }

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


                        /* Modern-looking login button */
                        .login-button a {
                            background-color: #009688;
                            color: #fff;
                            padding: 10px 20px;
                            border: none;
                            border-radius: 6px;
                            transition: background-color 0.3s ease-in-out;
                            text-decoration: none;
                        }

                        .login-button a:hover {
                            background-color: #007a6d;
                        }

                        /* Main content styles */
                        .about {
                            background-color: #fff;
                            padding: 30px;
                            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        }

                        .about-title {
                            font-size: 36px;
                            text-align: center;
                            margin-bottom: 20px;
                        }

                        .slogan {
                            font-size: 18px;
                            text-align: center;
                            margin-bottom: 30px;
                        }

                        /* Timeline styles */
                        .container {
                            display: flex;
                            flex-direction: row;
                            justify-content: space-between;
                            align-items: center;
                            padding: 20px;
                            justify-content: space-between;

                        }

                        .timeline {
                            border: 2px solid #009688;
                            background-color: #fff;
                            padding: 20px;
                            margin: 10px;
                            border-radius: 5px;
                            max-width: 400px;
                            margin-left: 100px;
                        }

                        .event {
                            border: 2px solid #009688;
                            background-color: #fff;
                            padding: 20px;
                            margin: 10px;
                            border-radius: 5px;
                            max-width: 400px;
                            display: none;
                        }

                        .event h3 {
                            font-size: 24px;
                            margin-bottom: 10px;
                        }

                        .timeline-controls {
                            margin-top: 20px;
                            text-align: center;
                            margin-bottom: 40px;
                        }


                        .timeline-controls button {
                            background-color: #009688;
                            color: #fff;
                            padding: 12px 24px;
                            border: none;
                            border-radius: 6px;
                            transition: background-color 0.3s ease-in-out;
                            cursor: pointer;
                        }

                        .timeline-controls button:hover {
                            background-color: #007a6d;
                        }

                        .picture {
                            flex-grow: 1;

                            margin-left: 480px;

                        }

                        .picture img {
                            max-width: 100%;
                            height: auto;
                        }

                        /* Styling for the container */
                        .contact-location-container {
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            padding: 20px;
                            margin-top: 20px;

                        }

                        /* Styling for the contact form container */
                        .contact-form-container {
                            width: 30%;
                            background-color: #f4f4f4;
                            padding: 30px;
                            border-radius: 10px;
                            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                            text-align: center;

                        }

                        /* Styling for form fields */
                        .contact-form label {
                            font-weight: bold;
                            margin-bottom: 10px;
                        }

                        .contact-form input,
                        .contact-form textarea {
                            width: 100%;
                            padding: 10px;
                            margin-bottom: 15px;
                            border: 1px solid #ccc;
                            border-radius: 5px;
                        }

                        .contact-form button {
                            background-color: #009688;
                            color: #fff;
                            padding: 12px 24px;
                            border: none;
                            border-radius: 6px;
                            cursor: pointer;
                        }

                        .contact-form button:hover {
                            background-color: #007a6d;
                        }

                        /* Styling for the location image container */
                        .location-image-container {
                            width: 100%;
                            margin-top: 20px;
                            display: flex;
                            justify-content: center;

                        }

                        .location-image {
                            max-width: 100%;
                            height: auto;
                        }

                        /* Styling for the "Contact Us" heading box */
                        .contact-heading {
                            background-color: #009688;
                            color: #fff;
                            padding: 20px;
                            border-radius: 10px 10px 0 0;
                            /* Rounded top corners */
                            text-align: center;
                            font-weight: bold;
                            font-size: 24px;
                        }

                        .center-container {
                            text-align: center
                        }

                        /* Center-align the form elements */
                        form {
                            display: inline-block;
                            /* Ensures the form is centered */
                            text-align: left;
                            /* Reset text alignment within the form */
                            max-width: 300px;
                            /* Limit the width of the form for better readability */
                            margin: 0 auto;
                            /* Center the form horizontally within the container */
                        }

                        /* Style the labels for better alignment */
                        label {
                            display: block;
                            /* Make labels appear on separate lines */
                            margin-bottom: 5px;
                            /* Add some vertical spacing between labels and inputs */
                        }

                        /* Style the text inputs */
                        input[type="text"] {
                            width: 100%;
                            /* Make the text inputs take up the full width of the form */
                            padding: 10px;
                            /* Add some padding for better visual spacing */
                            margin-bottom: 10px;
                            /* Add some vertical spacing between inputs */
                            border: 1px solid #ccc;
                            /* Add a border for better visual separation */
                            border-radius: 4px;
                            /* Add rounded corners */
                            box-sizing: border-box;
                            /* Include padding and border in the total width */
                        }

                        .login-now-button {
                            background-color: #386E70;
                            color: white;
                            padding: 10px 20px;
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 18px;
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
                                    <a href="#">Reservation</a>
                                    <ul>
                                        <li><a href="reservation.jsp">Book a Reservation</a></li>
                                        <li><a href="lookup.jsp">Reservation Look up</a></li>
                                        <li><a href="register.jsp">Create an Account</a></li>
                                    </ul>
                                </li>

                                <li class="login-button"><a href="login.jsp">Login</a></li>
                            </ul>
                        </div>

                    </nav>


                    <div class="center-container">

                        <h1>Reservation Summary</h1>

                        <!-- Display reservation details here -->
                        <p>Room Size: ${reserveSummary.roomSize}</p>
                        <p>Number of Guests: ${reserveSummary.numGuests}</p>
                        <p>Check-in Date: ${reserveSummary.inDate}</p>
                        <p>Check-out Date: ${reserveSummary.outDate}</p>
                        <p>Total Price: $${reserveSummary.price}</p>

                        <form action="/MoffatBay/summary" method="post">
                            <input type="hidden" name="roomSize" value="${reserveSummary.roomSize}">
                            <input type="hidden" name="numGuests" value="${reserveSummary.numGuests}">
                            <input type="hidden" name="inDate" value="${reserveSummary.inDate}">
                            <input type="hidden" name="outDate" value="${reserveSummary.outDate}">
                            <input type="hidden" name="price" value="${reserveSummary.price}">
                            <input type="hidden" name="roomNum" value="${reserveSummary.roomNum}">

                            <div class="container">
                                <input type="submit" name="submitButton" value="Submit Reservation"
                                    class="login-now-button">
                                <input type="submit" name="cancelButton" value="Cancel Reservation"
                                    class="login-now-button">
                            </div>
                        </form>

                        <div>
                            <c:if test="${not empty successfulReservationMessage}">
                                <h2>${successfulReservationMessage}</h2>
                            </c:if>
                        </div>


                    </div>


                    <br><br>
                    <img src="images/reservationImage.jpg" alt="Deck view of Bay">
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
                                    <li><a href="attractions.html">Check Out What We have to Offer!</a></li>
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