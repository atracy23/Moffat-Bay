<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        /* Reset some default styles */
        body,
        h1,
        h2,
        h3,
        p,
        ul,
        li {
            margin: 0;
            padding: 0;
        }

        /* Global styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            line-height: 1.6;
        }

        container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;

        }

        /* Header styles */
        header {
            background-color: #386E70;
            color: #fff;
            padding: 15px 0;
        }

        .hotel-title {
            font-family: 'Jim Nightshade', cursive;
            font-size: 40px;
            text-align: center;
            margin: 0;
        }

        /* Navigation styles */
        nav {
            background-color: #386E70;
            border-top: 3px solid #959FD6;
        }

        .navbar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px 0;

        }

        .navbar {
            list-style: none;
            display: flex;
        }

        .navbar li {
            margin-right: 20px;
            position: relative;

        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
            padding: 10px;

        }

        .navbar a:hover {
            color: #959FD6;
        }

        /* Dropdown styles */
        .navbar li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #386E70;
            padding: 0;
            z-index: 1;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            transition: opacity 0.3s ease-in-out;
        }

        .navbar li:hover ul {
            display: block;
            opacity: 1;
        }

        .navbar li ul li {
            display: block;
            width: 100%;
            margin: 0;
        }

        .navbar li ul li a {
            color: white;
            padding: 10px;
            display: block;
            text-decoration: none;
            transition: background-color 0.3s ease-in-out;
        }

        .navbar li ul li a:hover {
            background-color: #698F9E;
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

        /* Footer styles */
        footer {
            background-color: #386E70;
            color: #fff;
            padding: 30px 0;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .footer-section {
            width: 25%;
            padding: 0 15px;
            box-sizing: border-box;
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
            color: #fff;
            text-decoration: none;
        }

        .footer-section ul li a:hover {
            color: #959FD6;
        }

        .footer-bottom {
            margin-top: 20px;
            padding-top: 10px;
            border-top: 3px solid #959FD6;
        }

        .footer-bottom p {
            font-size: 12px;
        }
    </style>
</head>
<body>
 <header>
        
            <h1 class="hotel-title">Moffat Bay</h1>
       
    </header>
    <nav>

        <div class="navbar-container">
            <ul class="navbar">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="Aboutus.jsp">About</a></li>
                <li><a href="#">Attractions</a></li>
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

    <div class="about">
        <h2 class="about-title">About Us</h2>
        <h3 class="slogan">Discover the beauty of Moffat Bay Resort, where nature meets luxury.</h3>
        <p>Moffat Bay Lodge is your haven of tranquility nestled on the breathtaking Joviedsa Island. Situated
            amidst
            the pristine beauty of nature, Moffat Bay Lodge offers a unique and unforgettable getaway experience for
            those seeking a harmonious blend of relaxation, adventure, and serenity. At Moffat Bay Lodge, we believe
            in
            the magic of nature and the power it has to rejuvenate the soul. Our lodge was founded with a passion
            for
            preserving the untouched beauty of Joviedsa Island and sharing it with the world. Our journey began with
            a
            vision to create a sanctuary where guests could escape the demands of everyday life and reconnect with
            nature's wonders.

            Nestled along the shores of the crystal-clear Moffat Bay, our lodge boasts unparalleled views of the
            azure
            waters and lush landscapes that define Joviedsa Island. The island's rich biodiversity, from its dense
            forests to its vibrant marine life, provides an exquisite backdrop for an array of outdoor activities
            and
            exploration. Moffat Bay Lodge offers a range of thoughtfully designed accommodations, each crafted to
            blend
            seamlessly with the natural surroundings while providing modern comforts. From cozy cabins tucked away
            in
            the woods to luxurious suites overlooking the bay, every stay promises a restful and inspiring
            experience.
            We are committed to preserving the pristine beauty of Joviedsa Island for generations to come. Moffat
            Bay
            Lodge is dedicated to sustainable practices that minimize our impact on the environment. We actively
            engage
            with local communities to support conservation efforts and promote responsible tourism.

        </p>
    </div>
    <div class="container">
        <div class="timeline">
            <div class="event" data-year="2000">
                <h3>Year 2000</h3>
                <p>Voted Best Stay in Washington.</p>
            </div>
            <div class="event" data-year="2010">
                <h3>Year 2010</h3>
                <p>Voted Best Whale watching in North America.</p>
            </div>
            <div class="event" data-year="2015">
                <h3>Year 2016</h3>
                <p>Voted Best Stay in America</p>
            </div>
            <div class="event" data-year="2022">
                <h3>Year 2022</h3>
                <p>Forbes Magazine 5 Star Rating</p>
            </div>
        </div>
        <div class="picture">
            <img src="landing_images/Moffatbayresort.jpg" alt="resort">
        </div>
    </div>

    <div class="timeline-controls">
        <button id="prevYear">Previous Year</button>
        <button id="nextYear">Next Year</button>
    </div>
    <div class="contact-heading">
        Contact Us
    </div>

    <!-- Container for the Contact Form -->
    <div class="contact-location-container">
        <!-- Contact Form Container -->
        <div id="notification" class="notification"></div>
        <div class="contact-form-container">
            <div class="contact-form">
                <form>
                    <label for="first_name">First Name:</label>
                    <input type="text" id="first_name" name="first_name" required>

                    <label for="last_name">Last Name:</label>
                    <input type="text" id="last_name" name="last_name" required>

                    <label for="email">Your Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="message">Message:</label>
                    <textarea id="message" name="message" rows="6" required></textarea>

                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <div class="location-image-container">
        <div class="location-image">
            <img src="Landing_images/aboutusmap.PNG" alt="Location Image">
        </div>
    </div>
    <script>
        // script for the timeline
        document.addEventListener("DOMContentLoaded", function () {
            const events = document.querySelectorAll(".event");
            let currentEventIndex = 0;

            // Show the initial event
            events[currentEventIndex].style.display = "block";

            // Event listener for the "Next Year" button
            document.getElementById("nextYear").addEventListener("click", function () {
                events[currentEventIndex].style.display = "none";
                currentEventIndex = (currentEventIndex + 1) % events.length;
                events[currentEventIndex].style.display = "block";
            });

            // Event listener for the "Previous Year" button
            document.getElementById("prevYear").addEventListener("click", function () {
                events[currentEventIndex].style.display = "none";
                currentEventIndex = (currentEventIndex - 1 + events.length) % events.length;
                events[currentEventIndex].style.display = "block";
            });
        });
        // Function to show a notification
        function showNotification(message, isError = false) {
            const notification = document.getElementById("notification");
            notification.textContent = message;

            if (isError) {
                notification.style.backgroundColor = "#ff6b6b"; // Red background for error
            } else {
                notification.style.backgroundColor = "#4CAF50"; // Green background for success
            }

            // Show the notification for 3 seconds
            setTimeout(function () {
                notification.textContent = "";
            }, 3000);
        }

        // Event listener for form submission
        const contactForm = document.querySelector(".contact-form");
        contactForm.addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent the form from submitting

            // Get form field values
            const firstName = document.getElementById("first_name").value;
            const lastName = document.getElementById("last_name").value;
            const email = document.getElementById("email").value;
            const message = document.getElementById("message").value;

            // Check if any field is empty
            if (!firstName || !lastName || !email || !message) {
                showNotification("Please fill out all fields.", true);
                return; // Do not proceed with submission
            }

            // Simulate form submission (replace this with actual submission logic)
            // For demonstration purposes, we'll show a success message
            showNotification("Message sent successfully!");
        });
    </script>


    <footer>

        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <ul>
                    <li><a href="Aboutus.jsp">Discover the beauty of Moffat Bay Resort, where nature meets luxury.</a></li>
                </ul>
                <p>10 Moffat Bay,
                    Joviedsa,
                    WA 98250</p>
                <p>info@moffatbay.com</p>
                <p>223-445-0678</p>

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