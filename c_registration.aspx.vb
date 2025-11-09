Imports System.Data.SqlClient

Public Class c_registration
    Inherits System.Web.UI.Page

    Public connectionString As String = "Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Dell-pc\OneDrive\Documents\Visual Studio 2010\Projects\CRMS\project1\project1\App_Data\car.mdf;Integrated Security=True;User Instance=True"
    Public connection As New SqlConnection(connectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub submit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submit.Click
        If String.IsNullOrEmpty(txt_name.Text) OrElse String.IsNullOrEmpty(txt_mobile_number.Text) OrElse _
           String.IsNullOrEmpty(txt_adhar_number.Text) OrElse String.IsNullOrEmpty(txt_license_number.Text) OrElse _
           String.IsNullOrEmpty(txt_email.Text) OrElse String.IsNullOrEmpty(txt_password.Text) Then
            lblError.Text = "Please fill all the fields."
            Return
        End If

        Dim query As String = "INSERT INTO c_reg (name, mobile_number, adhar_number, license_number, email, password) VALUES (@name, @mobile_number, @adhar_number, @license_number, @email, @password)"

        Using command As New SqlCommand(query, connection)

            Dim nm As String = txt_name.Text
            Dim mn As String = txt_mobile_number.Text
            Dim an As String = txt_adhar_number.Text
            Dim ln As String = txt_license_number.Text
            Dim eml As String = txt_email.Text
            Dim pwd As String = txt_password.Text

            command.Parameters.AddWithValue("@name", nm)
            command.Parameters.AddWithValue("@mobile_number", mn)
            command.Parameters.AddWithValue("@adhar_number", an)
            command.Parameters.AddWithValue("@license_number", ln)
            command.Parameters.AddWithValue("@email", eml)
            command.Parameters.AddWithValue("@password", pwd)

            Try
                connection.Open()
                command.ExecuteNonQuery()
                ClientScript.RegisterStartupScript(Me.GetType(), "alertScript", "alert('Registration Successful');", True)
                Response.Redirect("c_login.aspx")
            Catch ex As Exception
                Response.Write("<script>alert('An Error Occurred: " & ex.Message & "');</script>")
            Finally
                connection.Close()
            End Try
        End Using
    End Sub
End Class