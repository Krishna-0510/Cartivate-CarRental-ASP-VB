    <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_home.aspx.vb" Inherits="project1.c_home" %>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Cartivate - Home</title>
        <style type="text/css">
            body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: url('background2jpg.jpg') no-repeat center center fixed;
                background-size: cover;
                min-height: 100vh;
            }

            .navbar {
                background-color: rgba(248, 249, 250, 0.9); /* 90% opaque */
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 20px; /* Increased padding for more height */
        font-size: 25px;
        position: fixed; /* Make it sticky */
        top: 0; /* Stick it to the top of the page */
        width: 98%; /* Ensure it spans the full width of the page */
        z-index: 1000; /* Ensure it stays above other content */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for better visibility */
        transition: padding 0.3s ease; /* Add transition for smooth height adjustment */
    }


            .company-name {
        font-size: 3.0rem;
        margin-right: auto;
        position: relative; /* Ensures the pseudo-element is positioned relative to the company name */
    }

    .company-name::before {
        content: "";
        position: absolute;
        bottom: -5px; /* Adjusts the position of the underline */
        left: 0;
        width: 0;
        height: 3px;
        background-color: #5f68ea; /* You can customize the underline color */
        transition: width 0.4s ease-in-out; /* Controls the speed of the underline animation */
    }

    .company-name:hover::before {
        width: 100%; /* Expands the underline to full width on hover */
    }

            .nav-links {
                list-style: none;
                display: flex;
                gap: 20px;
            }

            .nav-links li a {
                text-decoration: none;
                color: #333;
            }

            .nav-links li a:hover {
                color: black;
                font-weight: bold;
            }

            .admin-button {
        background-color: #d5d5df;
        color: #af76ff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        margin-left: 20px;
        font-size: 1.2rem;
        font-weight: bold;
        border-radius: 5px;
    }

    .admin-button a {
        text-decoration: none;
        color: inherit; /* Keeps the button text color */
    }

    .admin-button:hover {
        background-color: #888996;
        color: #000;
        transition: background-color 0.3s ease;
    }

 

            .display {
                margin: 200px;
                padding-top:80px;
                height: 150px;
                text-align: center;
                color: white;
            }

            .display button {
                font-size: 25px;
                font-weight: bold;
                background-color: #5f68ea;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                padding: 10px 20px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            }

            .display button:hover {
                background-color: #1a27ec;
            }

            .product-container {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                grid-gap: 20px;
                padding: 20px;
                box-sizing: border-box;
                background-color: rgba(255, 255, 255, 0.9);
                margin-bottom: 20px;
            }

            .product-card {
                background-color: white;
                border-radius: 10px;
                padding: 20px;
                margin: 10px;
                text-align: center;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                cursor: pointer;
            }

            .product-card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

            .product-card img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                border-radius: 10px;
            }

            .product-card h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .product-card p {
                font-size: 18px;
                margin-bottom: 20px;
            }

            .product-button {
                padding: 10px 20px;
                background-color: #0099cc;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .product-button:hover {
                background-color: #0077b3;
            }

            .footer {
                background-color: #fff;
                color: white;
                padding: 20px;
                text-align: center;
                clear: both;
                margin-top: -15px;
            }

            .footer ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .footer ul li {
                display: inline-block;
                margin-right: 20px;
            }

            .footer ul li a {
                color: black;
                text-decoration: none;
            }
            .footer p {
                color: black;
            }
            .footer ul li a:hover {
                color: #ccc;
            }

            /* Styles for the "About Us" section */
            .container {
                display: flex;
                height: 100vh;
                padding: 0px 30px 5px 30px;
            }

            .image-container {
                width: 40%;
                background-image: url("abt.jpg"); 
                background-size: cover;
            }

            .text-container {
                width: 60%;
                background-color: #f1f1f1;
                padding: 20px;
                display: flex; 
                flex-direction: column;
                justify-content: center;
                align-items: center; 
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            p {
                text-align: center;
                font-family: Courier New Baltic;
                font-size: 25px;
            }
            h2 {
                color: white;
            }
        
            /* Updated red-log CSS */
            .red-log {
                background: #ffffff;
                border-radius: 12px;
                padding: 30px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                margin: 40px auto;
                max-width: 900px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: relative;
                border-left: 6px solid #5f68ea; /* Accent color */
                height: 100px; /* Adjusted height */
            }

            .red-log:hover {
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            }

            .red-log .label {
                font-size: 1.1rem;
                color: #333;
                font-weight: 500;
                margin-right: 20px;
            }

            .red-log .date-input {
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 1rem;
                width: 180px;
                margin: 0 15px;
                background-color: #fafafa;
            }

            .red-log .date-input:focus {
                border-color: #5f68ea;
                background-color: #fff;
            }

            .red-log .submit {
                padding: 12px 30px;
                font-size: 1.1rem;
                background-color: #5f68ea;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-weight: 500;
            }

            .red-log .submit:hover {
                background-color: #4a54d1;
            }
            .display {
        margin: 200px;  
        height: 150px;
        text-align: center;
        color: white;
        animation: fadeInFromBottom 2s ease-in-out;
    }

    @keyframes fadeInFromBottom {
        0% {
            opacity: 0;
            transform: translateY(100%);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

        </style>
        <script type="text/javascript">
            function validateDateInputs() {
                var fromDate = document.getElementById('<%= txtFrom.ClientID %>').value;
                var toDate = document.getElementById('<%= txtTo.ClientID %>').value;

                if (fromDate === "" || toDate === "") {
                    alert("Please fill both 'From' and 'To' dates before logging in.");
                    return false;
                }
                return true;
            } 
        </script>

    </head>
    <body>
        <form id="form1" runat="server">
            <div class="navbar">
                <div class="company-name">Cartivate </div>
                <ul class="nav-links">
                    <li><a href="#">Home</a></li>
                    <li><a href="#abt" id="aboutLink">About Us</a></li>
                    <li><a href="c_feedback.aspx">Contact</a></li>
                </ul>
                <button class="admin-button"><a href="c_login.aspx">Login</a></button>
                <button class="admin-button"><a href="c_admin_login.aspx">Admin</a></button>
                        
            </div>
            <div class="display">
                <h1>Welcome to Cartivate</h1>
                <button id="getStartedBtn" type="button">Get Started</button>
            </div>
            <div class="container" id="abt">
                <div class="image-container"></div>
                <div class="text-container">
                    <h1>ABOUT US</h1>
                    <p>
                       We, CARTIVATE company situated at area, city, state, have a profound understanding of our consumers travel needs and preferences. We aim to offer individuals as well as corporate a wide range of cars on hire. We have well maintained & luxurious cars which help to make your travel comfortable and pleasing. We are passionate & professional at the same time which help us deliver outstanding services to our clients. Get in touch with us to get the best travel solution.
                    </p>
                </div>
            </div>
        
           <div class="red-log" id="redlog">
        <asp:Label ID="lblFrom" runat="server" AssociatedControlID="txtFrom" Text="From:" CssClass="label" />
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" CssClass="date-input" />
    
        <asp:Label ID="lblTo" runat="server" AssociatedControlID="txtTo" Text="To:" CssClass="label" />
        <asp:TextBox ID="txtTo" runat="server" TextMode="Date" CssClass="date-input" />
    
        <asp:Button ID="btnLogin" runat="server" Text="Book" CssClass="submit" OnClick="btnLogin_Click" />
    
        <!-- Label to display the error message -->
        <asp:Label ID="lblError" runat="server" CssClass="error-message" ForeColor="Red" Visible="False" />
    </div>


            <div class="footer">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#abt">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <p>&copy; 2024 Cartivate. All rights reserved.</p>
            </div>
        </form>
    </body>
    </html>
    <script type="text/javascript">
        window.onload = function () {
            // Get today's date in yyyy-mm-dd format
            var today = new Date().toISOString().split('T')[0];

            // Set the minimum date for both date inputs to today's date
            document.getElementById('<%= txtFrom.ClientID %>').setAttribute('min', today);
            document.getElementById('<%= txtTo.ClientID %>').setAttribute('min', today);

            // Attach an event listener to the From date input to adjust the To date input
            document.getElementById('<%= txtFrom.ClientID %>').addEventListener('change', function () {
                var fromDate = this.value; // Get the selected from date
                // Set the min attribute of the To date input to the selected from date
                document.getElementById('<%= txtTo.ClientID %>').setAttribute('min', fromDate);
            });
        }
        document.getElementById('getStartedBtn').addEventListener('click', function () {
            // Scroll to the red-log div smoothly
            document.getElementById('redlog').scrollIntoView({ behavior: 'smooth' });
        });
        document.getElementById('aboutLink').addEventListener('click', function (e) {
            e.preventDefault(); // Prevent the default anchor behavior
            document.getElementById('abt').scrollIntoView({ behavior: 'smooth' });
        });
        var navbar = document.querySelector('.navbar');
        var originalPadding = '20px'; // Original padding for the navbar
        var reducedPadding = '15px'; // Reduced padding when scrolling down

        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) { // Change 50 to your desired scroll distance
                navbar.style.padding = reducedPadding; // Change to reduced padding
            } else {
                navbar.style.padding = originalPadding; // Reset to original padding
            }
        });

    </script>