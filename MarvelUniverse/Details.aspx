<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.vb" Inherits="MarvelUniverse.Details" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .emptypng { background-image: url(Images/empty.png); width: 32px; height: 32px; }
        .smileypng { background-image: url(Images/ratingicon.png); width: 32px; height: 32px; }
        .donesmileypng { background-image: url(Images/ratingicon.png); width: 32px; height: 32px; }
        .style1
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="200px" 
        Width="600px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
        BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="CharacName" HeaderText="Character Name" 
                SortExpression="CharacName" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="AlterEgoName" HeaderText="Alter Ego Name" 
                SortExpression="AlterEgoName" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Abilities" HeaderText="Abilities" 
                SortExpression="Abilities" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="AlterEgoAbilities" HeaderText="Alter Ego Abilities" 
                SortExpression="AlterEgoAbilities" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="BackgroundStory" HeaderText="Background Story" 
                SortExpression="BackgroundStory" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" 
                SortExpression="CreatedBy" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="FirstAppearance" HeaderText="First Appearance" 
                SortExpression="FirstAppearance" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="NotableEnemies" HeaderText="Notable Enemies" 
                SortExpression="NotableEnemies" >
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT [ID], [CharacName], [AlterEgoName], [Abilities], [AlterEgoAbilities], [BackgroundStory], [CreatedBy], [FirstAppearance], [NotableEnemies], [Picture], [IsHero] FROM [Existing] WHERE ([ID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource></br>
    <span class="style1">&lt;------------------------------------COMMENTS POSTED BY 
    USERS-----------------------------------------&gt;</span><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4"  ForeColor="#333333" 
        GridLines="None" Width="317px"  
        >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
            <asp:BoundField DataField="Title" HeaderText="Title" 
                SortExpression="Title" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                SortExpression="Comment" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Author], [Title], [Comment] FROM [Comments] WHERE ([Charac_fkid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Charac_fkid" QueryStringField="ID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <span class="style1">&lt;---------------------------ADD YOUR COMMENT ABOUT THE CHARACTER 
    HERE--------------------&gt;</span><br />
    <br />
    <p style="color:black;">Title of the comment:&nbsp;</p>
    <asp:TextBox ID="tb_Title" runat="server"></asp:TextBox>
    <br />
    <br />
    <p style="color:black;">Your comment:&nbsp;</p>
    <asp:TextBox ID="tb_Comment" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btn_SubmitComment" runat="server" Text="Submit Comment" />
    <br />
    <br />
    <br />
    <span class="style1">&lt;--------------------TAG THIS CHARACTER FROM THE LIST OF AVAILABLE TAGS 
    ------------------&gt;</span><br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="TagsDataSource" DataTextField="Tag" DataValueField="ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="TagsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
        SelectCommand="SELECT [ID], [Tag] FROM [Tags]"></asp:SqlDataSource>
    <br />
    <span class="style1">&lt;-------------------------------------ADD YOUR OWN TAG 
    HERE--------------------------------------------&gt;</span><br />
    <br />
    <p style="color:black;">Add your own tag:&nbsp;</p>
    <asp:TextBox ID="tb_AddTag" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="btn_TagCharacter" runat="server" Text="Tag this Character" />
    <br />
    <br />
    <br />
    <span class="style1">&lt;---------------------------------------RATE THIS CHARACTER-----------------------------------------------&gt;</span><br />

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br />
    <asp:Rating ID="Rating1" runat="server" CurrentRating="3" MaxRating="5" EmptyStarCssClass="emptypng" FilledStarCssClass="smileypng" StarCssClass="smileypng" WaitingStarCssClass="donesmileypng">
    </asp:Rating>
    <br />

    <br />
    <asp:Button ID="btn_SubmitRating" runat="server" Text="Submit your rate" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
</asp:Content>
