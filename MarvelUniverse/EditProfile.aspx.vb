Imports System.Data.OleDb

Public Class EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
            Dim SqlString As String = "SELECT * FROM Profile WHERE FanName=@f1"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", User.Identity.Name)
            oleDbConn.Open()
            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            If dr.HasRows Then
                dr.Read()
                If Not IsDBNull(dr("FirstLastName")) Then tb_FLName.Text = dr("FirstLastName")
                If Not IsDBNull(dr("DateOfBirth")) Then DOBCalendar.Text = dr("DateOfBirth")
                If Not IsDBNull(dr("Gender")) Then cbl_Gender.SelectedValue = dr("Gender")
                If Not IsDBNull(dr("Country")) Then tb_Country.Text = dr("Country")
                If Not IsDBNull(dr("AboutMe")) Then tb_AboutMe.Text = dr("AboutMe")
                If Not IsDBNull(dr("FacebookLink")) Then tb_FacebookLink.Text = dr("FacebookLink")
                If Not IsDBNull(dr("FavouriteCharacter")) Then tb_FavouriteCharacter.Text = dr("FavouriteCharacter")
                If Not IsDBNull(dr("FavouriteComicBook")) Then tb_FavouriteComic.Text = dr("FavouriteComicBook")
            End If
        End If
    End Sub

    Protected Sub btn_SubmitProfile_Click(sender As Object, e As EventArgs) Handles btn_SubmitProfile.Click
        Dim newFileName As String = ""
        Dim SqlString As String
        If fu_ProfilePicture.HasFile Then
            Dim myGUID = Guid.NewGuid()
            newFileName = myGUID.ToString() & ".jpg"
            Dim fileLocationOnServerHardDisk = Request.MapPath("ProfilePictures") & "/" & newFileName
            fu_ProfilePicture.SaveAs(fileLocationOnServerHardDisk)
        End If
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        If fu_ProfilePicture.HasFile Then
            SqlString = "UPDATE Profile SET FirstLastName=@f1,DateOfBirth=@f2,Gender=@f3,Country=@f4,AboutMe=@f5,FacebookLink=@f6,FavouriteCharacter=@f7,FavouriteComicBook=@f8,Picture=@f9 WHERE FanName=@f10"
        Else
            SqlString = "UPDATE Profile SET FirstLastName=@f1,DateOfBirth=@f2,Gender=@f3,Country=@f4,AboutMe=@f5,FacebookLink=@f6,FavouriteCharacter=@f7,FavouriteComicBook=@f8 WHERE FanName=@f10"
        End If

        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", tb_FLName.Text)
        cmd.Parameters.AddWithValue("@f2", DOBCalendar.Text)
        cmd.Parameters.AddWithValue("@f3", cbl_Gender.SelectedValue)
        cmd.Parameters.AddWithValue("@f4", tb_Country.Text)
        cmd.Parameters.AddWithValue("@f5", tb_AboutMe.Text)
        cmd.Parameters.AddWithValue("@f6", tb_FacebookLink.Text)
        cmd.Parameters.AddWithValue("@f7", tb_FavouriteCharacter.Text)
        cmd.Parameters.AddWithValue("@f8", tb_FavouriteComic.Text)
        If fu_ProfilePicture.HasFile Then cmd.Parameters.AddWithValue("@f9", "ProfilePictures/" & newFileName)
        cmd.Parameters.AddWithValue("@f10", User.Identity.Name)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        oleDbConn.Close()
        oleDbConn.Dispose()
        Response.Redirect("Profile.aspx?FanName=" & User.Identity.Name)

    End Sub

End Class