Imports System.IO
Imports System.Data.SqlClient

Partial Class c_cars
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("username") IsNot Nothing Then
                ' Capitalize the first letter of the username
                Dim username As String = Session("username").ToString()
                LiteralUsername.Text = CapitalizeFirstLetter(username)
            Else
                ' If username is not in session, redirect to the login page
                Response.Redirect("c_login.aspx")
            End If
            BindVehicles() ' Bind vehicles data when the page is first loaded
        End If
    End Sub

    ' Method to bind vehicle data from the database to the Repeater
    Protected Sub BindVehicles()
        ' Corrected the table name and added error handling
        Dim query As String = "SELECT * FROM c_vehciles WHERE availability = 'Yes'"
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Try
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(query, connection)
                    connection.Open()
                    Dim reader As SqlDataReader = command.ExecuteReader()
                    Repeater1.DataSource = reader
                    Repeater1.DataBind() ' Bind the data to the Repeater
                End Using
            End Using
        Catch ex As Exception
            ' Handle the exception (optional: you can log this or show a message)
            Response.Write("An error occurred: " & ex.Message)
        End Try
    End Sub

    ' Event handler for booking a car
    ' Event handler for booking a car
    Protected Sub btnbook_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As Button = CType(sender, Button)
        Dim carId As String = btn.CommandArgument

        ' Get the price for the selected car
        Dim price As Decimal = GetCarPrice(carId)

        ' Store the car_id and price in the session
        Session("selected_car_id") = carId
        Session("price") = price

        ' Debugging: Check if the price is stored in the session
        If Session("price") IsNot Nothing Then
            Response.Write("Price for selected car: " & Session("price").ToString())
        Else
            Response.Write("Price is not available for the selected car.")
        End If

        ' Redirect to c_book_cars.aspx
        Response.Redirect("c_book_cars.aspx")
    End Sub

    ' Function to get the price for the selected car
    Private Function GetCarPrice(ByVal carId As String) As Decimal
        Dim price As Decimal = 0

        ' Connection string and query to retrieve the price for the selected car
        Dim query As String = "SELECT price FROM c_vehciles WHERE car_id = @car_id"
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

        Try
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(query, connection)
                    command.Parameters.AddWithValue("@car_id", carId)

                    connection.Open()
                    Dim result As Object = command.ExecuteScalar()

                    If result IsNot Nothing Then
                        price = Convert.ToDecimal(result)
                    End If
                End Using
            End Using
        Catch ex As Exception
            ' Handle any exceptions
            Response.Write("Error retrieving price: " & ex.Message)
        End Try

        Return price
    End Function

    Protected Sub lnkProfile_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("c_my_profile.aspx")
    End Sub

    Protected Sub lnkBookings_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("c_bookings.aspx")
    End Sub

    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("c_home.aspx")
    End Sub
    Private Function CapitalizeFirstLetter(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then
            Return input
        End If
        Return Char.ToUpper(input(0)) & input.Substring(1).ToLower()
    End Function
End Class