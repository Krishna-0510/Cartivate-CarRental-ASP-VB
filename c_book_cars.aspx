<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_book_cars.aspx.vb" Inherits="project1.c_book_cars" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <style type="text/css">
 body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('background2jpg.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh; 
        }

        /* Navbar */
        .navbar {
            background-color: #f8f9fa;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 6px 20px;
            font-size: 25px;
        }

        .company-name {
            font-size: 2.5rem;
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

 

        /* Form container */
        .form-container {
            width: 60%;
            max-width: 900px;
            margin: 80px auto;
            padding: 40px;
            border-radius: 15px;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px );
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 30px;
            border-bottom: 3px solid #007BFF;
            padding-bottom: 15px;
        }

        /* Input styles */
        label {
            font-size: 1.1rem;
            font-weight: 600;
            color: #444;
        }

        .input-row {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 15px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:hover,
        input[type="number"]:hover,
        input[type="date"]:hover,
        select:hover {
            border-color: #007BFF;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
        }

        .checkbox-container {
            margin-bottom: 20px;
        }

        .checkbox-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            background-color: #f9f9f9;
        }

        /* Button styles */
        .button {
            display: block;
            width: 100%;
            max-width: 400px;
            margin: 30px auto;
            padding: 15px;
            background-color: #007BFF;
            color: white;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 15px rgba(0, 123, 255, 0.4);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                margin: 40px auto;
                padding: 20px;
            }

            .company-name {
                font-size: 2rem;
            }

            .navbar {
                font-size: 18px;
            }

            .input-row {
                flex-direction: column;
            }
        }

        @media (max-width: 576px) {
            .nav-links {
                display: block;
            }

            .admin-button {
                font-size: 1rem;
                padding: 8px 15px;
            }

            h2 {
                font-size: 2rem;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            select {
                padding: 10px;
                font-size: 0.9rem;
            }

            .button {
                max-width: 300px;
                font-size: 1rem;
                padding: 10px;
            }
        }
        label {
    font-size: 1.2rem;  /* Font size */
    font-weight: 750;   /* Font weight */
    color: #444;        /* Font color */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Font family */
    margin-bottom: 5px; /* Spacing below the label */
}
/* Input styles */
label {
    font-size: 1.1rem;
    font-weight: 600;
    color: #444;
}

.input-row {
    display: flex;
    gap: 20px;
    margin-bottom: 25px;
}

input[type="text"],
input[type="number"],
input[type="date"],
select {
    width: 100%;
    padding: 15px;
    border: 2px solid #ccc;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    margin-bottom: 25px; /* Added equal spacing after textboxes */
}

input[type="text"]:hover,
input[type="number"]:hover,
input[type="date"]:hover,
select:hover {
    border-color: #007BFF;
    box-shadow: 0 0  8px rgba(0, 123, 255, 0.4);
}


    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar">
            <div class="company-name">Cartivate</div>
            <ul class="nav-links">
                <li><a href="http://localhost:57770/c_home.aspx">Home</a></li>
                <li><a href="http://localhost:57770/c_home.aspx#abt">About</a></li>
                <li><a href="c_feedback.aspx">Contact</a></li>
            </ul>
            <button class="admin-button"><a href="c_admin_login.aspx">Admin</a></button>
        </div>

        <div class="form-container">
            <h2>Book Your Car</h2>
            <label for="txtFirstName">First Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label for="txtLastName">Last Name</label>
            <div class="input-row">
            
                <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" ReadOnly="true"></asp:TextBox>

                <!--<label for="txtLastName">Last Name</label>-->

                <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            </div>

            <label for ="txtMobile">Mobile Number</label>
            <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" placeholder="Mobile Number" ReadOnly="true"></asp:TextBox>
            <br />
            <label for="txtFrom">From Date</label>
            <asp:TextBox ID="txtFrom" runat="server" ReadOnly="true" placeholder="Select Date" ></asp:TextBox>

            <label for="txtTo">To Date</label>
            <asp:TextBox ID="txtTo" runat="server" ReadOnly="true" placeholder="Select Date"></asp:TextBox>

            <label for="txtRentalDuration">Rental Duration (days)</label>
            <asp:TextBox ID="txtRentalDuration" runat="server" placeholder="Rental Duration" ReadOnly="true"></asp:TextBox>

            <label for="ddlPickupLocation">Pickup Location</label>
            <asp:DropDownList ID="ddlPickupLocation" runat="server">
                <asp:ListItem Value="">Select Pickup Location</asp:ListItem>
                <asp:ListItem Value="Airport">Airport</asp:ListItem>
                <asp:ListItem Value="City Center">City Center</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>

            <label for="ddlDropoffLocation">Drop-off Location</label>
            <asp:DropDownList ID="ddlDropoffLocation" runat="server">
                <asp:ListItem Value="">Select Drop-off Location</asp:ListItem>
                <asp:ListItem Value="Airport">Airport</asp:ListItem>
                <asp:ListItem Value="City Center">City Center</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>

            <label for="chkAdditionalServices">Additional Services</label>
            <div class="checkbox-container">
                <asp:CheckBoxList ID="chkAdditionalServices" runat="server" CssClass="checkbox-list">
                    <asp:ListItem Value="Insurance Coverage">Insurance Coverage</asp:ListItem>
                    <asp:ListItem Value="Luggage Assistance">Luggage Assistance</asp:ListItem>
                    <asp:ListItem Value="AC">Air Conditioning</asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" CssClass="button" />
        </div>
    </form>
</body>
</html>