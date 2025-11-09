Partial Class c_home_book
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Check if the session contains the username
        If Not IsPostBack Then
            If Session("username") IsNot Nothing Then
                ' Capitalize the first letter of the username
                Dim username As String = Session("username").ToString()
                LiteralUsername.Text = CapitalizeFirstLetter(username)
            Else
                ' If username is not in session, redirect to the login page
                Response.Redirect("c_login.aspx")
            End If
        End If
    End Sub

    Protected Sub lnkProfile_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Display the username with the first letter capitalized when My Profile is clicked
        If Session("username") IsNot Nothing Then
            Dim username As String = Session("username").ToString()
            LiteralUsername.Text = " " & CapitalizeFirstLetter(username)
        End If
        Response.Redirect("c_my_profile.aspx")
    End Sub

    Protected Sub lnkBookings_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Redirect to the bookings page (if you have one)
        Response.Redirect("c_bookings.aspx")
    End Sub

    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Clear session and redirect to the home page
        Session.Clear()
        Session.Abandon()
        Response.Redirect("c_home.aspx")
    End Sub

    ' Function to capitalize the first letter of a string
    Private Function CapitalizeFirstLetter(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then
            Return input
        End If
        Return Char.ToUpper(input(0)) & input.Substring(1).ToLower()
    End Function

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLogin.Click
        Response.Redirect("c_book_cars.aspx")
    End Sub
End Class
