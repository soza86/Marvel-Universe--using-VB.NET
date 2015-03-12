<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="VillainsList.aspx.vb" Inherits="MarvelUniverse.VillainsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Papyrus;
            font-weight: bold;
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /><asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
        DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
        <ItemTemplate>
            <asp:HyperLink ID="link" NavigateUrl='<%#"CharacterByTag.aspx?Tag=" & Eval("Tag")%>' Target='_blank' runat="server" Text='<%# Eval("Tag") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT [ID], [Tag] FROM [Tags]"></asp:SqlDataSource>
    <br />
    </br>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="200px" 
        Width="600px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
        BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" 
        AllowPaging="True" AllowSorting="True" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="CharacName" HeaderText="Villain Name" 
                SortExpression="CharacName" >
            </asp:BoundField>
            <asp:BoundField DataField="AlterEgoName" HeaderText="Alter Ego Name" 
                SortExpression="AlterEgoName" />
            <asp:ImageField DataImageUrlField="Picture" HeaderText="Picture">
                <ControlStyle Height="150px" Width="150px" />
            </asp:ImageField>
            <asp:TemplateField HeaderText="More Details">
            <ItemTemplate>
                 <asp:HyperLink ID="link" NavigateUrl='<%#"Details.aspx?ID=" & Eval("ID")%>' Target='_blank' runat="server">
                     <asp:Image ID="image" runat="server" ImageUrl="~/Images/details.jpg" />
                 </asp:HyperLink>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image Gallery">
            <ItemTemplate>
                 <asp:HyperLink ID="link" NavigateUrl='<%#"CharacterPictures.aspx?CharacID=" & Eval("ID")%>' Target='_blank' runat="server">
                     <asp:Image ID="image" runat="server" ImageUrl="~/Images/imagebutton.jpg" />
                 </asp:HyperLink>
             </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT [ID], [CharacName], [AlterEgoName], [Picture], [IsHero] FROM [Existing] WHERE (([IsHero] = ?) AND (([CharacName] LIKE '%' +@CharacName+ '%') OR ([AlterEgoName] LIKE '%' +@AlterEgoName+ '%')))">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="IsHero" Type="String" />
            <asp:ControlParameter ControlID="tb_Search" Name="CharacName" 
                PropertyName="Text" Type="String" DefaultValue="%" />
            <asp:ControlParameter ControlID="tb_Search" Name="AlterEgoName" 
                PropertyName="Text" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
    <span class="style1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter 
    Villains/Alter ego's name to find:</span> <asp:TextBox ID="tb_Search" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search Villain" />
    </asp:Content>
