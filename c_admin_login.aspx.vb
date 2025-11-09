Public Class c_admin_login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblError.Text = "" ' Clear any previous error message on page load
    End Sub

    Protected Sub login_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Login.Click
        ' Validation logic when the login button is clicked
        If String.IsNullOrEmpty(unm.Text) AndAlso String.IsNullOrEmpty(pwd.Text) Then
            lblError.Text = "Please enter both username and password"
        ElseIf String.IsNullOrEmpty(unm.Text) Then
            lblError.Text = "Please enter username"
        ElseIf String.IsNullOrEmpty(pwd.Text) Then
            lblError.Text = "Please enter password"
        ElseIf unm.Text <> "Krishna" AndAlso pwd.Text <> "0510" Then
            lblError.Text = "Both username and password are invalid"
        ElseIf unm.Text <> "Krishna" Then
            lblError.Text = "Invalid username"
        ElseIf pwd.Text <> "0510" Then
            lblError.Text = "Invalid password"
        Else
            ' If both username and password are correct, redirect
            Response.Redirect("~/Admin/Default.aspx")
        End If
    End Sub

End Class
