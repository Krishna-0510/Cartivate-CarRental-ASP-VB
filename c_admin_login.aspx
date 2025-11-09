<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_admin_login.aspx.vb" Inherits="project1.c_admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <title>Admin Login Page</title>
   <style type="text/css">
    body {
        height: 100vh;
        margin: 0;
        background-color: #333;
        font-family: Arial, sans-serif;
        color: #fff;
        background: url('background2jpg.jpg') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        align-items: center;
        justify-content: center;
        min-height:60px;
    }
    .login-container {
        width: 400px;
        padding: 40px;
        background-color: rgba(34, 34, 34, 0.9); /* Slight transparency */
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        text-align: center;
    }
    .login-container h1 {
        margin-bottom: 30px;
        font-size: 28px;
        letter-spacing: 1px;
    }
    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }
    .form-group label {
        font-weight: bold;
        font-size: 14px;
        margin-bottom: 5px;
        display: block;
    }
    .form-group input {
        width: calc(100% - 20px); /* Adjust the width with padding taken into account */
        padding: 10px; /* Reduced padding for better balance */
        border: 1px solid #555;
        border-radius: 5px;
        background-color: #444;
        color: #fff;
        font-size: 16px;
    }
    .form-group input:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        outline: none;
    }
    #login {
        width: 100%; /* Ensure button is the same width as textboxes */
        padding: 12px; /* Reduced padding to align with input fields */
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    #login:hover {
        background-color: #0056b3;
        box-shadow: 0 4px 10px rgba(0, 123, 255, 0.5);
    }
    .register-link {
        margin-top: 20px;
        font-size: 14px;
    }
    .register-link a {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    .register-link a:hover {
        color: #0056b3;
        text-decoration: underline;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h1>Admin Login</h1><br />

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
        </div>
    </form>
</body>
</html>
