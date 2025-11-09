    <%@ Page Title="" Language="vb" AutoEventWireup="false" CodeBehind="c_cars.aspx.vb" Inherits="project1.c_cars" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Vehicles - Cartivate</title>
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

 

.container {
    max-width: 1200px; /* Maximum width for the container */
    margin: 200px auto; /* Center the container with space on both sides */
    padding: 20px;
    background-color: #fff; /* Added white background for better contrast */
    border-radius: 15px; /* Rounded corners */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); /* Soft shadow */
}

.image-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns per row */
    gap: 30px;
    justify-content: center;
    padding: 20px 0;
}

.vehicle-item {
    background-color: #f7f7f7;
    border-radius: 15px; /* Increase corner radius for a more modern look */
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Enhanced shadow for depth */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column; /* Ensure image and info stack correctly */
}

.vehicle-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Stronger hover effect */
}

.vehicle-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-bottom: 1px solid #ddd;
}

.vehicle-info {
    padding: 20px;
    text-align: center;
}

.vehicle-info h3 {
    font-size: 1.6rem; /* Increase font size */
    color: #333;
    margin: 0;
    margin-bottom: 15px;
}

.vehicle-info p {
    font-size: 1.1rem; /* Slightly larger for better readability */
    color: #666;
    margin: 5px 0;
}

.vehicle-info .price {
    font-weight: bold;
    color: #007BFF;
}

.styled-button {
    background-color: #007BFF; /* Primary blue background */
    color: white; /* White text */
    border: none; /* Remove border */
    padding: 12px 25px; /* Add padding */
    text-align: center; /* Center text */
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Inline display for alignment */
    font-size: 1.2rem; /* Increase font size */
    cursor: pointer; /* Pointer cursor on hover */
    border-radius: 5px; /* Rounded corners */
    transition: all 0.3s ease; /* Smooth transition */
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

/* Hover effect */
.styled-button:hover {
    background-color: #0056b3; /* Darker blue on hover */
    box-shadow: 0 7px 15px rgba(0, 0, 0, 0.2); /* Increase shadow on hover */
    transform: translateY(-3px); /* Slight lift on hover */
}

/* Focused and active button state */
.styled-button:active {
    background-color: #004085; /* Even darker blue on active */
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1); /* Lower shadow on click */
    transform: translateY(0); /* Return to original position */
}

/* Profile Dropdown */
.profile-dropdown {
    position: relative;
    display: inline-block;
    margin-left: 30px;
}

.profile-icon {
    cursor: pointer;
    display: flex;
    align-items: center;
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 5px;
    transition: background-color 0.3s, box-shadow 0.3s;
}

.profile-icon:hover {
    background-color: #e0e0e0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.profile-icon span {
    font-size: 1.5rem;
    margin-right: 8px;
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
}

.dropdown-content a:hover {
    background-color: #ddd;
}
 h1 {
            text-align: center;
            margin-bottom: 20px;
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


        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="navbar">
                <div class="company-name">
                    Cartivate
                </div>
                <ul class="nav-links">
                    <li><a href="c_home.aspx">Home</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="c_feedback.aspx">Contact</a></li>
                </ul>
                
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
        
            <div class="container">
                <h2>Vehicles</h2>
                <div class="image-container">
                   <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="vehicle-item">
                            <asp:Image ID="Image1" runat="server" CssClass="vehicle-image" ImageUrl='<%# Eval("image_path") %>' />
                            <div class="vehicle-info">
                                <h3><asp:Label ID="Label1" runat="server" Text='<%# Eval("manu") %>'></asp:Label></h3>
                                <p><asp:Label ID="Label2" runat="server" Text='<%# Eval("model") %>'></asp:Label></p>
                                <p><asp:Label ID="Label3" runat="server" Text='<%# Eval("year") %>'></asp:Label></p>
                                <p><asp:Label ID="Label4" runat="server" Text='<%# Eval("color") %>'></asp:Label></p>
                                <p><asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
                                <center><p><asp:Button ID="btnbook" CssClass="styled-button" runat="server" Text="Book Now" CommandArgument='<%# Eval("car_id") %>' OnClick="btnbook_Click" />
</center>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
            </div>
              <div class="footer">
            <ul>
                <li><a href="c_home.aspx">Home</a></li>
                <li><a href="c_home.aspx#abt">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <p>&copy; 2024 Cartivate. All rights reserved.</p>
        </div>
        </form>
    </body>
    </html>
    <script type="text/javascript">
        function toggleDropdown() {
            var dropdownContent = document.querySelector(".dropdown-content");
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        }

        // Close the dropdown if clicked outside
        window.onclick = function (event) {
            if (!event.target.matches('.profile-icon')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.style.display === "block") {
                        openDropdown.style.display = "none";
                    }
                }
            }
        }
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
