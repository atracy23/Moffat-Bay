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
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="home_css.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">

            <link href="https://fonts.googleapis.com/css2?family=Inria+Serif&family=Jim+Nightshade&display=swap"
                rel="stylesheet">
            <title>Moffat Bay</title>

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


                /* Hero part of the landing page */
                .Hero img {
                    width: 100%;
                    height: 750px;
                    display: block;
                }

                .image-text-container {
                    position: absolute;
                    top: 50%;
                    left: 300px;
                    transform: translateY(-50%);
                    color: white;
                    font-size: 34px;
                    font-weight: bold;
                }

                .image-text2 {
                    position: absolute;
                    top: 58%;
                    left: 400px;
                    transform: translateY(-50%);
                    color: white;
                    font-size: 34px;
                    font-weight: bold;
                }

                .image-text3 {
                    position: absolute;
                    top: 65%;
                    left: 440px;
                    transform: translateY(-50%);
                    color: white;
                    font-size: 34px;
                    font-weight: bold;
                }

                .text-line {
                    margin: 0;
                    line-height: 1.2;

                }

                .book-now-button {
                    position: absolute;
                    bottom: 200px;
                    right: 300px;
                    background-color: rgb(38, 165, 181);
                    color: white;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    font-size: 18px;
                }

                .book-now-button:hover {
                    color: #f39c12;
                }

                /* transition box one*/
                .resort-container {
                    position: relative;
                    width: 100%;
                    margin: 0 auto;
                    margin-top: -80px;
                    /* Negative margin to move the container up by its height */
                    background-color: #26a5b5;
                    padding: 20px;
                    z-index: 1;
                    /* Ensure it's above the image */
                }

                .dream-stay {
                    color: white;
                }

                /*Resort img */
                .Resort-image img {
                    width: 100%;
                    height: 750px;
                    display: block;
                }

                /*Activties transiton box*/

                .active-container {
                    position: relative;
                    width: 100%;
                    margin: 0 auto;
                    margin-bottom: -80px;
                    /* Negative margin to move the container up by its height */
                    background-color: #26a5b5;
                    padding: 20px;
                    z-index: 1;
                    /* Ensure it's above the image */
                }

                .active {
                    color: white;
                }

                /*Whale-image*/
                .Whale-image img {
                    width: 100%;
                    height: 750px;
                    display: block;
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
                        <li><a href="#">Home</a></li>
                        <li><a href="Aboutus.jsp">About</a></li>
                        <li><a href="#">Attractions</a> </li>

                        <li>
                            <a href="#">Reservation</a>
                            <ul>
                                <li><a href="reservation.jsp">Book a Reservation</a></li>
                                <li><a href="#">Reservation Look up</a></li>
                                <li><a href="registration.jsp">Create an Account</a></li>
                            </ul>
                        </li>

                        <li class="login-button"><a href="login.jsp">Login</a></li>
                    </ul>
                </div>

            </nav>
            <div>
                <c:if test="${not empty successfulLoginMessage}">
                    <h2>${successfulLoginMessage}</h2>
                </c:if>
            </div>

            <div class="Hero">

                <img src="Landing_images/MountGrantWithBaker.jpg" alt="Image from the San Juan Islands">
                <div class="image-text-container">
                    <p class="text-line">A Breath</p>
                </div>
                <div class="image-text2">
                    <p class="text-line">Of</p>
                </div>
                <div class="image-text3">
                    <p class="text-line">Fresh Air...</p>
                </div>
                <button class="book-now-button">Book Now</button>
            </div>

            <div class="resort-container">

                <p class="dream-stay">Your dream stay at Moffat Bay promises more than just a vacation; it's an
                    immersive
                    journey into a world where mountains meet the ocean in an embrace of natural splendor. Let the
                    serenity
                    of
                    Moffat Bay soothe your senses and rejuvenate your spirit. Embark on this transcendent experience
                    today
                    and
                    surrender to the allure of nature's masterpiece.</p>

            </div>

            <div class="Resort-image">
                <img src="Landing_images/Moffatbayresort.jpg" alt="View from our pool">

            </div>
            <div class="active-container">
                <p class="active">Indulge in the ultimate getaway at Moffat Bay, where nature's finest offerings
                    converge in perfect harmony. Nestled between majestic mountains and the tranquil embrace of the
                    ocean, Moffat Bay promises an enchanting escape that seamlessly blends the allure of both worlds.
                </p>
            </div>

            <div class="Whale-image">
                <img src="<%=request.getContextPath()%>/Landing_images/whale-watching-tour-san-juan-islands.jpg"
                    alt="View from Whale Watching">

            </div>


            <footer>
                <div class="footer-content">
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