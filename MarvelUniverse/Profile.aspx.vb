Public Class Profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("FanName") = User.Identity.Name Then
            btn_EditProfile.Visible = True
        Else
            btn_EditProfile.Visible = False
        End If

    End Sub

End Class