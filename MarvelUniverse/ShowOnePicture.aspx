<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ShowOnePicture.aspx.vb" Inherits="MarvelUniverse.ShowOnePicture" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
        .emptypng { background-image: url(Images/empty.png); width: 32px; height: 32px; }
        .smileypng { background-image: url(Images/pictureratingicon.png); width: 32px; height: 32px; }
        .donesmileypng { background-image: url(Images/pictureratingicon.png); width: 32px; height: 32px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:ImageField DataImageUrlField="Picture">
                    <ControlStyle Height="600px" Width="900px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [ID], [Picture], [FanName], [CharacID] FROM [CharactersPictures] WHERE ([ID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <span class="style1">SHOW COMMENTS</span>
    </p>
    <p>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" 
            HorizontalAlign="Left">
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <%# Eval("Comment") %>
                <br />
                Posted By:
                <asp:Label ID="FanNameLabel" runat="server" Text='<%# Eval("FanName") %>' />
                Date Posted:
                <asp:Label ID="AddedDateLabel" runat="server" Text='<%# Eval("AddedDate") %>' />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [Comment], [FanName], [Pic_ID], [AddedDate] FROM [PictureComments] WHERE ([Pic_ID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Pic_ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        POST YOUR COMMENT:
    </p>
    <p>
        <asp:TextBox ID="tb_Comment" runat="server" Height="100px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btn_SubmitComment" runat="server" Text="Submit" />
    </p>
    <p class="style1">
        RATE THIS PICTURE:</p>
    <p class="style1">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </p>
    <asp:Rating ID="Rating1" runat="server" CurrentRating="3" MaxRating="5" EmptyStarCssClass="emptypng" FilledStarCssClass="smileypng" StarCssClass="smileypng" WaitingStarCssClass="donesmileypng">
    </asp:Rating>
    <p>
        &nbsp;</p>
<p>
        <asp:Button ID="btn_SubmitRating" runat="server" Text="submit your rating" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
    </p>
</asp:Content>
