<!-- Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.moffat.bay.model.UserBean"%>
<%@ page import="com.moffat.bay.model.RegistrationBean"%>
<%@ page import="com.moffat.bay.controller.RegistrationServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Reservation</title>
	
	<link rel="stylesheet" href="/MoffatBay/com/WebContent/css/reservations.css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	
	<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">  
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>  
      <!-- Javascript -->  
      <script>  
         $(function() {  
            $( "#datepick-1" ).datepicker({  
               //appendText:"(yy-mm-dd)",  
               dateFormat:"yy-mm-dd",  
               //altField: "#datepick-2",  
               //altFormat: "MM dd, yy"  
            });  
         });  
         $(function() {  
         	$( "#datepick-3" ).datepicker({  
            	 //appendText:"(yy-mm-dd)",  
             	dateFormat:"yy-mm-dd",  
             	//altField: "#datepick-4",  
             	//altFormat: "MM dd, yy"  
          	});  
       	});  
        
         function hideError(){
        	 document.getElementById("error_message").style.display="none";
         }
         
         console.log(select.options[select.selectedIndex].value);
 
      </script>  
	
	<style>
 	
		/* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Raleway', sans-serif; /* Apply Raleway font to all text */
        }

        /* Global styles */
        body {
            background-color: #f0f0f0; /* Lighter background color */
        }

        /* Navigation bar styles */
        ul.navbar {
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #26a5b5; /* Teal navbar color */
            display: flex; /* Add flex display for positioning elements */
            align-items: center; /* Vertically center elements */
        }

        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: #26a5b5; /* Teal navbar color */
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            width: 100%; /* Make the navbar full-width */
        }

        /* Add a new div for the logo and image */
        .logo {
            display: flex;
            align-items: center;
        }

        /* Style the logo image */
        .logo img {
            width: 40px; /* Adjust the width as needed */
            height: 40px; /* Adjust the height as needed */
            margin-right: 10px; /* Add spacing between the logo and text */
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
            padding: 5px 10px; /* Add padding for better visual appearance */
        }

  		ul.navbar li.active a {
            border: 2px solid white; /* Add a white outline for the active link */
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
        ul.breadcrumb{
    	padding: 10px 16px; 
    	list-style: none; 
    	background-color: #26a5b5;
    	}
    	
    	ul.breadcrumb li{
    	display: inline; 
    	font-size: 18px;
    	}
    	
    	ul.breadcrumb li+li:before{
    	padding: 8px; 
    	color: white; 
    	content: "/\00a0";
    	}
    	
    	ul.breadcrumb li a{
    	color: white; 
    	text-decoration: none;
    	}
    	
    	ul.breadcrumb li a:hover{
    	color: #01447e; 
    	text-decoration: underline;
    	}
    	
    	.breadcrumb{
    	display: flex; 
    	justify-content: center; 
    	width: 100%;
    	}
    	
    	.button{
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
            margin-top: 20px; /* Add spacing at the top */
            margin-bottom: 1px; /* Add spacing at the bottom */
        }

        label {
            display: block;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px; /* Add more spacing below text inputs */
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: 'Raleway', sans-serif; /* Apply Raleway font to text inputs */
        }
        
        .input-container input{
        border: none; 
        box-sizing: border-box; 
        outline: 0; 
        padding: .75rem; 
        position: relative; 
        width: 100%
        }
        
        .container{
        border: solid gray; 
        height: fit-content; 
        width: fit-content; 
        padding: 5px 10px; 
        justify-content: space-around; 
        margin: auto; 
        overflow: auto;
        }
        
    	.form-container{
    	height: fit-content; 
    	width: fit-content; 
    	padding: 20px 20px; 
    	justify-content: space-around; 
    	margin: auto;
    	}
    	
    	.grid-container >div{
    	text-align: center, padding: 20px 0; 
    	font-size: 20px;
    	}
    	
    	.grid-container{
    	display: grid; 
    	grid-template-columns: 25% 25% 25% 25%); 
    	grid-template-rows: auto auto auto auto auto auto; 
    	gap: 10px; 
    	padding: 5px;
    	}
    	
    	.item1{
    	grid-column: 1/3; 
    	grid-row: 1;
    	}
    	
    	.item2{
    	grid-column: 3/span 2; 
    	grid-row: 1;
    	}
    	
    	.item3{
    	grid-column: 1/span 4; 
    	grid-row: 2;
    	}
    	
    	.item4{
    	grid-column: 1/3; 
    	grid-row: 3;
    	}
    	
    	.item5{
    	grid-column: 3/span 2; 
    	grid-row: 3;
    	}
    	
    	.item8{
    	grid-column: 2/4; 
    	grid-row: 6;
    	}
    	
    	.item6{
    	grid-column: 1/span 4; 
    	grid-row: 4;
    	max-width: 800px;
    	}
    	
    	.item7{
    	grid-column: 1/span 4; 
    	grid-row: 4;
    	}
    	
    	.sub_container{
    	height: fit-content; 
    	padding: 10px 5px; 
    	margin: auto;
    	}
    	
    	.required{bottom: 50px;}
    	
        /* Footer styles */
        footer {
            background-color: #26a5b5; /* Teal background color */
            color: white;
            width: 100%;
            height: 175px;
            position: fixed;
            bottom: 0;
            padding: 30px 0;
            margin-top: 20px; /* Add spacing at the top */
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
            text-align: center; /* Center text within each div */
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
            margin-top: 20px; /* Add spacing at the top */
            padding-top: 10px;
            border-top: 1px solid #555;
        }

        .footer-bottom p {
            font-size: 12px;
        }

        /* Adjust font size for the login header */
        .login-header {
            font-size: 18px; /* Change the font size as needed */
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
	                <a href="reservation.jsp">Reservation</a>
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
    <br>
	<h1 style="text-align: center;">Reservation Page</h1>
	<br>
	<ul class="breadcrumb">
		<li><a href="registration.jsp"><b>Registration</b></a></li>
		<li><a href="login.jsp"><b>LogIn</b></a></li>
		<li><b>Reservation</b></li>
		<li><a href="summary.jsp"><b>Reservation Summary</b></a></li>
	</ul>

	<br><br>
	
<div class="body_container" style="overflow-y: auto;">
	<form action="/MoffatBay/reservation" method="post">
	
		<div class="center-container" style="content-align: center;">
  			<div class="container">
  				<div class="form-container">
  					<div class="grid-container">
<!-- numGuests Form -->  
  						<div class="item1">
    						<label for="numGuests" data-success="">Select the number of guests:*  </label>
								<select style="display: table-cell;" id="numGuests" name="numGuests" required>
									<option value=""> </option>
									<option value="1" ${param.numGuests == '1' ? 'selected' : '' }>1</option>
									<option value="2" ${param.numGuests == '2' ? 'selected' : '' }>2</option>
									<option value="3" ${param.numGuests == '3' ? 'selected' : '' }>3</option>
									<option value="4" ${param.numGuests == '4' ? 'selected' : '' }>4</option>
									<option value="5" ${param.numGuests == '5' ? 'selected' : '' }>5</option>
								</select>
						</div>
<!-- roomSize Form -->						
						<div class="item2">
							<label for="roomSize">Select room size:*</label>
      							<select id="roomSize" name="roomSize" value="${param.roomSize}" required>
      								<option value=""> </option>
									<option value="Double Full" ${param.roomSize == 'Double Full' ? 'selected' : '' }>Double Full Beds (Guests 1-4)</option>
									<option value="Queen" ${param.roomSize == 'Queen' ? 'selected' : '' }>Queen Bed (Guests 1-2))</option>
									<option value="Double Queen" ${param.roomSize == 'Double Queen' ? 'selected' : '' }>Double Queen Beds (Guests 1-5)</option>
									<option value="King" ${param.roomSize == 'King' ? 'selected' : '' }>King Bed (Guests 1-3)</option>
								</select>
							
						</div>
						<c:if test="${roomSizeError!=null}">
						<div class="item3"> 
						<h3 style="color: red; font-size: medium;">${roomSizeError}</h3>
						</div>
						</c:if>
<!-- Check-in Form -->
					<div class="item4">
  						<p>Select your Check-in Date:* <input type="text" id="datepick-1" name="inDate" value="${param.inDate}" onchange="hideError()" required></p>
  					</div>
<!-- Check-out Form -->
  					<div class="item5">
			 			<p>Select your Check-out Date:* <input type="text" id="datepick-3" name="outDate" value="${param.outDate}" onchange="hideError()" required></p>
  					</div>
  					<c:if test="${dateError!=null}">
  					<div class="item6">
  					<h3 id="error_message" style="color: red; font-size: medium;">${dateError}</h3>
  					</div>
  					</c:if>
				
				<c:if test="${noAvailableRooms!=null}">
				<div class="item6">		
					<h3 id="error_message" style="color: red; font-size: medium; content: flex;">${noAvailableRooms}</h3>
				</div>
				</c:if>
				</div>
				<div class="item8">
					<input type="submit" value="Check Availability" class="button">
				</div>
				</div>
				</div>
			</div>	
	</form>
	<div class="required" >
		* indicates required field
	</div>
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