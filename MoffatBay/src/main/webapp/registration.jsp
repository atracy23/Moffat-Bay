<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Registration Page</title>
	<style>
		body{background-color: silver;}
    	h1{text-align: center; text: bold;}
    	img{height: 200px; width: auto;}
    	.required{margin-top: 100px; padding: 10px; float: left; color: darkblue; position: fixed; bottom: 50px;}
    	ul.breadcrumb{padding: 10px 16px; list-style: none; background-color: #eee;}
    	ul.breadcrumb li{display: inline; font-size: 18px;}
    	ul.breadcrumb li+li:before{padding: 8px; color: darkblue; content: "/\00a0";}
    	ul.breadcrumb li a{color: #0275d8; text-decoration: none;}
    	ul.breadcrumb li a:hover{color: #01447e; text-decoration: underline;}
    	.breadcrumb{display: flex; justify-content: center; width: 100%;}
    	button{background-color: darkblue; color: white; width: fit-content; margin-left: 33%; margin-top: 50px}
    	.container{border: solid gray; height: fit-content; width: fit-content; padding: 5px 10px; justify-content: center; margin: auto; background-color: cornflowerblue; color: white;}
    	.form_container{height: fit-content; width: fit-content; padding: 50px 100px; justify-content: center; margin: auto;}
    	.sub_container{height: fit-content; padding: 10px 50px; justify-content: center; margin: auto;}
    	.header{text-align: center; border: solid gray; width: 100%; height: 50px; background-color: white;}
    	.footer{text-align: center; border: solid gray; width: 100%; height: 50px; position: fixed; bottom: 0; background-color: white;}
    	.error_message{color: white}
    </style>
    
</head>
<body>
	<div class="header">Header placed here</div>
	<h1>Registration Page</h1>
	<ul class="breadcrumb">
		<li>Registration</li>
		<li><a href="http://localhost:7070/MoffatBay/login.jsp">LogIn</a></li>
		<li><a href="http://localhost:7070/MoffatBay/reservation.jsp">Reservation</a></li>
		<li><a href="#">Reservation Summary</a></li>
	</ul>
	<br><br>
	
	<form action="/MoffatBay/register" method="post">
		<div class="container">
		
			<div class="form_container">
			
				<label for="firstName">Enter your first name:*</label><br>
				<input type="text" id="firstName" name="firstName" required><br><br>
				
				<label for="lastName">Enter your last name:*</label><br>
				<input type="text" id="lastName" name="lastName" required><br><br>
				
				<label for="phoneNum">Enter your phone number:*</label><br>
				<input type="tel" id="phoneNum" name="phoneNum" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required><br><br>
		
				<label for="email">Enter your email address:*</label><br>
				<input type="text" id="email" name="email" required><br><br>
			
				<label for="password">Create a password:*</label><br>
				<input type="password" name="password" id="password" required><br><br>
		
				<label for="confirmPassword">Please confirm password:*</label><br>
				<input type="password" id="confirmPassword" name="confirmPassword" required><br><br>
		
			
			
				<input  type="checkbox" id="rememberMe" name="rememberMe" value="checked" style="margin-left: 5px;">
				<label for="rememberMe">Remember Me</label>
			
				<input type="submit" value="Sign Up" style="float: right; margin-right: 50px" ><br><br>
		</div>
		</div>	
	</form>
	
	<br><br>
	
	<div class="container">
		<div class="sub_container">
			<p>Already have an account? <a href="http://localhost:7070/MoffatBay/login.jsp"> Login</a></p>
		</div>
	</div>
	
	<div class="container" style="background-color: red;">
		<div class="error_message">
			<%= request.getAttribute("message") %>
		</div>
	</div>
	
	<div class="required">
		* indicates required field
	</div>
	
	<br>
	
	<div class="footer">Footer placed here</div>
	
</body>
</html>