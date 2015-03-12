<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ShowOneCMPicture.aspx.vb" Inherits="MarvelUniverse.ShowOneCMPicture" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            font-size: x-large;
            color: #000000;
            font-weight: bold;
        }
        .emptypng { background-image: url(Images/empty.png); width: 32px; height: 32px; }
        .smileypng { background-image: url(Images/pictureratingicon.png); width: 32px; height: 32px; }
        .donesmileypng { background-image: url(Images/pictureratingicon.png); width: 32px; height: 32px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ImageField DataImageUrlField="Picture">
                    <ControlStyle Height="600px" Width="900px" />
                </asp:ImageField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [ID], [Picture], [FanName], [CMCharacID] FROM [CMCharactersPictures] WHERE ([ID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style1">
        SHOW COMMENTS</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
            CellSpacing="1" DataSourceID="SqlDataSource2">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
                <%# Eval("Comment") %>
                <br />
                Posted By:
                <asp:Label ID="FanNameLabel" runat="server" Text='<%# Eval("FanName") %>' />
                
                Date Posted:
                <asp:Label ID="AddedDateLabel" runat="server" Text='<%# Eval("AddedDate") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [Comment], [FanName], [Pic_ID], [AddedDate] FROM [PictureCMComments] WHERE ([Pic_ID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Pic_ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style1">
        POST YOUR COMMENT:</p>
    <p class="style1">
        <asp:TextBox ID="tb_Comment" runat="server" Height="100px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox>
    </p>
    <p class="style1">
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
<br />
<br />
<br />
<asp:Button ID="btn_SubmitRating" runat="server" Text="submit your rating" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
