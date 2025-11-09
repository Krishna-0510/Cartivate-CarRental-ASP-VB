<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_bill.aspx.vb" Inherits="project1.WebForm6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rental Bill</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('background2jpg.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
        }

        .bill-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 90%;
            margin: 40px auto;
            border: 1px solid #ddd;
            background: #f8f9fa; /* Light background for a professional look */
        }

        .bill-header {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }

        .bill-header h2 {
            font-size: 2.2rem;
            margin-bottom: 10px;
            color: #333;
        }

        .bill-header p {
            font-size: 1.1rem;
            color: #555;
        }

        .logo {
            max-width: 100px;
            margin-bottom: 10px;
        }

        .bill-details-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .bill-details-table th, .bill-details-table td {
            padding: 15px;
            text-align: left;
            font-size: 1.1rem;
            color: #555;
        }

        .bill-details-table th {
            background-color: #4a4a4a;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        .bill-details-table td {
            border-bottom: 1px solid #ddd;
            font-size: 1.1rem;
            color: #333;
        }

        .bill-details-table tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        .bill-details-table tr:nth-child(odd) td {
            background-color: #e0e0e0;
        }

        .total-row {
            font-size: 1.3rem;
            font-weight: bold;
            background-color: #f8f8f8;
        }

        .pdf-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 5px;
            width: auto;
            margin: 20px auto 0;
            display: block;
            text-align: center;
            transition: background-color 0.3s;
        }

        .pdf-button:hover {
            background-color: #3e8e41;
        }

        .bill-footer {
            text-align: center;
            padding: 15px;
            font-size: 0.9rem;
            color: #777;
            background-color: #f8f8f8;
            border-top: 1px solid #ddd;
            margin-top: 30px;
        }

        .bill-footer p {
            margin: 0;
        }

        /* Adding company address for professionalism */
        .company-info {
            font-size: 0.95rem;
            color: #777;
            text-align: center;
            margin-top: 20px;
        }

        .company-info p {
            margin: 0;
        }

    </style>
</head>

    <script type="text/javascript">
        function generatePDF() {
            var printContent = document.querySelector('.bill-container').innerHTML;
            var WinPrint = window.open('', '', 'width=900,height=650');
            WinPrint.document.write('<html><head><title>Rental Invoice</title>');
            WinPrint.document.write('<style>');
            WinPrint.document.write('body{font-family:Arial, sans-serif;}');
            WinPrint.document.write('table{border-collapse:collapse; width:100%;} table, th, td{border:1px solid black; padding:8px;} th{text-align:left; background-color:#4a4a4a; color:white;}');
            WinPrint.document.write('h2{text-align:center; font-size:2rem; color:#333;} .total-row{font-weight:bold;}');
            WinPrint.document.write('</style></head><body>');
            WinPrint.document.write(printContent);
            WinPrint.document.write('</body></html>');
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
</script>

<body>
    <form id="form1" runat="server">
        <div class="bill-container">
            <!-- Company Logo and Name -->
            <div class="bill-header">
                <img src="logo.png" alt="Company Logo" class="logo" /> <!-- Add your logo here -->
                <h2>Car Rental Invoice</h2>
                <p>Cartivate Rentals</p>
                <p id="lblDate"><%= DateTime.Now.ToString("dd MMM yyyy") %></p>
            </div>

            <table class="bill-details-table">
                <tr><th>Rental ID</th><td><asp:Label ID="lblRentalID" runat="server" Text="12345"></asp:Label></td></tr>
                <tr><th>First Name</th><td><asp:Label ID="lblFirstName" runat="server" Text="John"></asp:Label></td></tr>
                <tr><th>Last Name</th><td><asp:Label ID="lblLastName" runat="server" Text="Doe"></asp:Label></td></tr>
                <tr><th>Mobile Number</th><td><asp:Label ID="lblMobileNumber" runat="server" Text="9876543210"></asp:Label></td></tr>
                <tr><th>From Date</th><td><asp:Label ID="lblFromDate" runat="server" Text="01 Oct 2024"></asp:Label></td></tr>
                <tr><th>To Date</th><td><asp:Label ID="lblToDate" runat="server" Text="05 Oct 2024"></asp:Label></td></tr>
                <tr><th>Duration (Days)</th><td><asp:Label ID="lblDuration" runat="server" Text="5"></asp:Label></td></tr>
                <tr><th>Pickup Location</th><td><asp:Label ID="lblPickupLocation" runat="server" Text="City Center"></asp:Label></td></tr>
                <tr><th>Dropoff Location</th><td><asp:Label ID="lblDropoffLocation" runat="server" Text="Airport"></asp:Label></td></tr>
                <tr><th>Additional Services</th><td><asp:Label ID="lblAdditionalServices" runat="server" Text="GPS, Baby Seat"></asp:Label></td></tr>
                <tr><th>Status</th><td><asp:Label ID="lblStatus" runat="server" Text="Confirmed"></asp:Label></td></tr>
                <tr class="total-row"><th>Bill Payable</th><td><asp:Label ID="lblPrice" runat="server" Text="$250"></asp:Label></td></tr>
            </table>

            <!-- Download PDF Button -->
            <button type="button" class="pdf-button" onclick="generatePDF()">Download PDF</button>

            <!-- Footer Section -->
            <div class="bill-footer">
                <p>Thank you for choosing Cartivate Rentals</p>
                <p>Contact Us: support@cartivate.com</p>
            </div>

            <!-- Optional Company Information -->
            <div class="company-info">
                <p>Cartivate Rentals, 123 Main Street, City, State, 12345</p>
                <p>Phone: +1 (555) 123-4567 | Email: info@cartivate.com</p>
            </div>
        </div>
    </form>
</body>
</html>
