Imports System.Data.OleDb

Public Class NewExistingHero
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_Submit_Click(sender As Object, e As EventArgs) Handles btn_Submit.Click
        Dim myGUID As New System.Guid
        myGUID = Guid.NewGuid()
        Dim NewFileName = myGUID.ToString() + ".jpg"

        If fu_Picture.HasFile Then
            Dim fileLocationOnServerHardDisk = Request.MapPath("Picture") & "/" & NewFileName
            fu_Picture.SaveAs(fileLocationOnServerHardDisk)
        End If

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into Existing(CharacName,AlterEgoName,Abilities,AlterEgoAbilities,BackgroundStory,CreatedBy,FirstAppearance,NotableEnemies,Picture,IsHero,Fan) Values (@f1,@f2,@f3,@f4,@f5,@f6,@f7,@f8,@f9,@f10,@f11)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", tb_CharacName.Text)
        cmd.Parameters.AddWithValue("@f2", tb_AlterEgoName.Text)
        cmd.Parameters.AddWithValue("@f3", tb_Abilities.Text)
        cmd.Parameters.AddWithValue("@f4", tb_AlterEgoAbilities.Text)
        cmd.Parameters.AddWithValue("@f5", tb_BackgroundStory.Text)
        cmd.Parameters.AddWithValue("@f6", tb_CreatedBy.Text)
        cmd.Parameters.AddWithValue("@f7", tb_FirstAppearance.Text)
        cmd.Parameters.AddWithValue("@f8", tb_NotableEnemies.Text)
        cmd.Parameters.AddWithValue("@f9", "Picture/" & NewFileName)
        cmd.Parameters.AddWithValue("@f10", rbl_status.SelectedValue)
        cmd.Parameters.AddWithValue("@f11", User.Identity.Name)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("Confirmation.aspx")
    End Sub
End Class