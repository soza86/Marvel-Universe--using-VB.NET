Imports System.Data.OleDb

Public Class CMCharacterPictures
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_SubmitPicture_Click(sender As Object, e As EventArgs) Handles btn_SubmitPicture.Click
        Dim myGUID As New System.Guid
        myGUID = Guid.NewGuid()
        Dim NewFileName = myGUID.ToString() + ".jpg"

        If fup_NewPicture.HasFile Then
            Dim fileLocationOnServerHardDisk = Request.MapPath("CustomMadeCharactersPicture") & "/" & NewFileName
            fup_NewPicture.SaveAs(fileLocationOnServerHardDisk)
        End If

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into CMCharactersPictures(Picture,FanName,CMCharacID) Values (@f1,@f2,@f3)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", "CustomMadeCharactersPicture/" & NewFileName)
        cmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        cmd.Parameters.AddWithValue("@f3", Request.Params("CMCharacID"))
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("AddPictureConfirmation.aspx")
    End Sub
End Class