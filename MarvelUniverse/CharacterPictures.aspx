<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CharacterPictures.aspx.vb" Inherits="MarvelUniverse.CharacterPictures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            font-size: x-large;
            color: #000000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
            DataSourceID="SqlDataSource1" GroupItemCount="4">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">
                    <a href='ShowOnePicture.aspx?ID=<%# Eval("ID") %>' target="_blank">
                        <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                    </a>
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                    <br />FanName:
                    <asp:TextBox ID="FanNameTextBox" runat="server" Text='<%# Bind("FanName") %>' />
                    <br />CharacID:
                    <asp:TextBox ID="CharacIDTextBox" runat="server" 
                        Text='<%# Bind("CharacID") %>' />
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
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                    <br />CharacID:
                    <asp:TextBox ID="CharacIDTextBox" runat="server" 
                        Text='<%# Bind("CharacID") %>' />
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
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                    <a href='ShowOnePicture.aspx?ID=<%# Eval("ID") %>' target="_blank">
                        <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                    </a>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" 
                    style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    <br />Picture:
                    <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                    <br />FanName:
                    <asp:Label ID="FanNameLabel" runat="server" Text='<%# Eval("FanName") %>' />
                    <br />CharacID:
                    <asp:Label ID="CharacIDLabel" runat="server" Text='<%# Eval("CharacID") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [Picture], [FanName], [CharacID] FROM [CharactersPictures] WHERE ([CharacID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CharacID" QueryStringField="CharacID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style1">
        Upload a new picture</p>
    <p>
        <asp:FileUpload ID="fup_NewPicture" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_SubmitPicture" runat="server" Text="Submit Picture" 
            Width="150px" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
