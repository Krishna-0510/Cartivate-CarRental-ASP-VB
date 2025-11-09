Imports System.Data.SqlClient
Imports System.IO

Public Class c_driver_mgt
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Any initialization code can go here
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSave.Click
        ' Retrieve data from the form
        Dim firstName As String = txtFirstName.Text.Trim()
        Dim lastName As String = txtLastName.Text.Trim()
        Dim mobileNumber As String = txtPhone.Text.Trim()
        Dim address As String = txtAddress.Text.Trim()
        Dim state As String = ddlState.SelectedValue
        Dim city As String = ddlCity.SelectedValue
        Dim licenseNumber As String = txtLicenseNumber.Text.Trim()
        Dim vehicleType As String = rblVehicleType.SelectedValue
        Dim photoPath As String = ""

        ' Handle file upload
        Dim fileSavePath As String = Server.MapPath("~/c_driver_images/")
        If Not Directory.Exists(fileSavePath) Then
            Directory.CreateDirectory(fileSavePath)
        End If
        If fuPhoto.HasFile Then
            fuPhoto.SaveAs(fileSavePath & Path.GetFileName(fuPhoto.FileName))
        End If
        If (fuPhoto.HasFile) Then

        End If

        ' Insert data into the database
        Dim connString As String = "Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Dell-pc\onedrive\documents\visual studio 2010\Projects\project1\project1\App_Data\car.mdf;Integrated Security=True;User Instance=True"
        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim sql As String = "INSERT INTO c_driver_mst (first_name, last_name, mobile_number, license_number, vehicle_type, city, state) " &
                                "VALUES (@FirstName, @LastName, @MobileNumber,@LicenseNumber, @VehicleType, @City, @State)"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@FirstName", firstName)
                cmd.Parameters.AddWithValue("@LastName", lastName)
                cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber)


                cmd.Parameters.AddWithValue("@LicenseNumber", licenseNumber)
                cmd.Parameters.AddWithValue("@VehicleType", vehicleType)
                cmd.Parameters.AddWithValue("@City", city)
                cmd.Parameters.AddWithValue("@State", state)


                Try
                    cmd.ExecuteNonQuery()
                    lblMessage.Text = "Data saved successfully!"
                Catch ex As Exception
                    lblMessage.Text = "An error occurred: " & ex.Message
                End Try
            End Using
        End Using
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancel.Click
        ' Clear all inputs
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtPhone.Text = ""
        txtAddress.Text = ""
        ddlState.SelectedIndex = 0
        ddlCity.SelectedIndex = 0
        txtLicenseNumber.Text = ""
        rblVehicleType.ClearSelection()
        lblMessage.Text = ""
        Label1.Text = ""
    End Sub
End Class