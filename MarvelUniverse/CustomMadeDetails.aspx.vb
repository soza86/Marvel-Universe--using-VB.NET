Imports System.Data.OleDb

Public Class CustomMadeDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If Request.Params("ID") = "" Then Response.Redirect("CustomMadeHeroes.aspx")
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
            Dim SqlString As String = "SELECT * FROM CustomMadeComments WHERE CMCharac_fkid=@f1"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
            oleDbConn.Open()
            Dim dataReader = cmd.ExecuteReader()
            GridView1.DataSource = dataReader
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub btn_SubmitComment_Click(sender As Object, e As EventArgs) Handles btn_SubmitComment.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into CustomMadeComments(Author,Title,Comment,CMCharac_fkid) Values (@f1,@f2,@f3,@f4)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", User.Identity.Name)
        cmd.Parameters.AddWithValue("@f2", tb_Title.Text)
        cmd.Parameters.AddWithValue("@f3", tb_Comment.Text)
        cmd.Parameters.AddWithValue("@f4", Request.Params("ID"))
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Dim fillComments As String = "SELECT * FROM CustomMadeComments WHERE CMCharac_fkid=@f1"
        Dim fillCommentsCmd As OleDbCommand = New OleDbCommand(fillComments, oleDbConn)
        fillCommentsCmd.CommandType = CommandType.Text
        fillCommentsCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        Dim dataReader = fillCommentsCmd.ExecuteReader()
        GridView1.DataSource = dataReader
        GridView1.DataBind()
        tb_Title.Text = ""
        tb_Comment.Text = ""
    End Sub

    Protected Sub btn_SubmitRate_Click(sender As Object, e As EventArgs) Handles btn_SubmitRate.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        oleDbConn.Open()
        Dim DelRatingSql As String = "Delete from CMCharacRatings WHERE RatingID=@f1 AND FanName=@f2"
        Dim DelRatingCmd As OleDbCommand = New OleDbCommand(DelRatingSql, oleDbConn)
        DelRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        DelRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        DelRatingCmd.ExecuteNonQuery()

        Dim AddRatingSql As String = "Insert into CMCharacRatings(RatingID,FanName,Rating) Values (@f1,@f2,@f3)"
        Dim AddRatingCmd As OleDbCommand = New OleDbCommand(AddRatingSql, oleDbConn)
        AddRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        AddRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        AddRatingCmd.Parameters.AddWithValue("@f3", Rating1.CurrentRating)
        AddRatingCmd.ExecuteNonQuery()

        Label1.Text = "Thank you for adding your rating"
    End Sub
End Class