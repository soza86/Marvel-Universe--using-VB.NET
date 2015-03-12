<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CharacterByTag.aspx.vb" Inherits="MarvelUniverse.CharacterByTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Height="100px" HorizontalAlign="Center" 
        Width="200px">
        <Columns>
            <asp:BoundField DataField="CharacName" HeaderText="Character Name" 
                SortExpression="CharacName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT [CharacName], [Tag] FROM [CharacTagView] WHERE ([Tag] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Tag" QueryStringField="Tag" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
