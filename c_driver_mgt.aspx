<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_driver_mgt.aspx.vb" Inherits="project1.c_driver_mgt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employee Management</title>
    <style>
        .container {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container {
  width: 80%;
  margin: 40px auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: left;
}

td {
  vertical-align: top;
}

th {
  background-color: #f0f0f0;
}

tr:nth-child(even) {
  background-color: #f9f9f9;
}

tr:hover {
  background-color: #ccc;
}

input[type="text"], input[type="password"], textarea {
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ccc;
}

input[type="submit"], input[type="button"] {
  background-color: #7c7474;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
  background-color: #615bd3;
}
.container select {
  width: 100px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #fff;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 10 6'><polygon points='0,0 5,6 10,0'/></svg>");
  background-repeat: no-repeat;
  background-position: right 10px center;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Employee Management</h2>
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><asp:TextBox ID="txtFirstName" runat="server" Width="820px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><asp:TextBox ID="txtLastName" runat="server" Width="820px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><asp:TextBox ID="txtPhone" runat="server" Width="820px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="820px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="(*ENTER ONLY YOUR STREET NAME, HOUSE NUMBER*)"></asp:Label>
                                    </tr>
                <tr>
                    <td>State:</td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" Width="100px">
                            <asp:ListItem Value="">Select State</asp:ListItem>
                            <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                            <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server" Width="100px">
                            <asp:ListItem Value="">Select City</asp:ListItem>
                            <asp:ListItem Value="Ahemdabad">Ahemdabad</asp:ListItem>
                            <asp:ListItem Value="Anand">Anand</asp:ListItem>
                            <asp:ListItem Value="Nadiad">Nadiad</asp:ListItem>
                            <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                            <asp:ListItem Value="Pune">Pune</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>License Number:</td>
                    <td><asp:TextBox ID="txtLicenseNumber" runat="server" Width="820px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Vehicle Type:</td>
                    <td>
                        <asp:RadioButtonList ID="rblVehicleType" runat="server">
                            <asp:ListItem Value="lmv">LMV</asp:ListItem>
                            <asp:ListItem Value="hmv">HMV</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Adhar_Photo:</td>
                    <td><asp:FileUpload ID="fuPhoto" runat="server" /></td>
                </tr>
                <tr>
                    <td>Driver_Photo:</td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td>Medical : </td>
                    <td>
                        <asp:TextBox ID="txtMedical" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>