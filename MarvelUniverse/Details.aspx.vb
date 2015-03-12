Imports System.Data.OleDb

Public Class Details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If Request.Params("ID") = "" Then Response.Redirect("HeroesList.aspx")
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
            Dim SqlString As String = "SELECT * FROM Comments WHERE Charac_fkid=@f1"
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
        Dim SqlString As String = "Insert into Comments(Author,Title,Comment,Charac_fkid) Values (@f1,@f2,@f3,@f4)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", User.Identity.Name)
        cmd.Parameters.AddWithValue("@f2", tb_Title.Text)
        cmd.Parameters.AddWithValue("@f3", tb_Comment.Text)
        cmd.Parameters.AddWithValue("@f4", Request.Params("ID"))
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Dim fillComments As String = "SELECT * FROM Comments WHERE Charac_fkid=@f1"
        Dim fillCommentsCmd As OleDbCommand = New OleDbCommand(fillComments, oleDbConn)
        fillCommentsCmd.CommandType = CommandType.Text
        fillCommentsCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        Dim dataReader = fillCommentsCmd.ExecuteReader()
        GridView1.DataSource = dataReader
        GridView1.DataBind()
        tb_Title.Text = ""
        tb_Comment.Text = ""
    End Sub

    Protected Sub btn_TagCharacter_Click(sender As Object, e As EventArgs) Handles btn_TagCharacter.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        Dim SqlString As String = "Insert into CharacTagJunction(Charac_fkid,Tag_fkid) Values (@f1,@f2)"
        oleDbConn.Open()

        For Each cb As ListItem In DropDownList1.Items
            If cb.Selected Then
                Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
                cmd.CommandType = CommandType.Text
                cmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
                cmd.Parameters.AddWithValue("@f2", cb.Value)
                cmd.ExecuteNonQuery()
            End If
        Next

        If tb_AddTag.Text = "" Then Return
        Dim NewTags = tb_AddTag.Text.Split(",")
        For Each NewTag In NewTags
            Dim newTagSql As String = "INSERT INTO Tags(Tag) Values (@f1)"
            Dim cmd As OleDbCommand = New OleDbCommand(newTagSql, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", NewTag)
            cmd.ExecuteNonQuery()

            Dim getLastIdCmd As OleDbCommand = New OleDbCommand("SELECT TOP 1 ID from Tags ORDER BY ID DESC", oleDbConn)
            Dim dr = getLastIdCmd.ExecuteReader()
            dr.Read()
            Dim lastId = dr.GetValue(0)

            Dim newcmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            newcmd.CommandType = CommandType.Text
            newcmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
            newcmd.Parameters.AddWithValue("@f1", lastId)
            newcmd.ExecuteNonQuery()
        Next
    End Sub

    Protected Sub btn_SubmitRating_Click(sender As Object, e As EventArgs) Handles btn_SubmitRating.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("ExistingConnectionString").ConnectionString)
        OleDbConn.Open()
        Dim DelRatingSql As String = "Delete from CharacRatings WHERE RatingID=@f1 AND FanName=@f2"
        Dim DelRatingCmd As OleDbCommand = New OleDbCommand(DelRatingSql, OleDbConn)
        DelRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        DelRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        DelRatingCmd.ExecuteNonQuery()

        Dim AddRatingSql As String = "Insert into CharacRatings(RatingID,FanName,Rating) Values (@f1,@f2,@f3)"
        Dim AddRatingCmd As OleDbCommand = New OleDbCommand(AddRatingSql, oleDbConn)
        AddRatingCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
        AddRatingCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        AddRatingCmd.Parameters.AddWithValue("@f3", Rating1.CurrentRating)
        AddRatingCmd.ExecuteNonQuery()

        Label1.Text = "Thank you for adding your rating"
    End Sub
End Class