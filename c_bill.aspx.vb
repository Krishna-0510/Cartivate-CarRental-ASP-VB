Imports System.Data.SqlClient
Public Class WebForm6
    Inherits System.Web.UI.Page

    Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Check if rental_id exists in query string
            If Request.QueryString("rental_id") IsNot Nothing Then
                Dim rentalIdString As String = Request.QueryString("rental_id")
                Dim rentalId As Integer

                ' Attempt to parse the rental ID
                If Integer.TryParse(rentalIdString, rentalId) Then
                    LoadBillDetails(rentalId)
                Else
                    DisplayMessage("Invalid rental ID format.")
                End If
            Else
                DisplayMessage("Rental ID not provided.")
            End If
        End If
    End Sub

    Private Sub LoadBillDetails(ByVal rentalId As Integer)
        ' Query to fetch data from c_bill and c_book tables based on rental_id
        Dim query As String = "SELECT b.rental_id, b.first_name, b.mobile_number, b.price, " & _
                              "c.last_name, c.from_date, c.to_date, c.rental_duration, " & _
                              "c.pickup_location, c.dropoff_loaction, c.addition_servives, c.status " & _
                              "FROM c_bill b " & _
                              "JOIN c_book c ON b.rental_id = c.rental_id " & _
                              "WHERE b.rental_id = @rental_id"

        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@rental_id", rentalId)

                Try
                    conn.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        reader.Read()

                        ' Populate bill and rental details into labels in the ASPX page
                        lblRentalID.Text = reader("rental_id").ToString()
                        lblFirstName.Text = reader("first_name").ToString()

                        ' Capitalize the last name
                        lblLastName.Text = CapitalizeFirstLetter(reader("last_name").ToString())
                        lblMobileNumber.Text = reader("mobile_number").ToString()

                        ' Format date fields
                        lblFromDate.Text = Convert.ToDateTime(reader("from_date")).ToString("yyyy-MM-dd")
                        lblToDate.Text = Convert.ToDateTime(reader("to_date")).ToString("yyyy-MM-dd")

                        ' Load other details
                        lblDuration.Text = reader("rental_duration").ToString()
                        lblPickupLocation.Text = reader("pickup_location").ToString()
                        lblDropoffLocation.Text = reader("dropoff_loaction").ToString()
                        lblAdditionalServices.Text = reader("addition_servives").ToString()
                        lblStatus.Text = reader("status").ToString()

                        ' Get the original price
                        Dim price As Decimal = Convert.ToDecimal(reader("price"))

                        ' Calculate the price adjustment based on additional services
                        Dim additionalServices As String = reader("addition_servives").ToString()
                        If Not String.IsNullOrEmpty(additionalServices) Then
                            Dim servicesArray As String() = additionalServices.Split(","c)
                            Dim additionalServiceCount As Integer = servicesArray.Length

                            ' Assuming each additional service costs ₹150
                            Dim additionalServiceCost As Decimal = additionalServiceCount * 150
                            price += additionalServiceCost
                        End If

                        ' Display the updated price
                        lblPrice.Text = "₹" & price.ToString("F2") ' Display price with 2 decimal places

                    Else
                        ' If no records are found
                        DisplayMessage("No bill details found for this rental ID.")
                    End If
                Catch ex As Exception
                    ' Handle potential errors   
                    DisplayMessage("An error occurred while loading bill details: " & ex.Message)
                Finally
                    ' Ensure connection is closed
                    conn.Close()
                End Try
            End Using
        End Using
    End Sub

    ' Utility method to capitalize the first letter of the string
    Private Function CapitalizeFirstLetter(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then
            Return input
        End If
        Return Char.ToUpper(input(0)) & input.Substring(1).ToLower()
    End Function

    ' Utility method to display a message on the page
    Private Sub DisplayMessage(ByVal message As String)

    End Sub

End Class