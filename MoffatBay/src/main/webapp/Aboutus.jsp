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
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap"
                        rel="stylesheet">
                    <title>About Us</title>
                    <style>
                        /* Reset some default styles */
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                        }

                        /* Apply Raleway font to all text */
                        body,
                        h2,
                        h3,
                        p,
                        label,
                        input,
                        a {
                            font-family: 'Raleway', sans-serif;
                        }

                        /* Global styles */
                        body {
                            background-color: #f0f0f0;
                        }

                        /* Navigation bar styles */
                        ul.navbar {
                            list-style: none;
                            padding: 0;
                            margin: 0;
                            background-color: #26a5b5;
                            display: flex;
                            align-items: center;
                        }

                        .navbar-container {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            padding: 15px 20px;
                            background-color: #26a5b5;
                            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                            width: 100%;
                        }

                        /* div for the logo and image */
                        .logo {
                            display: flex;
                            align-items: center;
                        }

                        /* Style the logo image */
                        .logo img {
                            width: 40px;
                            height: 40px;
                            margin-right: 10px;
                        }

                        /* Style the "Moffat Bay" text */
                        .hotel-title {
                            color: white;
                            margin: 0;
                            font-size: 34px;
                            padding: 8px;
                        }

                        .hotel-title {
                            font-weight: normal;
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
                        }

                        ul.navbar li.active a {
                            border: 2px solid white;
                            background-color: #26a5b5;
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
                        .center-container {
                            text-align: center;
                            margin-top: 20px;
                            margin-bottom: 20px;
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
                        }

                        input[type="text"],
                        input[type="password"] {
                            width: 100%;
                            padding: 10px;
                            margin-bottom: 15px;
                            border: 1px solid #ccc;
                            border-radius: 4px;
                            box-sizing: border-box;
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
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 18px;
                            margin-top: 15px;
                        }

                        .login-now-button:hover {
                            color: #f39c12;
                        }

                        /* Footer styles */
                        footer {
                            background-color: #26a5b5;
                            color: white;
                            padding: 30px 0;
                            margin-top: 20px;
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
                            padding-top: 10px;
                            border-top: 1px solid #555;
                        }

                        .footer-bottom p {
                            font-size: 12px;
                        }

                        /* Adjust font size for the login header */
                        .login-header {
                            font-size: 18px;
                        }

                        /* Image container styles */
                        .image-container {
                            width: 100%;
                        }

                        .image-container img {
                            max-width: 20%;
                            float: left;
                            margin-right: 20px;
                        }

                        .image-container p {
                            margin: 0;
                        }

                        .about-title {
                            text-align: center;
                        }

                        /* Contact form styles */
                        .contact-form {
                            text-align: center;
                            margin-top: 20px;
                        }

                        .contact-form h2 {
                            font-size: 24px;
                        }

                        .contact-form form {
                            max-width: 400px;
                            margin: 0 auto;
                        }

                        .contact-form label,
                        .contact-form input,
                        .contact-form textarea,
                        .contact-form button {
                            display: block;
                            margin-bottom: 10px;
                            width: 100%;
                        }

                        .success-message {
                            text-align: center;
                            display: none;
                            background-color: #4CAF50;
                            color: white;
                            padding: 10px;
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
                                <li class="active"><a href="Aboutus.jsp">About</a></li>
                                <li><a href="#">Attractions</a></li>
                                <li>
                                    <a href="#">Reservation</a>
                                    <ul>
                                        <li><a href="reservation.jsp">Book a Reservation</a></li>
                                        <li><a href="#">Reservation Look up</a></li>
                                        <li><a href="register.jsp">Create an Account</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Contact</a></li>
                                <li class="login-button"><a href="login.jsp">Login</a></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="about">
                        <h2 class="about-title">About Us</h2>
                        <br>
                        <h3 class="slogan">Discover the beauty of Moffat Bay Resort, where nature meets luxury.</h3>
                        <br>
                        <p>Moffat Bay Resort is your haven of tranquility nestled on the breathtaking Joviedsa Island.
                            Situated
                            amidst the pristine beauty of nature, Moffat Bay Resort offers a unique and unforgettable
                            getaway experience for
                            those seeking a harmonious blend of relaxation, adventure, and serenity. At Moffat Bay
                            Resort, we believe
                            in the magic of nature and the power it has to rejuvenate the soul. Our lodge was founded
                            with a passion
                            for preserving the untouched beauty of Joviedsa Island and sharing it with the world. Our
                            journey began with
                            a vision to create a sanctuary where guests could escape the demands of everyday life and
                            reconnect with
                            nature's wonders.
                            <br>
                            <br>
                            Nestled along the shores of the crystal-clear Moffat Bay, our resort boasts unparalleled
                            views of the
                            azure waters and lush landscapes that define Joviedsa Island. The island's rich
                            biodiversity, from its dense
                            forests to its vibrant marine life, provides an exquisite backdrop for an array of outdoor
                            activities
                            and exploration. Moffat Bay Lodge offers a range of thoughtfully designed accommodations,
                            each crafted to
                            blend seamlessly with the natural surroundings while providing modern comforts. From cozy
                            cabins tucked away
                            in the woods to luxurious suites overlooking the bay, every stay promises a restful and
                            inspiring
                            experience.
                            We are committed to preserving the pristine beauty of Joviedsa Island for generations to
                            come. Moffat
                            Bay Resort is dedicated to sustainable practices that minimize our impact on the
                            environment. We actively
                            engage with local communities to support conservation efforts and promote responsible
                            tourism.
                        </p>
                    </div>
                    <div class="image-container">
                        <br>
                        <img src="Landing_images/hotelOwner.jpg" alt="resort">
                        <p>
                            Aria Kahale is a visionary entrepreneur and advocate for sustainable tourism in Joviedsa
                            Island, where she owns the luxurious Moffat Bay Resort. Her journey as the resort owner is a
                            testament to her deep connection to the Joviedsa island and her commitment to preserving
                            it's natural beauty.
                            <br><br>
                            Born and raised on Sipha, Aria developed a profound love for Joviedsa Island's unique
                            ecosystems early in life. She studied environmental science at the University of San Juan
                            Islands and earned a master's degree in sustainable tourism management. Prior to acquiring
                            Moffat Bay Resort in 2010, Aria dedicated herself to conservation efforts, working with
                            various organizations to protect San Juan Island's fragile ecosystems. Her belief in the
                            power of education to inspire change led her to create eco-tourism programs, allowing
                            visitors to experience Joviedsa Island's natural wonders while learning about conservation.
                            <br><br>
                            In 2010, under her leadership, the resort was built as an eco-friendly luxury destination,
                            featuring sustainable practices like solar power, water recycling, and organic landscaping.
                            Today, it attracts eco-conscious travelers seeking relaxation and environmental
                            responsibility.
                            <br><br>
                            Aria Kahale's journey from a San Juan Islands upbringing to becoming a respected advocate
                            for sustainable tourism reflects her dedication to preserving Joviedsa Island's natural
                            treasures. Her commitment to environmental awareness and conservation ensures that the
                            islands remain a pristine sanctuary for future generations. As both a successful resort
                            owner and a passionate steward of Joviedsa Island's beauty, Aria has earned admiration
                            locally and globally within the tourism industry.
                        </p>
                    </div>

                    <!-- Contact form -->
                    <div class="contact-form">
                        <h2>Contact Us</h2>
                        <form id="contact-form">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>

                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>

                            <label for="message">Message:</label>
                            <textarea id="message" name="message" rows="4" required></textarea>

                            <button type="submit">Submit</button>
                        </form>
                    </div>

                    <!-- Success message -->
                    <div class="success-message" style="display:none;">
                        Your message has been sent successfully!
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

                    <script>
                        // JavaScript to handle the contact form submission
                        document.getElementById("contact-form").addEventListener("submit", function (e) {
                            e.preventDefault();
                            //show success message
                            document.querySelector(".success-message").style.display = "block";
                        });
                    </script>
                </body>

                </html>