<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomMadeVillains.aspx.vb" Inherits="MarvelUniverse.CustomMadeVillains" %>
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
        <span class="style1">Search villain by name or by create or of the character:</span> 
        <asp:TextBox ID="tb_Search" runat="server"></asp:TextBox> 
        <asp:Button ID="Button1" runat="server" Text="Search Villain" /> </p>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            GridLines="None" HorizontalAlign="Center" CellSpacing="1" Height="200px" 
            Width="600px">
            <Columns>
                <asp:BoundField DataField="CharacName" HeaderText="Villain Name" 
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
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [CharacName], [AlterEgoName], [Gender], [IsHero], [Picture], [FanName] FROM [CustomMade] WHERE (([IsHero] = ?) AND (([CharacName] LIKE '%' +@CharacName+ '%') OR ([FanName] LIKE '%' +@FanName+ '%')))">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="IsHero" Type="String" />
                <asp:ControlParameter ControlID="tb_Search" Name="CharacName" 
                    PropertyName="Text" Type="String" DefaultValue="%" />
                <asp:ControlParameter ControlID="tb_Search" Name="FanName" PropertyName="Text" 
                    Type="String" DefaultValue="%" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
