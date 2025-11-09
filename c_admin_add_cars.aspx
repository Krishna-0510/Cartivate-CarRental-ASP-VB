<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_admin_add_cars.aspx.vb" Inherits="project1.c_admin_add_cars" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin - Add Vehicles</title>
    <style type="text/css">
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            color: #333;
            position: relative;
            border-bottom:2px solid black;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 2px solid #ddd;
            transition: border-color 0.3s ease-in-out;
            font-size: 0.9rem;
        }

        input[type="text"]:focus, input[type="file"]:focus {
            border-color: #6c63ff;
            outline: none;
        }

        .btn {
            background-color: #6c63ff;
            color: white;
            border: none;
            padding: 10px 16px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
            display: inline-block;
            margin-right: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn:hover {
            background-color: #5149d8;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-3px);
        }

        .btn-danger {
            background-color: #e74c3c;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .gridview-container {
            margin-top: 40px;
        }

        .gridview-container .GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .GridView th, .GridView td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .GridView th {
            background-color: #f7f7f7;
            font-weight: bold;
        }

        .GridView tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.2s ease-in-out;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Vehicle</h2>
            <asp:Label ID="lblVehicleID" runat="server" Text="Vehicle ID:" />
            <asp:TextBox ID="txtVehicleID" runat="server" />

            <asp:Label ID="lblMake" runat="server" Text="Make:" />
            <asp:TextBox ID="txtMak" runat="server" />

            <asp:Label ID="lblModel" runat="server" Text="Model:" />
            <asp:TextBox ID="txtModel" runat="server" />

            <asp:Label ID="lblYear" runat="server" Text="Year:" />
            <asp:TextBox ID="txtYear" runat="server" />

            <asp:Label ID="lblColor" runat="server" Text="Color:" />
            <asp:TextBox ID="txtColor" runat="server" />

            <asp:Label ID="lblAvailability" runat="server" Text="Availability:" />
            <asp:TextBox ID="txtAvailability" runat="server" />

            <asp:Label ID="lblUpload" runat="server" Text="Upload Image:" />
            <asp:FileUpload ID="FileUpload1" runat="server" />

            <asp:Button ID="btnAddVehicle" runat="server" CssClass="btn" Text="Add Vehicle" OnClick="AddVehicle" />
            <asp:Button ID="btnEditVehicle" runat="server" CssClass="btn" Text="Edit Vehicle" />
            <asp:Button ID="btnDeleteVehicle" runat="server" CssClass="btn btn-danger" Text="Delete Vehicle" OnClick="DeleteVehicle" />
            
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="car_id" CssClass="GridView">
                    <Columns>
                        <asp:BoundField DataField="car_id" HeaderText="Vehicle ID" />
                        <asp:BoundField DataField="manu" HeaderText="Manufacturer" />
                        <asp:BoundField DataField="model" HeaderText="Model" />
                        <asp:BoundField DataField="year" HeaderText="Year" />
                        <asp:BoundField DataField="color" HeaderText="Color" />
                        <asp:BoundField DataField="availability" HeaderText="Availability" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="EditButton" runat="server" CssClass="btn" Text="Edit" CommandName="Edit" />
                                <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
