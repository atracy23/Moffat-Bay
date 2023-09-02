<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.moffat.bay.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
     <link rel="stylesheet" type="text/css" href="/Moffat-Bay/example.css">
</head>
<body>
    <h1>Please enter your credentials to login</h1>


    <form action="/login" method="post">

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required><br>
        <label for="password">Password:</label>
        <input type="text" name="password" id="password" required><br>
        <input type="submit" value="Submit">
        
        <h3 style="color: red">${message}</h3>
        
    </form>


</body>
</html>
