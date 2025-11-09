Imports System.Data.SqlClient

Partial Class c_feedback
    Inherits System.Web.UI.Page

    Protected Sub sendButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles sendButton.Click
        ' Rename variables to avoid naming conflicts
        ' Dim userName As String = username.Text
        Dim userEmail As String = email.Text   ' This should now work as 'email' is not conflicting
        Dim subject As String = email1.Text
        Dim message As String = email2.Text

        ' Construct the SQL query
        Dim query As String = "INSERT INTO feedback (name, email, subject, message) VALUES (@Name, @Email, @Subject, @Message)"

        ' Use your database connection (replace with your connection string)
        Using conn As New SqlConnection("Your_Connection_String_Here")
            Using cmd As New SqlCommand(query, conn)
                ' Add parameters to avoid SQL injection
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = userName
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = userEmail
                cmd.Parameters.Add("@Subject", SqlDbType.NVarChar, -1).Value = subject
                cmd.Parameters.Add("@Message", SqlDbType.NVarChar, -1).Value = message

                ' Open the connection and execute the query
                conn.Open()
                cmd.ExecuteNonQuery()
                conn.Close()

                ' Display a success alert
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Thank you so much! We’re grateful to have you as our client.');", True)
            End Using
        End Using
    End Sub
End Class
