<!-- Green Team MoffatBay Lodge Project
	 Bellevue University
	 October 2023
	 Professor Sue Sampson
	 Team members:	Ron Stewart
					Rashmi Sathiyanarayanan
					Joseph Youskievicz
					Angie Tracy
 -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="home_css.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
    <title>Moffat Bay</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Raleway', sans-serif;
        }

        body {
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

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

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
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

        .hotel-title {
            color: white;
            margin: 0;
            font-size: 34px;
            font-weight: bold;
            padding: 8px;
        }

        h1,
        h4 {
            text-align: center;
            text-decoration: underline black;
            margin-bottom: 5px;
        }

        footer {
            background-color: #26a5b5;
            /* Teal background color */
            color: white;
            padding: 30px 0;
            margin-top: 20px;
            text-align: center;
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

        .attraction-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
            background-color: #f5f5f5;
        }

        .attraction-card {
            width: 80%;
            max-width: 600px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 10px 18px 18px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s;
            margin-bottom: 20px;
            display: none;
            background-color: #fff;
        }

        .attraction-card:first-child {
            display: block;
        }

        .attraction-card img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .attraction-card p {
            padding: 15px;
            font-size: 16px;
            color: #333;
            text-align: justify;
        }

        .navigation-arrows {
            text-align: center;
        }

        .prev-button,
        .next-button {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .prev-button:hover,
        .next-button:hover {
            background-color: #555;
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
                <li class="active"><a href="#">Attractions</a></li>
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
    <h1 style="margin-top: 20px;">Attractions</h1>
    <div class="attraction-container">
        <div class="attraction-card">
            <img src="Landing_images/stock-photo-hiking-in-the-mountains.jpg" alt="Attraction 1">
            <h4>Hiking</h4>
            <p>Embark on a journey of discovery as you traverse the pristine landscapes of Joviedsa Island. From
                leisurely strolls to more challenging treks, each path unveils a new facet of the island's beauty.</p>
        </div>

        <div class="attraction-card">
            <img src="Landing_images/kayak-sparks-lake-wanderlust.jfif" alt="Attraction 2">
            <h4>Kayaking</h4>
            <p>Explore the tranquil waters surrounding Joviedsa Island with our exhilarating kayaking adventures. Glide
                through crystal-clear bays, hidden coves, and picturesque inlets as you embrace the serenity of the sea.
            </p>
        </div>

        <div class="attraction-card">
            <img src="Landing_images/whale-watching-tour-san-juan-islands.jpg" alt="Attraction 3">
            <h4>Whale Watching</h4>
            <p>Experience the mesmerizing boat excursion to witness the whales as they migrate through the waters. Feel
                the thrill as you spot humpback whales playing in their natural habitat, creating memories for the
                lifetime.</p>
        </div>

        <div class="attraction-card">
            <img src="Landing_images/WE0466-D-brandon_cole.webp" alt="Attraction 4">
            <h4>Diving</h4>
            <p>Dive into a world of wonder beneath the waves with our scuba diving experiences. Discover the vibrant
                coral reefs and marine ecosystems. Our certified instructors will guide you through underwater
                landscapes</p>
        </div>
    </div>

    <div class="navigation-arrows">
        <button class="prev-button" onclick="changeAttraction(-1)">&#10094; Prev</button>
        <button class="next-button" onclick="changeAttraction(1)">Next &#10095;</button>
    </div>
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
                    <li><a href="Aboutus.jsp">Discover the beauty of Moffat Bay Resort, where nature meets
                            luxury.</a></li>
                </ul>


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
    <script>
        let currentAttractionIndex = 0;
        const attractions = document.querySelectorAll(".attraction-card");

        function changeAttraction(n) {
            attractions[currentAttractionIndex].style.display = "none";
            currentAttractionIndex += n;

            if (currentAttractionIndex >= attractions.length) {
                currentAttractionIndex = 0;
            } else if (currentAttractionIndex < 0) {
                currentAttractionIndex = attractions.length - 1;
            }

            attractions[currentAttractionIndex].style.display = "block";
        }

        changeAttraction(0);
    </script>
</body>

</html>