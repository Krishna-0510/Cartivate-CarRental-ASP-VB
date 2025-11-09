<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_home_book.aspx.vb" Inherits="project1.c_home_book" %>

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
            background-color: #f8f9fa;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 6px 20px;
            font-size: 25px;
        }

        .company-name {
            font-size: 3.0rem;
            margin-right: auto;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .nav-links li a {
            text-decoration: none;
            color: #333;
            margin-right:10px;
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
        }

        .admin-button:hover {
            background-color: #888996;
            color: #000;
        }

        .profile-dropdown {
            position: relative;
            display: inline-block;
        }

        .profile-icon {
            cursor: pointer;
            display: flex;
            align-items: center;
            background-color: #f1f1f1; /* Light grey background */
            padding: 10px; /* Padding inside the box */
            border: 1px solid #ccc; /* Light grey border */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for better visibility */
            transition: background-color 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
            
        }
        .profile-icon:hover {
    background-color: #e0e0e0; /* Darker grey background on hover */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* More pronounced shadow on hover */
}

        .profile-icon span {
            font-size: 1.5rem; /* Adjust the size of the profile icon */
            margin-right: 8px; /* Space between the icon and text */
        }

        .arrow {
            font-size: 1.5rem; /* Adjust the size of the arrow */
            margin-left: 10px; /* Space to the left of the arrow */
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f1f1f1;
            min-width: 200px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-family: 'Segoe UI', Tahoma;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        /*.profile-dropdown:hover .dropdown-content {
            display: block;
        }*/

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

        .display button {
            font-size: 25px;
            font-weight: bold;
            background-color: #5f68ea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .display button:hover {
            background-color: #1a27ec;
        }
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
        .display {
            margin: 200px;
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
        p {
            text-align: center;
            font-family: Courier New Baltic;
            font-size: 25px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
      <script type="text/javascript">
          function toggleDropdown() {
              var dropdown = document.querySelector('.dropdown-content');
              dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
          }

          // Close the dropdown if clicked outside
          window.onclick = function (event) {
              if (!event.target.matches('.profile-icon')) {
                  var dropdowns = document.getElementsByClassName("dropdown-content");
                  for (var i = 0; i < dropdowns.length; i++) {
                      var openDropdown = dropdowns[i];
                      if (openDropdown.style.display === 'block') {
                          openDropdown.style.display = 'none';
                      }
                  }
              }
          }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="navbar">
    <div class="company-name">Cartivate</div>
    <ul class="nav-links">
        <li><a href="c_home.aspx">Home</a></li>
        <li><a href="#abt">About</a></li>
        <li><a href="c_feedback.aspx">Contact</a></li>
    </ul>
    <!-- Profile Icon Dropdown -->
    <div class="profile-dropdown">
        <div class="profile-icon" onclick="toggleDropdown()">
            <span>&#128100;</span> <!-- Profile icon -->
            <asp:Literal ID="LiteralUsername" runat="server" /> <!-- Username will be displayed here -->
            <span class="arrow">&#9660;</span> <!-- Dropdown arrow -->
        </div>
        <div class="dropdown-content">
            <asp:LinkButton ID="lnkProfile" runat="server" OnClick="lnkProfile_Click">👤 My Profile</asp:LinkButton>
            <asp:LinkButton ID="lnkBookings" runat="server" OnClick="lnkBookings_Click">🪪 Bookings</asp:LinkButton>
            <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">📤 Logout</asp:LinkButton>
        </div>
    </div>
</div>

<div class="display">
            <h1>Welcome to Cartivate</h1>
            <button>Get Started</button>
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
         <asp:Button ID="btnLogin" runat="server" Text="BOOK" CssClass="submit"   onclick="btnLogin_Click" />
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
