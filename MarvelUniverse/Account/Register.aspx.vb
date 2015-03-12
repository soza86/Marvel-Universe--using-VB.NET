Imports System.Data.OleDb

Public Class Register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString("ReturnUrl")
    End Sub

    Protected Sub RegisterUser_CreatedUser(ByVal sender As Object, ByVal e As EventArgs) Handles RegisterUser.CreatedUser
        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, False)

        Dim continueUrl As String = RegisterUser.ContinueDestinationPageUrl
        If String.IsNullOrEmpty(continueUrl) Then
            continueUrl = "~/"
        End If

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into Profile (FanName) VALUES (@f1)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        oleDbConn.Open()
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", RegisterUser.UserName)
        cmd.ExecuteNonQuery()

        Response.Redirect("~/EditProfile.aspx")
    End Sub
End Class