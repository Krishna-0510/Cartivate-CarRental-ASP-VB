<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_bookings.aspx.vb" Inherits="project1.c_bookings" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Bookings</title>
    <style type="text/css">
         body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: rgb(240, 248, 255);
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
                text-decoration: none;
                position: relative;
                display: inline-block;
                padding-bottom: 2px;
                background-image: linear-gradient(to right, #333 0%, #333 100%);
                background-position: 0% 100%;
                background-size: 0% 2px;
                background-repeat: no-repeat;
                transition: background-size 0.4s ease;
            }

            .company-name:hover {
                background-size: 100% 2px;
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
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .admin-button:hover {
            background-color: #888996;
            color: #fff;
        }

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

        .content {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            margin: 50px auto;
            max-width: 1200px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .message {
            font-size: 18px;
            margin-bottom: 20px;
            color: #555;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }

        .gridview th {
            background-color: #4CAF50;
            color: white;
            padding: 14px;
            text-align: left;
            text-transform: uppercase;
            font-weight: bold;
        }

        .gridview td {
            background-color: #fff;
            color: #333;
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:hover td {
            background-color: #f9f9f9;
            color: #000;
        }

        .gridview tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        @media (max-width: 768px) {
            .gridview, .gridview th, .gridview td {
                font-size: 14px;
                padding: 8px;
            }

            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        .footer {
            background-color: #f8f9fa;
            color: #333;
            padding: 20px;
            text-align: center;
            margin-top: 20px;
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
            color: #333;
            text-decoration: none;
        }

        .footer ul li a:hover {
            color: #4CAF50;
        }

        .footer p {
            margin-top: 10px;
            color: #555;
        }

        .show-bill-link {
            text-decoration: none;
            color: #337ab7;
        }

        .show-bill-link:hover {
            color: #23527c;
        }
        .show-bill-link {
    display: inline-flex;
    align-items: center;
    padding: 8px 12px;
    background-color: #4CAF50; /* Green background */
    color: white;
    border-radius: 5px; /* Rounded corners */
    text-decoration: none;
    transition: background-color 0.3s, transform 0.2s; /* Smooth transitions */
    font-weight: bold;
}

.show-bill-link:hover {
    background-color: #45a049; /* Darker green on hover */
    transform: scale(1.05); /* Slightly increase size on hover */
}

.bill-icon {
    margin-right: 5px; /* Space between icon and text */
    font-size: 1.2rem; /* Slightly larger icon */
}
    
    </style>
    <script type="text/javascript">
        function toggleDropdown() {
            var dropdown = document.querySelector('.dropdown-content');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        }

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
        <!-- Navbar -->
        <div class="navbar">
            <div class="company-name">Cartivate</div>
            <ul class="nav-links">
                <li><a href="c_home.aspx">Home</a></li>
                <li><a href="c_home.aspx#abt">About</a></li>
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
                    <asp:LinkButton ID="lnkBookings" runat="server" OnClick="lnkBookings_Click">📃 Bookings</asp:LinkButton>
                    <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">📤 Logout</asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="content">
            <h2>My Bookings</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            <div class="booking-container">
                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="rental_id" HeaderText="Rental ID" />
                        <asp:BoundField DataField="first_name" HeaderText="First Name" />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                        <asp:BoundField DataField="mobile_number" HeaderText="Mobile Number" />
                        <asp:BoundField DataField="from_date" HeaderText="From Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="to_date" HeaderText="To Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="rental_duration" HeaderText="Duration (Days)" />
                        <asp:BoundField DataField="pickup_location" HeaderText="Pickup Location" />
                        <asp:BoundField DataField="dropoff_loaction" HeaderText="Dropoff Location" />
                        <asp:BoundField DataField="addition_servives" HeaderText="Additional Services" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        
                        <asp:TemplateField HeaderText="Show Bill">
                            <ItemTemplate>
                                 <%# Eval("ShowBill") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
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
