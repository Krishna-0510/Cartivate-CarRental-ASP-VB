Imports System.Data
Imports System.Data.SqlClient

Partial Class c_book_cars
    Inherits System.Web.UI.Page
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Check if FromDate and ToDate exist in session
            If Session("FromDate") Is Nothing OrElse Session("ToDate") Is Nothing Then
                ' Redirect to home page if dates are missing
                Response.Redirect("c_home.aspx")
            End If

            ' Retrieve dates from session variables
            txtFrom.Text = Session("FromDate").ToString()
            txtTo.Text = Session("ToDate").ToString()

            ' Check if the username is already set in the session
            If Session("username") Is Nothing Then
                ' If not, redirect to the login page
                Response.Redirect("c_login.aspx")
            Else
                ' Retrieve name and mobile number from the database
                Dim query As String = "SELECT name, mobile_number FROM c_reg WHERE name = @name"

                Using connection As New SqlConnection(connectionString)
                    connection.Open() ' Open the connection before executing the command

                    Dim command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@name", Session("username"))

                    Dim reader As SqlDataReader = command.ExecuteReader()

                    ' Assuming that only one record is needed; update textboxes
                    If reader.Read() Then
                        txtFirstName.Text = CapitalizeFirstLetter(reader("name").ToString())
                        txtMobile.Text = reader("mobile_number").ToString()
                    End If

                    reader.Close()
                End Using
            End If

            ' Calculate rental duration
            CalculateRentalDuration()
        End If
    End Sub

    Private Sub CalculateRentalDuration()
        If Not String.IsNullOrEmpty(txtFrom.Text) AndAlso Not String.IsNullOrEmpty(txtTo.Text) Then
            Dim fromDate As DateTime
            Dim toDate As DateTime

            If DateTime.TryParse(txtFrom.Text, fromDate) AndAlso DateTime.TryParse(txtTo.Text, toDate) Then
                Dim rentalDays As Integer = (toDate - fromDate).Days
                txtRentalDuration.Text = If(rentalDays >= 0, rentalDays.ToString(), "0")
            End If
        End If
    End Sub

    ' Capitalize First Letter
    Private Function CapitalizeFirstLetter(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then
            Return input
        End If
        Return Char.ToUpper(input(0)) & input.Substring(1).ToLower()
    End Function

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnConfirm.Click
        Dim errorMessage As String = ValidateForm()

        ' If there are any errors, display and return
        If Not String.IsNullOrEmpty(errorMessage) Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please correct the following errors:\\n" & errorMessage & "');", True)
            Return
        End If

        ' Check if car_id is available in the session before proceeding
        If Session("selected_car_id") Is Nothing Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Car selection is missing. Please select a car first.');", True)
            Response.Redirect("c_cars.aspx")
            Return
        End If

        ' Variables to hold price-related info
        Dim pricePerDay As Decimal = 0
        Dim totalPrice As Decimal = 0
        Dim rentalDuration As Integer = CInt(txtRentalDuration.Text) ' Assuming the rental duration is already calculated

        Using connection As New SqlConnection(connectionString)
            connection.Open()

            ' Retrieve price per day for the selected car
            Dim getPriceQuery As String = "SELECT price FROM c_vehciles WHERE car_id = @car_id"
            Using getPriceCommand As New SqlCommand(getPriceQuery, connection)
                getPriceCommand.Parameters.AddWithValue("@car_id", Session("selected_car_id"))

                Dim result As Object = getPriceCommand.ExecuteScalar()
                If result IsNot Nothing Then
                    pricePerDay = CDec(result)
                End If
            End Using

            ' Calculate total price
            totalPrice = rentalDuration * pricePerDay

            ' First Query: Insert into c_book table
            Dim insertQueryBook As String = "INSERT INTO c_book (first_name, last_name, mobile_number, from_date, to_date, rental_duration, pickup_location, dropoff_loaction, addition_servives, status, cst_id, price) " & _
                                            "VALUES (@first_name, @last_name, @mobile_number, @from_date, @to_date, @rental_duration, @pickup_location, @dropoff_loaction, @addition_servives, 'Pending', @cst_id, @price); " & _
                                            "SELECT SCOPE_IDENTITY();"  ' Get the last inserted rental_id

            Dim rentalID As Integer
            Using commandBook As New SqlCommand(insertQueryBook, connection)
                ' Add parameters for c_book
                commandBook.Parameters.AddWithValue("@first_name", txtFirstName.Text)
                commandBook.Parameters.AddWithValue("@last_name", txtLastName.Text)
                commandBook.Parameters.AddWithValue("@mobile_number", txtMobile.Text)
                commandBook.Parameters.AddWithValue("@from_date", txtFrom.Text)
                commandBook.Parameters.AddWithValue("@to_date", txtTo.Text)
                commandBook.Parameters.AddWithValue("@rental_duration", rentalDuration)
                commandBook.Parameters.AddWithValue("@pickup_location", ddlPickupLocation.SelectedValue)
                commandBook.Parameters.AddWithValue("@dropoff_loaction", ddlDropoffLocation.SelectedValue)

                ' Concatenate selected services
                Dim selectedServices As String = String.Join(",", chkAdditionalServices.Items.Cast(Of ListItem).Where(Function(i) i.Selected).Select(Function(i) i.Value))
                commandBook.Parameters.AddWithValue("@addition_servives", selectedServices)
                commandBook.Parameters.AddWithValue("@cst_id", Session("cst_id"))
                commandBook.Parameters.AddWithValue("@price", totalPrice) ' Add the calculated total price

                ' Execute the first insert query and retrieve the rental_id
                rentalID = Convert.ToInt32(commandBook.ExecuteScalar())
            End Using

            ' Second Query: Insert into c_bill table, including the rental_id
            Dim insertQueryBill As String = "INSERT INTO c_bill (rental_id, username, car_id, cst_id, first_name, mobile_number, price) " & _
                                            "VALUES (@rental_id, @username, @car_id, @cst_id, @first_name, @mobile_number, @price)"

            Using commandBill As New SqlCommand(insertQueryBill, connection)
                ' Add parameters for c_bill
                commandBill.Parameters.AddWithValue("@rental_id", rentalID) ' Add the retrieved rental_id
                commandBill.Parameters.AddWithValue("@username", Session("username"))
                commandBill.Parameters.AddWithValue("@car_id", Session("selected_car_id")) ' Using the session-stored car_id
                commandBill.Parameters.AddWithValue("@cst_id", Session("cst_id"))
                commandBill.Parameters.AddWithValue("@first_name", txtFirstName.Text)
                commandBill.Parameters.AddWithValue("@mobile_number", txtMobile.Text)
                commandBill.Parameters.AddWithValue("@price", totalPrice) ' Add the calculated total price

                ' Execute the second insert query
                commandBill.ExecuteNonQuery()
            End Using
        End Using

        ' Show success message and redirect
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Booking Confirmed!'); window.location.href = 'c_home_book.aspx';", True)

        ' Clear all fields
        ClearForm()
    End Sub



    ' Validate the form and return error messages
    Private Function ValidateForm() As String
        Dim errorMessage As String = String.Empty

        If String.IsNullOrEmpty(txtFirstName.Text) Then errorMessage &= "First Name is required.<br />"
        If String.IsNullOrEmpty(txtLastName.Text) Then errorMessage &= "Last Name is required.<br />"
        If String.IsNullOrEmpty(txtMobile.Text) Then errorMessage &= "Mobile Number is required.<br />"
        If String.IsNullOrEmpty(txtFrom.Text) Then errorMessage &= "From Date is required.<br />"
        If String.IsNullOrEmpty(txtTo.Text) Then errorMessage &= "To Date is required.<br />"
        If String.IsNullOrEmpty(txtRentalDuration.Text) Then errorMessage &= "Rental Duration is required.<br />"
        If ddlPickupLocation.SelectedIndex = 0 Then errorMessage &= "Pickup Location must be selected.<br />"
        If ddlDropoffLocation.SelectedIndex = 0 Then errorMessage &= "Dropoff Location must be selected.<br />"

        Return errorMessage
    End Function

    ' Clear the form fields
    Private Sub ClearForm()
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtMobile.Text = ""
        txtFrom.Text = ""
        txtTo.Text = ""
        txtRentalDuration.Text = ""
        ddlPickupLocation.SelectedIndex = 0
        ddlDropoffLocation.SelectedIndex = 0
        chkAdditionalServices.ClearSelection()
    End Sub
End Class
