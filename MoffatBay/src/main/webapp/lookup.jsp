<!-- Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <%@ page import="java.util.*" %>
        <%@ page import="java.text.SimpleDateFormat" %>
            <%@ page import="com.moffat.bay.model.UserBean" %>
                <%@ page import="com.moffat.bay.model.RegistrationBean" %>
                    <%@ page import="com.moffat.bay.model.ReservationBean" %>
                        <%@ page import="com.moffat.bay.controller.RegistrationServlet" %>
                            <%@ page import="com.moffat.bay.util.PasswordHash" %>
                                <%@ page import="javax.servlet.http.HttpServlet" %>
                                    <%@ page import="javax.servlet.http.HttpServletRequest" %>
                                        <%@ page import="javax.servlet.http.HttpServletResponse" %>
                                            <%@ page import="javax.servlet.http.HttpSession" %>

                                                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


                                                    <!DOCTYPE html>
                                                    <html>

                                                    <head>
                                                        <meta charset="UTF-8">
                                                        <meta name="viewport"
                                                            content="width=device-width, initial-scale=1">
                                                        <title>Look-Up Page</title>

                                                        <link rel="stylesheet"
                                                            href="/MoffatBay/com/WebContent/css/reservations.css" />
                                                        <link rel="stylesheet"
                                                            href="https://fonts.googleapis.com/css?family=Raleway">
                                                        <link rel="stylesheet"
                                                            href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

                                                        <link
                                                            href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
                                                            rel="stylesheet">
                                                        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
                                                        <script
                                                            src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


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

                                                            .button {
                                                                background-color: rgb(38, 165, 181);
                                                                color: white;
                                                                padding: 10px 20px;
                                                                border: none;
                                                                border-radius: 4px;
                                                                cursor: pointer;
                                                                font-size: 18px;
                                                                margin-top: 5px;
                                                                margin-bottom: 5px;
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
                                                                margin-bottom: 5px;
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
                                                                border: solid gray;
                                                                height: fit-content;
                                                                max-width: 350px;
                                                                padding: 5px 10px;
                                                                justify-content: center;
                                                                margin: auto;
                                                                display: flex;
                                                                align-items: center;
                                                                overflow: auto;
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

                                                            .grid-container {}

                                                            .sub_container {
                                                                height: fit-content;
                                                                padding: 10px 5px;
                                                                margin: auto;
                                                            }

                                                            .required {
                                                                bottom: 180px;
                                                                position: fixed;
                                                                left: 0;
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
                                                        </style>

                                                        <script>

                                                        </script>
                                                    </head>

                                                    <body>
                                                        <jsp:useBean id="reservation"
                                                            class="com.moffat.bay.model.ReservationBean" />

                                                        <nav>
                                                            <div class="navbar-container">
                                                                <h2 class="hotel-title">Moffat Bay</h2>
                                                                <ul class="navbar">
                                                                    <li><a href="index.jsp">Home</a></li>
                                                                    <li><a href="Aboutus.jsp">About Us</a></li>
                                                                    <li><a href="Attractions.jsp">Attractions</a> </li>

                                                                    <li>
                                                                        <a href="#">Reservation</a>
                                                                        <ul>
                                                                            <li><a href="reservation.jsp">Book a
                                                                                    Reservation</a></li>
                                                                            <li><a href="lookup.jsp">Reservation Look
                                                                                    up</a></li>
                                                                            <li><a href="registration.jsp">Create an
                                                                                    Account</a></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="login-button"><a
                                                                            href="login.jsp">Login</a></li>
                                                                </ul>
                                                            </div>

                                                        </nav>
                                                        <br>
                                                        <h1 style="text-align: center;">Reservation Look-Up Page</h1>
                                                        <br><br>

                                                        <div class="body-container">

                                                            <div class="container">
                                                                <div class="center-container">
                                                                    <form action="/MoffatBay/lookup" method="post">

                                                                        <c:if test="${current < 2 || roomSize == null}">
                                                                            <label for="reserveID"
                                                                                id="inputLabel">Please enter the
                                                                                Reservation ID or user email address to
                                                                                locate previous reservation
                                                                                information:</label>
                                                                            <input type="text" id="reserveID"
                                                                                name="reserveID" value="${id}" required>
                                                                            <input type="submit"
                                                                                style="justify-content: center;"
                                                                                id="reservationButton"
                                                                                name="ReservationButton"
                                                                                value="Get Reservation Information"
                                                                                class="button">
                                                                        </c:if>
                                                                    </form>
                                                                    <p style="max-width: 400px; color: red;">
                                                                        <b>${idErrorMessage}</b></p>
                                                                    <div class="grid-container">
                                                                        <c:if test="${roomSize!=null}">

                                                                            <label for="entries" id="blank"></label>
                                                                            <div id="entries">
                                                                                <c:out value="${current}" />
                                                                                <c:if test="${current!=null}"> of
                                                                                </c:if>
                                                                                <c:out value="${size}" />
                                                                            </div><br>

                                                                            <label for="roomSize" id="roomLabel"
                                                                                style="font-size: 18px;">Room
                                                                                Size:</label>
                                                                            <div id="roomSize">
                                                                                <c:out value="${roomSize}" />
                                                                            </div><br>

                                                                            <label for="numGuests" id="guestsLabel"
                                                                                style="font-size: 18px;">Number of
                                                                                Guests:</label>
                                                                            <div id="numGuests">
                                                                                <c:out value="${numGuests}" />
                                                                            </div><br>

                                                                            <label for="inDate" id="inDateLabel"
                                                                                style="font-size: 18px;">Check-in
                                                                                Date:</label>
                                                                            <div id="inDate">
                                                                                <c:out value="${inDate}" />
                                                                            </div><br>

                                                                            <label for="outDate" id="outDateLabel"
                                                                                style="font-size: 18px;">Check-out:</label>
                                                                            <div id="outDate">
                                                                                <c:out value="${outDate}" />
                                                                            </div>
                                                                        </c:if>
                                                                    </div>

                                                                    <form action="/MoffatBay/lookup" method="get">
                                                                        <input type="hidden" name="counter" id="counter"
                                                                            value="${counter}">

                                                                        <c:if test="${current > 1 && current <= size}">
                                                                            <input type="submit" id="backButton"
                                                                                value="Back" name="decrement"
                                                                                class="button">
                                                                        </c:if>
                                                                        <c:if test="${numGuests > 0 && current < size}">
                                                                            <input type="submit" id="nextButton"
                                                                                value="Next" name="increment"
                                                                                class="button">
                                                                        </c:if>
                                                                        <c:if test="${current > 0}">
                                                                            <input type="submit" id="clearButton"
                                                                                value="New Search" name="clear"
                                                                                class="button">
                                                                        </c:if>
                                                                    </form>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br><br>
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
                                                                        <li><a href="Aboutus.jsp">Discover the beauty of
                                                                                Moffat Bay Resort, where nature meets
                                                                                luxury.</a></li>
                                                                    </ul>


                                                                </div>
                                                                <div class="footer-section">
                                                                    <h3>Attractions</h3>
                                                                    <ul>
                                                                        <li><a href="Attractions.jsp">Check Out What We
                                                                                have to Offer!</a></li>

                                                                    </ul>
                                                                </div>
                                                                <div class="footer-section">
                                                                    <h3>Reservations</h3>
                                                                    <ul>
                                                                        <li><a href="reservation.jsp">Book Now</a></li>
                                                                        <li><a href="lookup.jsp">Reservation Look up</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="footer-section">
                                                                    <h3>Account</h3>
                                                                    <ul>
                                                                        <li><a href="login.jsp">Login</a></li>
                                                                        <li><a href="registration.jsp">Create an
                                                                                Account</a></li>
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                            <div class="footer-bottom">
                                                                <p>&copy; 2023 Moffat Bay Resort. All rights reserved.
                                                                </p>
                                                            </div>
                                                        </footer>

                                                    </body>

                                                    </html>