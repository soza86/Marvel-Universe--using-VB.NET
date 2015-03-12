Imports System.Data.OleDb

Public Class CustomMadeCharacter
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_Submit_Click(sender As Object, e As EventArgs) Handles btn_Submit.Click
        Dim myGUID As New System.Guid
        myGUID = Guid.NewGuid()
        Dim NewFileName = myGUID.ToString() + ".jpg"

        If fu_Picture.HasFile Then
            Dim fileLocationOnServerHardDisk = Request.MapPath("CustomMadeCharactersPicture") & "/" & NewFileName
            fu_Picture.SaveAs(fileLocationOnServerHardDisk)
        End If

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into CustomMade(CharacName,AlterEgoName,Abilities,AlterEgoAbilities,BackgroundStory,Gender,IsHero,Picture,FanName) Values (@f1,@f2,@f3,@f4,@f5,@f6,@f7,@f8,@f9)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", tb_CharacName.Text)
        cmd.Parameters.AddWithValue("@f2", tb_AlterEgoName.Text)
        cmd.Parameters.AddWithValue("@f3", tb_Abilities.Text)
        cmd.Parameters.AddWithValue("@f4", tb_AlterEgoAbilities.Text)
        cmd.Parameters.AddWithValue("@f5", tb_BackgroundStory.Text)
        cmd.Parameters.AddWithValue("@f6", rbl_Gender.SelectedValue)
        cmd.Parameters.AddWithValue("@f7", rbl_Status.SelectedValue)
        cmd.Parameters.AddWithValue("@f8", "CustomMadeCharactersPicture/" & NewFileName)
        cmd.Parameters.AddWithValue("@f9", User.Identity.Name)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("CustomMadeConfirmation.aspx")
    End Sub
End Class