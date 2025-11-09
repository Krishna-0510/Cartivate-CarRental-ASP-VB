<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="c_my_profile.aspx.vb" Inherits="project1.c_my_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Profile - Car Rental</title>
    <style type="text/css">
        /* Basic styling for HTML and body */
        html, body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Soft light background for better contrast */
            color: #333;
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Center alignment with flexbox */
        .body-content {
            display: flex;
            flex-direction: column; /* Stack the containers vertically */
            align-items: center; /* Center items horizontally */
            width: 100%;
            max-width: 800px; /* Limit the maximum width for better readability */
            margin: 20px auto; /* Add some margin for aesthetics */
            padding: 20px; /* Add padding to the content */
        }

        /* Main container styling */
        .container {
            width: 100%; /* Use full width of the body-content */
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #ffffff; /* White background for main content */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            text-align: left;
            margin-bottom: 20px; /* Space between containers */
        }

        /* New div styling */
        .new-div {
            width: 100%; /* Full width */
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.5s ease, visibility 0.5s ease;
        }

        /* Show new-div when triggered */
        .new-div.show {
            opacity: 1;
            visibility: visible;
        }

        /* Heading styling */
        h1, h2 {
            text-align: center;
            color: #0056b3; /* Darker blue for headings */
            margin: 0 0 20px; /* Bottom margin for spacing */
        }

        /* Profile image section */
        .profile-img-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007BFF; /* Blue border for the profile image */
        }

        /* File upload styling */
        .file-upload {
            margin-top: 10px;
        }

        /* Form styling */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 14px; /* Smaller font for labels */
            margin-bottom: 5px;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px; /* Smaller font for inputs */
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s ease; /* Smooth border transition */
        }

        .form-control:focus {
            border-color: #007BFF; /* Highlight border on focus */
            outline: none; /* Remove outline */
        }

        /* Button styling */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF; /* Primary button color */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            transition: background-color 0.3s ease; /* Smooth background color transition */
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .btn-submit {
            background-color: #28a745; /* Green button for submit */
        }

        .btn-submit:hover {
            background-color: #218838; /* Darker green on hover */
        }

        /* Additional styling for alert messages */
        .alert {
            color: red;
            font-weight: bold;
            margin: 10px 0;
            text-align: center; /* Center the alert message */
        }

        /* Alignment for form actions */
        .form-actions {
            text-align: right; /* Right align action buttons */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="body-content" id="bodyContent">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="False"></asp:Label>

            <div class="container" id="mainContainer">
                <h1>My Profile</h1>
                <div class="profile-img-section">
                    <asp:Image ID="imgProfile" runat="server" CssClass="profile-img" />
                    <div class="file-upload">
                        <label for="fileUploadProfileImage">Choose File</label>
                        <asp:FileUpload ID="fileUploadProfileImage" runat="server" CssClass="file-upload" />
                        <asp:Button ID="btnUploadImage" runat="server" Text="Upload Image" CssClass="btn" OnClick="btnUploadImage_Click" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtName">Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn" OnClick="btnUpdate_Click" />
                </div>
            </div>

            <div class="new-div" id="additionalDiv">
                <h2>Additional Information</h2>
                <div class="form-group">
                    <label for="txtMobileNumber">Mobile Number</label>
                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtAadharNumber">Aadhar Number</label>
                    <asp:TextBox ID="txtAadharNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnSubmitNewInfo" runat="server" Text="Submit Additional Info" CssClass="btn btn-submit" />
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function showNewDiv() {
            const newDiv = document.getElementById('additionalDiv');

            // Toggle classes to reveal the new div
            newDiv.classList.toggle('show');
        }

        document.getElementById('<%=btnUpdate.ClientID%>').addEventListener('click', function (e) {
            e.preventDefault();
            showNewDiv();
        });
    </script>
</body>
</html>
