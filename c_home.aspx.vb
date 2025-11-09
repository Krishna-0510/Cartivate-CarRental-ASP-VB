Public Class c_home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Hide the error message on initial load
        lblError.Visible = False

        ' Set the minimum date for the date input fields to today's date
        Dim currentDate As String = DateTime.Now.ToString("yyyy-MM-dd")
        txtFrom.Attributes("min") = currentDate
        txtTo.Attributes("min") = currentDate
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLogin.Click
        ' Get the current date without time (just the date part)
        Dim currentDate As DateTime = DateTime.Now.Date

        ' Check if both date fields are filled
        If String.IsNullOrEmpty(txtFrom.Text.Trim()) Or String.IsNullOrEmpty(txtTo.Text.Trim()) Then
            ' Show an alert if either field is empty
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please fill both the From and To dates before logging in.');", True)
            lblError.Text = "Please fill both the From and To dates."
            lblError.Visible = True
        Else
            ' Parse the date inputs
            Dim loginFromDate As DateTime
            Dim loginToDate As DateTime

            If DateTime.TryParse(txtFrom.Text.Trim(), loginFromDate) AndAlso DateTime.TryParse(txtTo.Text.Trim(), loginToDate) Then
                ' Check if the dates are valid
                If loginFromDate < currentDate Or loginToDate < currentDate Then
                    ' Show an alert if either date is in the past
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Please select a valid date range.');", True)
                    lblError.Text = "Please select a valid date range."
                    lblError.Visible = True
                Else
                    ' Store the dates in session variables
                    Session("FromDate") = txtFrom.Text.Trim()
                    Session("ToDate") = txtTo.Text.Trim()

                    ' Redirect to c_book_cars.aspx
                    Response.Redirect("c_login.aspx")
                End If
            Else
                ' Show an alert if the date inputs are invalid
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Invalid date format. Please use YYYY-MM-DD.');", True)
                lblError.Text = "Invalid date format. Please use YYYY-MM-DD."
                lblError.Visible = True
            End If
        End If
    End Sub
    
End Class