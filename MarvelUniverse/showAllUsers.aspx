<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="showAllUsers.aspx.vb" Inherits="MarvelUniverse.showAllUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:TextBox ID="tb_Search" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Search Profile" />
    </p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
            DataSourceID="SqlDataSource1" GroupItemCount="5">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;">
                    <img src='<%# Eval("Picture") %>' />
                    <br />
                    <%# Eval("FirstLastName") %> 
                    <br />
                    <a href='Profile.aspx?FanName=<%# Eval("FanName") %>'>
                    <%# Eval("FanName") %>
                    </a>
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />FirstLastName:
                    <asp:TextBox ID="FirstLastNameTextBox" runat="server" 
                        Text='<%# Bind("FirstLastName") %>' />
                    <br />Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" 
                        Text='<%# Bind("Picture") %>' />
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
                    FirstLastName:
                    <asp:TextBox ID="FirstLastNameTextBox" runat="server" 
                        Text='<%# Bind("FirstLastName") %>' />
                    <br />Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" 
                        Text='<%# Bind("Picture") %>' />
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
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                    <img src='<%# Eval("Picture") %>' />
                    <br />
                    <%# Eval("FirstLastName") %> 
                    <br />
                    <a href='Profile.aspx?FanName=<%# Eval("FanName") %>'>
                    <%# Eval("FanName") %>
                    </a>
                    <br />
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
                                        ShowLastPageButton="True" />
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
                    <br />FirstLastName:
                    <asp:Label ID="FirstLastNameLabel" runat="server" 
                        Text='<%# Eval("FirstLastName") %>' />
                    <br />Picture:
                    <asp:Label ID="PictureLabel" runat="server" 
                        Text='<%# Eval("Picture") %>' />
                    <br />FanName:
                    <asp:Label ID="FanNameLabel" runat="server" Text='<%# Eval("FanName") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [FirstLastName], [Picture], [FanName] FROM [Profile] WHERE (([FirstLastName] LIKE '%' +@FirstLastName+ '%') OR ([FanName] LIKE '%' +@FanName+ '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="tb_Search" Name="FirstLastName" 
                    PropertyName="Text" Type="String" DefaultValue="%" />
                <asp:ControlParameter ControlID="tb_Search" Name="FanName" PropertyName="Text" 
                    Type="String" DefaultValue="%" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
