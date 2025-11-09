Imports System.Data.SqlClient

Partial Class c_admin_add_cars
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    Dim imgpath As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Using conn As New SqlConnection(connectionString)
            Dim query As String = "SELECT * FROM c_vehciles"
            Dim cmd As New SqlCommand(query, conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            GridView1.DataSource = reader
            GridView1.DataBind()
        End Using
    End Sub

    Protected Sub AddVehicle(ByVal sender As Object, ByVal e As EventArgs) Handles btnAddVehicle.Click
        Using conn As New SqlConnection(connectionString)

            If FileUpload1.HasFile Then

                Dim fe As String = System.IO.Path.GetExtension(FileUpload1.FileName)
                    
                FileUpload1.SaveAs(Server.MapPath("~/imgcar/" & FileUpload1.FileName))
                imgpath = "~/imgcar/" & FileUpload1.FileName
                Label1.ForeColor = System.Drawing.Color.Green
                Label1.Text = "File Uploaded Successfully!"

            End If


            Dim query As String = "INSERT INTO c_vehciles (car_id, manu, model, year, color, availability,image_path) VALUES (@VehicleID, @Make, @Model, @Year, @Color, @Availability,@image_path)"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@VehicleID", txtVehicleID.Text)
            cmd.Parameters.AddWithValue("@Make", txtMake.Text)
            cmd.Parameters.AddWithValue("@Model", txtModel.Text)
            cmd.Parameters.AddWithValue("@Year", txtYear.Text)
            cmd.Parameters.AddWithValue("@Color", txtColor.Text)
            cmd.Parameters.AddWithValue("@Availability", txtAvailability.Text)
            cmd.Parameters.AddWithValue("@image_path", imgpath)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using
        BindGrid()
    End Sub

    Protected Sub DeleteVehicle(ByVal sender As Object, ByVal e As EventArgs) Handles btnDeleteVehicle.Click
        Using conn As New SqlConnection(connectionString)
            Dim query As String = "DELETE FROM c_vehciles car_id = @car_id"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@car_id", txtVehicleID.Text)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using
        BindGrid()
    End Sub
End Class