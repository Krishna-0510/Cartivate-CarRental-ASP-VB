Imports System.Data.SqlClient
Imports System.Data

Public Class c_my_profile
    Inherits System.Web.UI.Page

    Dim connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("cst_id") IsNot Nothing Then
                LoadUserProfile()
            Else
                ' Display message if the user is not logged in
                lblMessage.Text = "Error: User not logged in."
                lblMessage.Visible = True
            End If
        End If
    End Sub

    Private Sub LoadUserProfile()
        Dim userId As Integer = Convert.ToInt32(Session("cst_id"))

        If userId <= 0 Then
            lblMessage.Text = "Error: Invalid user session."
            lblMessage.Visible = True
            Return
        End If

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT name, mobile_number, adhar_number, email, password, image_path FROM c_reg WHERE cst_id = @UserId", con)
            cmd.Parameters.AddWithValue("@UserId", userId)

            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                ' Populate Name
                Dim name As String = reader("name").ToString()
                txtName.Text = Char.ToUpper(name(0)) & name.Substring(1)

                ' Populate Mobile Number
                txtMobileNumber.Text = reader("mobile_number").ToString()


                txtAadharNumber.Text = reader("adhar_number").ToString()


                txtEmail.Text = reader("email").ToString()


                txtPassword.Attributes("value") = reader("password").ToString() ' Use this if you need to pre-fill

                ' Populate Profile Image
                imgProfile.ImageUrl = "~/c_upload_images/" & If(String.IsNullOrEmpty(reader("image_path").ToString()), "profile.jpeg", reader("image_path").ToString())
            Else
                lblMessage.Text = "User profile not found."
                lblMessage.Visible = True
            End If
        End Using
    End Sub

    Protected Sub btnUploadImage_Click(ByVal sender As Object, ByVal e As EventArgs)
        If fileUploadProfileImage.HasFile Then
            Try
                Dim fileName As String = System.IO.Path.GetFileName(fileUploadProfileImage.FileName)
                Dim filePath As String = Server.MapPath("~/c_upload_images/") & fileName
                fileUploadProfileImage.SaveAs(filePath)

                UpdateUserProfileImage(fileName)

                lblMessage.Text = "Image uploaded successfully!"
                lblMessage.Visible = True
                imgProfile.ImageUrl = "~/c_upload_images/" & fileName
            Catch ex As Exception
                lblMessage.Text = "Error: " & ex.Message
                lblMessage.Visible = True
            End Try
        End If
    End Sub

    Private Sub UpdateUserProfileImage(ByVal fileName As String)
        Dim userId As Integer = Convert.ToInt32(Session("cst_id"))

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE c_reg SET image_path = @ImagePath WHERE cst_id = @UserId", con)
            cmd.Parameters.AddWithValue("@ImagePath", fileName)
            cmd.Parameters.AddWithValue("@UserId", userId)

            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim userId As Integer = Convert.ToInt32(Session("cst_id"))

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE c_reg SET name = @Name, mobile_number = @Mobile, adhar_number = @Aadhar, email = @Email WHERE cst_id = @UserId", con)
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim())
            cmd.Parameters.AddWithValue("@Mobile", txtMobileNumber.Text.Trim())
            cmd.Parameters.AddWithValue("@Aadhar", txtAadharNumber.Text.Trim())
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
            cmd.Parameters.AddWithValue("@UserId", userId)

            con.Open()
            cmd.ExecuteNonQuery()

            lblMessage.Text = "Profile updated successfully!"
            lblMessage.Visible = True
        End Using
    End Sub
End Class
