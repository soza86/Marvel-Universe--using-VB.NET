<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomMadeHeroes.aspx.vb" Inherits="MarvelUniverse.CustomMadeHeroes" %>
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
    <p>
        &nbsp;</p>
    <p>
        &nbsp;<span class="style1">Search hero by name or by creator of the character:</span>&nbsp; <asp:TextBox ID="tb_Search" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search Hero" />
        <br />
        <br /><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" 
            AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="200px" 
            Width="600px">
            <Columns>
                <asp:BoundField DataField="CharacName" HeaderText="Hero Name" 
                    SortExpression="CharacName" />
                <asp:BoundField DataField="AlterEgoName" HeaderText="Alter Ego Name" 
                    SortExpression="AlterEgoName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:ImageField DataImageUrlField="Picture" HeaderText="Picture">
                    <ControlStyle Height="150px" Width="150px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="More Details">
                <ItemTemplate>
                        <asp:HyperLink ID="link" NavigateUrl='<%#"CustomMadeDetails.aspx?ID=" & Eval("ID")%>' Target='_blank' runat="server">
                            <asp:Image ID="image" runat="server" ImageUrl="~/Images/details.jpg" />
                    </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image Gallery">
                <ItemTemplate>
                        <asp:HyperLink ID="link" NavigateUrl='<%#"CMCharacterPictures.aspx?CMCharacID=" & Eval("ID")%>' Target='_blank' runat="server">
                             <asp:Image ID="image" runat="server" ImageUrl="~/Images/imagebutton.jpg" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FanName" HeaderText="Posted By" 
                    SortExpression="FanName" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [CharacName], [AlterEgoName], [Gender], [IsHero], [Picture], [FanName] FROM [CustomMade] WHERE (([IsHero] = ?) AND (([CharacName] LIKE '%' +@CharacName+ '%') OR ([FanName] LIKE '%' +@FanName+ '%')))">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsHero" Type="String" />
                <asp:ControlParameter ControlID="tb_Search" Name="CharacName" 
                    PropertyName="Text" Type="String" DefaultValue="%" />
                <asp:ControlParameter ControlID="tb_Search" Name="FanName" PropertyName="Text" 
                    Type="String" DefaultValue="%" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
