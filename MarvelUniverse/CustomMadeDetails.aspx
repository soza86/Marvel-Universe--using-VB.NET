<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomMadeDetails.aspx.vb" Inherits="MarvelUniverse.CustomMadeDetails" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Papyrus;
            font-weight: bold;
            font-size: medium;
            color: #000000;
        }
        .style2
        {
            font-family: Nyala;
            font-size: x-large;
            color: #000000;
            font-weight: bold;
        }
        .emptypng { background-image: url(Images/empty.png); width: 32px; height: 32px; }
        .smileypng { background-image: url(Images/cmratingicon.png); width: 32px; height: 32px; }
        .donesmileypng { background-image: url(Images/cmratingicon.png); width: 32px; height: 32px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="style2">
        &lt;----------------------------------DETAILS ABOUT 
        CHARACTER---------------------------------------&gt;</p>
    <p>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            GridLines="Horizontal" Height="200px" Width="600px" 
            HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="CharacName" HeaderText="Character Name" 
                    SortExpression="CharacName" />
                <asp:BoundField DataField="AlterEgoName" HeaderText="Alter Ego Name" 
                    SortExpression="AlterEgoName" />
                <asp:BoundField DataField="Abilities" HeaderText="Abilities" 
                    SortExpression="Abilities" />
                <asp:BoundField DataField="AlterEgoAbilities" HeaderText="Alter Ego Abilities" 
                    SortExpression="AlterEgoAbilities" />
                <asp:BoundField DataField="BackgroundStory" HeaderText="Background Story" 
                    SortExpression="BackgroundStory" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [CharacName], [AlterEgoName], [Abilities], [AlterEgoAbilities], [BackgroundStory], [Gender], [IsHero], [Picture], [FanName] FROM [CustomMade] WHERE ([ID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style2">
        &lt;--------------------------------COMMENTS POSTED BY 
        USERS---------------------------------------&gt;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" Height="150px" Width="400px" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="Author" HeaderText="Author" 
                    SortExpression="Author" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Comment" HeaderText="Comment" 
                    SortExpression="Comment" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [Author], [Title], [Comment] FROM [CustomMadeComments] WHERE ([CMCharac_fkid] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CMCharac_fkid" QueryStringField="ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="style2">
    &lt;------------------------ADD YOUR COMMENT ABOUT THE CHARACTER 
        HERE-----------------&gt;</p>
    <p>
        <span class="style1">Title of the comment:&nbsp;</span>&nbsp;&nbsp;
        <asp:TextBox ID="tb_Title" runat="server" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p>
        <span class="style1">Your comment:&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tb_Comment" runat="server" TextMode="MultiLine" Height="120px" 
            Width="300px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btn_SubmitComment" runat="server" Text="Submit Comment" />
    </p>
    <p class="style2">
    &lt;----------------------------------------RATE THIS 
        CHARACTER----------------------------------------&gt;</p>
    <p>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </p>
    <p>
    </p>
    <asp:Rating ID="Rating1" runat="server" CurrentRating="3" MaxRating="5" EmptyStarCssClass="emptypng" FilledStarCssClass="smileypng" StarCssClass="smileypng" WaitingStarCssClass="donesmileypng">
    </asp:Rating>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btn_SubmitRate" runat="server" Text="Submit your rate" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
</asp:Content>
