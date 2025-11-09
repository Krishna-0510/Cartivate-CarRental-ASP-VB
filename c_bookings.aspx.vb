Imports System.Data.SqlClient

Public Class c_bookings
    Inherits System.Web.UI.Page

    ' Database connection string
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Check if FromDate and ToDate exist in session


            ' If the user is logged in, retrieve bookings
            If Session("username") IsNot Nothing Then
                Dim username As String = Session("username").ToString()
                LiteralUsername.Text = CapitalizeFirstLetter(username)

                If Session("cst_id") IsNot Nothing Then
                    Dim cst_id As Integer = Convert.ToInt32(Session("cst_id"))
                    LoadBookings(cst_id)  ' Load bookings based on the cst_id
                Else
                    ' If cst_id is not available, redirect to login
                    Response.Redirect("c_login.aspx")
                End If
            Else
                ' If not logged in, redirect to login
                Response.Redirect("c_login.aspx")
            End If
        End If

    End Sub
    Private Sub LoadBookings(ByVal cst_id As Integer)
        Dim query As String = "SELECT rental_id, first_name, last_name, mobile_number, from_date, to_date, rental_duration, pickup_location, dropoff_loaction, addition_servives, status FROM c_book WHERE cst_id = @cst_id"

        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@cst_id", cst_id)

                Try
                    conn.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        Dim dt As New DataTable()
                        dt.Load(reader)

                        ' Adding a new column to store the "Show Bill" hyperlink
                        dt.Columns.Add("ShowBill", GetType(String))

                        ' Loop through each row and add a hyperlink to the bill if the status is 'Accepted'
                        For Each row As DataRow In dt.Rows
                            If row("status").ToString().Trim().ToLower() = "accepted" Then
                                row("ShowBill") = "<a href='c_bill.aspx?rental_id=" & row("rental_id").ToString() & "'>View Bill</a>"

                            Else
                                row("ShowBill") = "N/A"
                            End If
                        Next

                        gvBookings.DataSource = dt
                        gvBookings.DataBind()
                    Else
                        lblMessage.Text = "No bookings found."
                        lblMessage.Visible = True
                    End If

                Catch ex As Exception
                    lblMessage.Text = "Error loading bookings: " & ex.Message
                    lblMessage.Visible = True
                End Try
            End Using
        End Using
    End Sub




    ' Capitalize the first letter of a string
    Private Function CapitalizeFirstLetter(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then
            Return input
        End If
        Return Char.ToUpper(input(0)) & input.Substring(1).ToLower()
    End Function

    ' Navigation to bookings page
    Protected Sub lnkBookings_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("c_bookings.aspx")
    End Sub

    ' Navigation to profile page
    Protected Sub lnkProfile_Click(ByVal sender As Object, ByVal e As EventArgs)
        If Session("username") IsNot Nothing Then
            Dim username As String = Session("username").ToString()
            LiteralUsername.Text = " " & CapitalizeFirstLetter(username)
        End If
        Response.Redirect("c_my_profile.aspx")
    End Sub

    ' Logout the user and redirect to login page
    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Abandon()
        Response.Redirect("c_login.aspx")
    End Sub
End Class
