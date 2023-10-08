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

                <jsp:useBean id="ReservationBean" class="com.moffat.bay.model.ReservationBean" scope="session" />

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="ISO-8859-1">
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link rel="stylesheet" href="/MoffatBay/com/WebContent/css/reservations.css" />
                    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
                    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

                    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
                    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
                    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
                    <title>About Us</title>
                    <style>
                        /* Reset some default styles */
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: 'Raleway', sans-serif;
                            /* Apply Raleway font to all text */
                        }

                        html {
                            position: relative;
                            min-height: 100%;
                        }

                        /* Global styles */
                        body {
                            background-color: #f0f0f0;
                            display: flex;
                            flex-direction: column;
                            min-height: 100vh;
                        }

                        .body-container {
                            min-height: 100%;
                            display: flex;
                            flex-direction: column;
                        }

                        /* Global styles */
                        /*        body {
            background-color: #f0f0f0; */
                        /* Lighter background color */
                        /*            margin-bottom: 200px;
        }
*/
                        p {
                            font-size: 18px;
                            font-family: 'Raleway', sans-serif;
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
                            margin-bottom: 10px;
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

                        label {
                            display: block;
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

                        .input-container input {
                            border: none;
                            box-sizing: border-box;
                            outline: 0;
                            padding: .75rem;
                            position: relative;
                            width: 100%
                        }

                        .container {

                            height: fit-content;
                            width: fit-content;
                            padding: 5px 10px;
                            justify-content: space-around;
                            margin: auto;
                            margin-top: 10px;
                            overflow: auto;
                            border-radius: 4px;
                        }

                        .form-container {
                            height: fit-content;
                            width: fit-content;
                            padding: 20px 20px;
                            justify-content: space-around;
                            margin: auto;
                        }

                        .grid-container>div {
                            text-align: center, padding: 20px 0;
                            font-size: 20px;
                        }

                        .grid-container {
                            display: grid;
                            grid-template-columns: 25% 25% 25% 25%);
                            grid-template-rows: auto auto auto auto auto auto;
                            gap: 10px;
                            padding: 5px;
                        }

                        .sub_container {
                            height: fit-content;
                            padding: 10px 5px;
                            margin: auto;
                        }

                        .Hero img {
                            border-radius: 4px;
                            content: center;
                        }

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
                    </style>


                </head>

                <body>

                    <nav>
                        <div class="navbar-container">
                            <h2 class="hotel-title">Moffat Bay</h2>
                            <ul class="navbar">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="Aboutus.jsp">About</a></li>
                                <li><a href="#">Attractions</a> </li>

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


                    <div class="center-container">

                        <h1>Reservation Summary</h1>

                        <ul class="breadcrumb">
                            <li><a href="registration.jsp">Registration</a></li>
                            <li><a href="login.jsp">LogIn</a></li>
                            <li><a href="reservation.jsp">Reservation</a></li>
                            <li>Reservation Summary</li>
                        </ul>
                        <br><br>

                        <!-- Display reservation details here -->
                        <!-- 		    <p>Room Size: ${reserveSummary.roomSize}</p>
		    <p>Number of Guests: ${reserveSummary.numGuests}</p>
		    <p>Check-in Date: ${reserveSummary.inDate}</p>
		    <p>Check-out Date: ${reserveSummary.outDate}</p>
		    <p>Total Price: $${reserveSummary.price}</p>
 -->
                        <p>Room Size:</p>
                        <p> ${reserveSummary.roomSize}</p><br>
                        <p>Number of Guests:</p>
                        <p> ${reserveSummary.numGuests}</p><br>
                        <p>Check-in Date:</p>
                        <p> ${reserveSummary.inDate}</p><br>
                        <p>Check-out Date:</p>
                        <p> ${reserveSummary.outDate}</p><br>
                        <p>Total Price:</p>
                        <p> $${reserveSummary.price}</p><br>

                        <form action="/MoffatBay/summary" method="post">
                            <input type="hidden" name="roomSize" value="${reserveSummary.roomSize}">
                            <input type="hidden" name="numGuests" value="${reserveSummary.numGuests}">
                            <input type="hidden" name="inDate" value="${reserveSummary.inDate}">
                            <input type="hidden" name="outDate" value="${reserveSummary.outDate}">
                            <input type="hidden" name="price" value="${reserveSummary.price}">
                            <input type="hidden" name="roomNum" value="${reserveSummary.roomNum}">

                            <div class="container">
                                <input type="submit" name="submitButton" value="Submit Reservation" class="button">
                                <input type="submit" name="cancelButton" value="Cancel Reservation" class="button">
                            </div>
                        </form>
                        <br>
                        <div>
                            <c:if test="${not empty successfulReservationMessage}">
                                <h2>${successfulReservationMessage}</h2>
                            </c:if>
                        </div>


                    </div>

                    <div class="center-container">
                        <div class="Hero img">
                            <img src="Landing_images/Moffatbayresort.jpg" alt="Deck view of Bay">
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
                                    <li><a href="Aboutus.jsp">Discover the beauty of Moffat Bay Resort, where nature
                                            meets
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