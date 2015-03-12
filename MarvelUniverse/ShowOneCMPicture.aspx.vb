Imports System.Data.OleDb

Public Class ShowOneCMPicture
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub btn_SubmitRating_Click(sender As Object, e As EventArgs) Handles btn_SubmitRating.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        oleDbConn.Open()
        Dim DelRatingSql As String = "Delete from PictureCMRatings WHERE RatingID=@f1 AND FanName=@f2"
        Dim DelRatingCmd As OleDbCommand = New OleDbCommand(DelRatingSql, oleDbConn)
        DelRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        DelRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        DelRatingCmd.ExecuteNonQuery()

        Dim AddRatingSql As String = "Insert into PictureCMRatings(RatingID,FanName,Rating) Values (@f1,@f2,@f3)"
        Dim AddRatingCmd As OleDbCommand = New OleDbCommand(AddRatingSql, oleDbConn)
        AddRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        AddRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        AddRatingCmd.Parameters.AddWithValue("@f3", Rating1.CurrentRating)
        AddRatingCmd.ExecuteNonQuery()
        Label1.Text = "Thank you for adding your rating"
    End Sub

    Protected Sub btn_SubmitComment_Click(sender As Object, e As EventArgs) Handles btn_SubmitComment.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into PictureCMComments(Comment,FanName,Pic_ID,AddedDate) Values (@f1,@f2,@f3,@f4)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", tb_Comment.Text)
        cmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        cmd.Parameters.AddWithValue("@f3", Request.Params("ID"))
        cmd.Parameters.AddWithValue("@f4", DateTime.Now.Date)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("CommentConfirmation.aspx")
    End Sub
End Class