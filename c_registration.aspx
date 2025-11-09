<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_registration.aspx.vb" Inherits="project1.c_registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
        body 
        {
            height:200px;
            background-color: #333;
            font-family: Arial, sans-serif;
            color: #fff;
            background: url('background2jpg.jpg') no-repeat center center fixed;   
        }
      .login-container {
            width: 400px;
            margin: 0px auto;
            padding: 35px 70px 50px 40px;
            
            background-color: #222;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
      .login-container h1 {
            text-align: center;
            margin-left:30px;
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
        #submit {
            width: 50%;
            height: 25%;
            padding: 16px;
            display: block;
            margin: 0 auto;
            background-color: #007bff;
            border: none;
            border-radius: 3px;
            border-style: groove;
            color: #fff;
            cursor: pointer;
            font-size: 15px;
        }
        #submit:hover {
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
            <h1>Registration</h1><br />
            
            <div class="form-group">
                <label for="name">Name :  </label>
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
            </div>
            <br />
            <div class="form-group">
                <label for="mobile_number">Mobile Number : </label>
                <asp:TextBox ID="txt_mobile_number" runat="server"></asp:TextBox>
            </div><br />
            <div class="form-group">
                <label for="adhar_number">Adhar Number : </label>
                <asp:TextBox ID="txt_adhar_number" runat="server"></asp:TextBox>
            </div><br />
            <div class="form-group">
                <label for="license_number">License Number : </label>
                <asp:TextBox ID="txt_license_number" runat="server"></asp:TextBox>
            </div><br />
            <div class="form-group">
                <label for="email">Email : </label>
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
            </div><br />
            <div class="form-group">
                <label for="password">Password : </label>
                <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
            </div><br />
            <asp:Button ID="submit" runat="server" Text="Button" OnClick="submit_Click" />
          <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        
            <div class="register-link">
                Don't have an account? <a href="#">Register Here</a>
                </div>
       </form>
       </body>
     </html>
