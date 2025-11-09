<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contact Us</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #fff;
            background: #333 url('background2jpg.jpg') no-repeat center center fixed;
            height: 100%;
            width: 100%;
        }

        .navbar {
            background-color: rgba(248, 249, 250, 0.9);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 20px;
            font-size: 25px;
            position: fixed;
            top: 0;
            width: 98%;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: padding 0.3s ease;
        }

        .company-name {
            font-size: 3.0rem;
            color: black;
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
            color: black;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .admin-button:hover {
            background-color: #b1ebf4;
            color: #000;
        }

        .login-container {
            width: 400px;
            margin: 70px auto;
            padding: 20px 30px;
            background-color: #222;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #444;
            background-color: #333;
            color: #fff;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        .login-button {
            width: 50%;
            padding: 10px;
            margin: 20px auto;
            display: block;
            background-color: #007bff;
            border: none;
            color: #fff;
            cursor: pointer;
            font-size: 15px;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        /* Scroll effect for navbar */
        var navbar = document.querySelector('.navbar');
        var originalPadding = '20px'; 
        var reducedPadding = '15px'; 

        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                navbar.style.padding = reducedPadding; 
            } else {
                navbar.style.padding = originalPadding; 
            }
        });
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="company-name">Cartivate</div>
            <ul class="nav-links">
                <li><a href="c_home.aspx">Home</a></li>
                <li><a href="c_home.aspx">About</a></li>
                <li><a href="c_feedback.aspx">Contact</a></li>
            </ul>
            <button class="admin-button"><a href="c_admin.aspx" style="text-decoration:none; color: inherit;">ADMIN</a></button>
        </div>
        <div class="login-container">
            <h1>Contact Us</h1>
            <div class="form-group">
                <label for="username">Name :</label>
                <asp:TextBox ID="username" runat="server" placeholder="Enter Your Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Email">Email :</label>
                <asp:TextBox ID="email3" runat="server"  placeholder="Enter Your Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="subject">Subject :</label>
                <asp:TextBox ID="email1" runat="server" placeholder="Enter Subject"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="message">Message :</label>
                <asp:TextBox ID="email2" runat="server" TextMode="MultiLine" Rows="5" placeholder="Share Your Message/Review"></asp:TextBox>
            </div>
            <asp:Button ID="sendButton" runat="server" CssClass="login-button" Text="SEND" />
        </div>
    </form>
</body>
</html>
