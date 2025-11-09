<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="project1.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Login</title>
    <style>
        body {
            background-color: #333;
            font-family: Arial, sans-serif;
            color: #fff;
            background-image: url('background2jpg.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 400px;
            padding: 35px 40px 70px 30px;
            
            background-color: #222;
            border-radius: 5px;
            box-shadow: 0 0 10px #000;
        }

        .login-container h1 {
            text-align: center;
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
            border-radius: 3px;
            background-color: #333;
            color: #fff;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff;
        }

        #login {
            width: 100%;
            padding: 16px;
            margin-left:8px;
            background-color: #007bff;
            border: none;
            border-radius: 3px;
            color: #fff;
            cursor: pointer;
            font-size: 20px;
            display: block;
        }

        #login:hover {
            background-color: #0056b3;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h1>Admin-Login</h1><br />
            <div class="form-group">
                <label for="username">Username:</label>
                <asp:TextBox ID="unm" runat="server"></asp:TextBox>
            </div>
            <br />
            <div class="form-group">
                <label for="password">Password:</label>
                <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
            </div><br />

            <asp:Button ID="login" runat="server" Text="Login" />
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <div class="register-link">
                Don't have an account? <a href="#">Register Here</a>
            </div>
        </div>
    </form>
</body>
</html>
