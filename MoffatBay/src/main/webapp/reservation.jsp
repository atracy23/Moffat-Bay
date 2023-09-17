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
	<%@ page import="java.util.Date" %>
		<%@ page import="java.text.SimpleDateFormat" %>
			<%@ page import="com.moffat.bay.model.UserBean" %>
				<%@ page import="com.moffat.bay.model.RegistrationBean" %>
					<%@ page import="com.moffat.bay.controller.RegistrationServlet" %>
						<%@ page import="javax.servlet.http.HttpServlet" %>
							<%@ page import="javax.servlet.http.HttpServletRequest" %>
								<%@ page import="javax.servlet.http.HttpServletResponse" %>
									<%@ page import="javax.servlet.http.HttpSession" %>

										<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


											<!DOCTYPE html>
											<html>

											<head>
												<meta charset="UTF-8">
												<meta name="viewport" content="width=device-width, initial-scale=1">
												<title>Reservation</title>

												<link rel="stylesheet"
													href="/MoffatBay/com/WebContent/css/reservations.css" />

												<link rel="stylesheet"
													href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

												<link
													href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
													rel="stylesheet">
												<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
												<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
												<!-- Javascript -->
												<script>
													$(function () {
														$("#datepick-1").datepicker({
															//appendText:"(yy-mm-dd)",  
															dateFormat: "yy-mm-dd",
															altField: "#datepick-2",
															altFormat: "MM dd, yy"
														});
													});
													$(function () {
														$("#datepick-3").datepicker({
															//appendText:"(yy-mm-dd)",  
															dateFormat: "yy-mm-dd",
															altField: "#datepick-4",
															altFormat: "MM dd, yy"
														});
													});

													function hideError() {
														document.getElementById("error_message").style.display = "none";
													}
													/*
															 HttpSession session = request.getSession(false);
															 String numGuestsStr = (String) session.getAttribute("numGuestsStr");
															 String roomSize = (String) session.getAttribute("roomSize");
															 String inDateStr = (String) session.getAttribute("inDateStr");
															 String outDateStr = (String) session.getAttribute("outDateStr");
													*/
												</script>

												<style>
													h1 {
														text-align: center;
														font-weight: bold;
													}

													img {
														height: 200px;
														width: auto;
													}

													ul.breadcrumb {
														padding: 10px 16px;
														list-style: none;
														background-color: #eee;
													}

													ul.breadcrumb li {
														display: inline;
														font-size: 18px;
													}

													ul.breadcrumb li+li:before {
														padding: 8px;
														color: rgb(38, 165, 181);
														content: "/\00a0";
													}

													ul.breadcrumb li a {
														color: rgb(38, 165, 181);
														text-decoration: none;
													}

													ul.breadcrumb li a:hover {
														color: rgb(38, 165, 181);
														text-decoration: underline;
													}

													.breadcrumb {
														display: flex;
														justify-content: center;
														width: 100%;
													}

													.container {
														border: solid gray;
														height: fit-content;
														width: fit-content;
														padding: 5px 10px;
														justify-content: center;
														margin: auto;
														background-color: #eee;
													}

													.form_container {
														height: fit-content;
														width: fit-content;
														padding: 50px 100px;
														justify-content: center;
														margin: auto;
													}

													.sub_container {
														height: fit-content;
														padding: 10px 5px;
														margin: auto;
													}

													.header {
														text-align: center;
														border: solid gray;
														width: 100%;
														height: 50px;
														background-color: white;
													}

													.footer {
														text-align: center;
														border: solid gray;
														width: 100%;
														height: 50px;
														position: fixed;
														right: 0;
														left: 0;
														bottom: 0;
														background-color: white;
													}

													#message {
														display: none;
														color: #000;
														position: relative;
														padding: 20px;
														margin-top: 10px;
													}

													#message p {
														padding: 10px 35px;
														font-size: 18px;
													}

													.required {
														bottom: 100px;
													}

													input[type="date"]::webkit-calendar-picker-indicator {
														background: transparent;
														bottom: 0;
														color: transparent;
														cursor: pointer;
														height: auto;
														left: 0;
														position: absolute;
														right: 0;
														top: 0;
														width: auto;
													}

													.input-container input {
														border: none;
														box-sizing: border-box;
														outline: 0;
														padding: .75rem;
														position: relative;
														width: 100%
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


													.center-container {
														text-align: center
													}

													/* button styles */
													.button {
														margin-right: 0;
													}

													.button a {
														color: white;
														text-decoration: none;
														padding: 10px 20px;
														border: 2px solid rgb(38, 165, 181);
														border-radius: 4px;
														transition: background-color 0.3s ease-in-out, border-color 0.3s ease-in-out;
													}

													.button a:hover {
														background-color: rgb(38, 165, 181);
														color: #333;
														border-color: transparent;
													}


													.now-button {
														background-color: rgb(38, 165, 181);
														color: white;
														padding: 10px 20px;
														border: none;
														border-radius: 4px;
														cursor: pointer;
														font-size: 18px;
													}

													.now-button:hover {
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
															<li><a href="#">About</a></li>
															<li><a href="#">Attractions</a> </li>

															<li>
																<a href="reservation.jsp">Reservation</a>
																<ul>
																	<li><a href="reservation.jsp">Book a Reservation</a>
																	</li>
																	<li><a href="#">Reservation Look up</a></li>
																	<li><a href="registration.jsp">Create an Account</a>
																	</li>
																</ul>
															</li>
															<li><a href="#">Contact</a></li>
															<li class="login-button"><a href="login.jsp">Login</a></li>
														</ul>
													</div>

												</nav>
												<h1>Reservation Page</h1>
												<ul class="breadcrumb">
													<li><a href="registration.jsp"><b>Registration</b></a></li>
													<li><a href="login.jsp"><b>LogIn</b></a></li>
													<li><b>Reservation</b></li>
													<li><a href="summary.jsp"><b>Reservation Summary</b></a></li>
												</ul>
												<br><br>

												<%System.out.println("entered jsp");%>

													<form action="/MoffatBay/reservation" method="post">

														<div class="center-container">
															<div class="container">
																<div class="form-container">
																	<div class="sub_container">
																		<!-- numGuests Form -->
																		<div class="sub_container"
																			style="float:left; padding:12px 0 25px 25px;">
																			<label for="numGuests"
																				data-success="">Select the number of
																				guests:* </label>
																			<select style="display: table-cell;"
																				id="numGuests" name="numGuests"
																				value="${numGuestsStr}" required>
																				<option value=""> </option>
																				<option value="1">1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																			</select>
																		</div>
																		<!-- roomSize Form -->
																		<div class="sub_container" style="float:right;">
																			<label for="roomSize">Select room
																				size:*</label>
																			<select id="roomSize" name="roomSize"
																				value="${roomSize}" required>
																				<option value=""> </option>
																				<option value="double_full">Double Full
																					Beds (Guests 1-4)</option>
																				<option value="queen">Queen Bed (Guests
																					1-2))</option>
																				<option value="double_queen">Double
																					Queen Beds (Guests 1-5)</option>
																				<option value="king">King Bed (Guests
																					1-3)</option>
																			</select>
																			<h3 style="color: red">${roomSizeError}</h3>
																		</div>
																		<br><br>
																		<!-- Check-in Form -->
																		<div class="sub_container" style="float:left;">
																			<p>Select your Check-in Date: <input
																					type="text" id="datepick-1"
																					name="inDate" value="${inDateStr}"
																					onclick="hideError()"></p>
																			<p>Your Check-in Date: <input type="text"
																					id="datepick-2" size="35"></p>
																		</div>
																		<!-- Check-out Form -->
																		<div class="sub_container" style="float:right;">
																			<p>Select your Check-out Date: <input
																					type="text" id="datepick-3"
																					name="outDate" value="${outDateStr}"
																					onclick="hideError()"></p>
																			<p>Your Check-out Date: <input type="text"
																					id="datepick-4" size="35"></p>
																		</div>
																		<br>
																		<div class="sub_container"
																			style="margin-top: 100px; width: 500px; height: 50px; justify-content: center;">
																			<h3 id="error_message"
																				style="color: red; text-align: center;">
																				${dateError}</h3>
																		</div>
																	</div>
																	<h3 id="error" style="color: red">${noAvailability}
																	</h3>
																	<br>
																	<div class="container" style="border: none;">
																		<div class="sub_container">
																			<input type="submit"
																				value="Check Availability"
																				class="now-button">
																			<%System.out.println("sent to Servlet");%>
																		</div>
																	</div>

																</div>
															</div>
														</div>
													</form>
													<div class="container"
														style="border: none; background-color: #4444;">
														<h3 style="color: red">${userIDError}</h3>
													</div>


													<div class="sub_container" style="bottom: 0; left: 0;">
														* indicates required field
													</div>
													<br>
													<footer>
														<div class="footer-content">
															<div class="footer-section">
																<h3>About Us</h3>
																<p>Discover the beauty of Moffat Bay Resort, where
																	nature meets luxury.</p>
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
																	<li><a href="registration.jsp">Create an Account</a>
																	</li>
																</ul>
															</div>
														</div>
														<div class="footer-bottom">
															<p>&copy; 2023 Moffat Bay Resort. All rights reserved.</p>
														</div>
													</footer>

											</body>

											</html>