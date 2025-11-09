<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminPanel.aspx.vb" Inherits="project1.c_home1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Car Rental Management System - Admin Panel</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .wrapper {
            display: block;
            width: 1600px;
            margin: 0 auto;
        }

        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            padding: 20px;
            height: 900px;
            float: left;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
        }

        .sidebar ul li a:hover {
            background-color: #575757;
        }

        .content {
            width: 1400px;
            padding: 20px;
            float: left;
        }

        .clearfix {
            clear: both;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <ul>
                    <li><a href="Dashboard.aspx">Dashboard</a></li>
                    <li><a href="ManageCars.aspx">Manage Cars</a></li>
                    <li><a href="ManageRentals.aspx">Manage Rentals</a></li>
                    <li><a href="Reports.aspx">Reports</a></li>
                </ul>
            </div>
            <div class="content">
                <h1>Admin Panel</h1>
                <p>Welcome to the Car Rental Management System Admin Panel.</p>
                <h2>Dashboard</h2>
                <p>This is the dashboard where you can see an overview of the system.</p>
                <h2>Manage Cars</h2>
                <p>Here you can manage your car inventory.</p>
                <h2>Manage Rentals</h2>
                <p>Here you can manage rental bookings.</p>
                <h2>Reports</h2>
                <p>Here you can view reports.</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </form>
</body>
</html>
