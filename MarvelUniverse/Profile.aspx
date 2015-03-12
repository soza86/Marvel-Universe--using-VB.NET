<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.vb" Inherits="MarvelUniverse.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            color: #000000;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br /><span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    DETAILS</span><br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            GridLines="Horizontal" Height="101px" Width="400px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="FirstLastName" HeaderText="FirstLastName" 
                    SortExpression="FirstLastName" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
                    SortExpression="DateOfBirth" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="AboutMe" HeaderText="AboutMe" 
                    SortExpression="AboutMe" />
                <asp:BoundField DataField="FacebookLink" HeaderText="FacebookLink" 
                    SortExpression="FacebookLink" />
                <asp:BoundField DataField="FavouriteCharacter" HeaderText="FavouriteCharacter" 
                    SortExpression="FavouriteCharacter" />
                <asp:BoundField DataField="FavouriteComicBook" HeaderText="FavouriteComicBook" 
                    SortExpression="FavouriteComicBook" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [FirstLastName], [DateOfBirth], [Gender], [Country], [AboutMe], [FacebookLink], [FavouriteCharacter], [FavouriteComicBook], [FanName] FROM [Profile] WHERE ([FanName] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="FanName" QueryStringField="FanName" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource><br /><span class="style1">PROFILE PICTURE</span><br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
            DataSourceID="SqlDataSource2" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="">
                   <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="">
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                    <br />FanName:
                    <asp:TextBox ID="FanNameTextBox" runat="server" Text='<%# Bind("FanName") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                    <br />FanName:
                    <asp:TextBox ID="FanNameTextBox" runat="server" Text='<%# Bind("FanName") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="">
                    <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    <br />Picture:
                    <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                    <br />FanName:
                    <asp:Label ID="FanNameLabel" runat="server" Text='<%# Eval("FanName") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [Picture], [FanName] FROM [Profile] WHERE ([FanName] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="FanName" QueryStringField="FanName" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
        <asp:Button ID="btn_EditProfile" runat="server" 
            PostBackUrl="~/EditProfile.aspx" Text="Edit your Profile" />
    </p>
</asp:Content>
