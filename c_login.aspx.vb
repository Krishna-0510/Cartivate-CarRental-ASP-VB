Imports System.Data
Imports System.Data.SqlClient

Partial Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub login_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Login.Click
        ' Define the connection string
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        ' SQL query to validate the login
        Dim query As String = "SELECT cst_id, name FROM c_reg WHERE name = @name AND password = @password"

        Using connection As New SqlConnection(connectionString)
            connection.Open()

            Dim command As New SqlCommand(query, connection)
            ' Add parameters for the username and password
            command.Parameters.AddWithValue("@name", unm.Text)
            command.Parameters.AddWithValue("@password", pwd.Text)

            Dim reader As SqlDataReader = command.ExecuteReader()

            If reader.Read() Then
                ' Login successful, store the username and cst_id in the session
                Session("username") = reader("name").ToString()
                Session("cst_id") = reader("cst_id")  ' Store cst_id in session

                ' Redirect to home page after successful login
                Response.Redirect("c_cars.aspx")
            Else
                ' Display error message for incorrect credentials
                lblError.Text = "Invalid name or password. Please try again."
            End If

            reader.Close()
        End Using
    End Sub
End Class
