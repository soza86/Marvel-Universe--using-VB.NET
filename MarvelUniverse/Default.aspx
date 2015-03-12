<%@ Page Title="Marvel Universe" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="MarvelUniverse._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 575px;
            height: 330px;
        }
        .style2
        {
            width: 331px;
            height: 330px;
        }
        .style3
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
        .style4
        {
            text-align: center;
        }
        .style5
        {
            font-family: Nyala;
            font-size: large;
            color: #000000;
            font-weight: bold;
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p class="style4">
        <br />
        <span class="style3">THIS IS A SITE DEDICATED TO THE MARVEL UNIVERSE AND IT IS CREATED, BY FAN, FOR 
        THE FANS!!!</span></p>
    <p>
        <img alt="" class="style1" src="Images/marveluniverse.jpg" /> <img alt="" 
            class="style2" src="Images/marveluniverse2.jpg" /></p>
    <p class="style5"> ARE YOU A MARVEL FAN? HERE IS YOUR CHANCE TO BE A PART OF THIS 
        TRY, AS YOU SEE AND CONTRIBUTE TO THIS SITE WITH VARIOUS CHARACTERS FROM THE 
        MARVEL UNIVERSE, ADD INFORMATION, PICTURES ABOUT THEM, RATE, COMMENT THEM AND 
        MORE.</p>
    <p class="style5"> ALSO, THIS SITE GIVES YOU THE OPPORTUNITY TO PUBLISH YOUR OWN CREATED SUPERHERO 
        AND LET OTHER USERS SEE HIM/HER AND TELL THEIR OPINION ABOUT HIM/HER.</p>
    <p class="style5"><br /><p class="style5">&nbsp; TOP RATED CHARACTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOP RATED CUSTOM MADE CHARACTER</p>
    <table width="95%">
    <tr align="left">
    <td>
        <asp:DataList ID="DataList1" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyField="ID" DataSourceID="SqlDataSource1" GridLines="Both">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <ItemStyle BackColor="White" ForeColor="#003399" />
            <ItemTemplate>
                <%# Eval("CharacName") %>
                <br />
                <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                <br />
                Rating: <%# Eval("AverageRating") %>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [CharacName], [Picture], [AverageRating] FROM [TopRatedCharacter]">
        </asp:SqlDataSource></td>
    </p>
    
    <p class="style5"><td> 
        <asp:DataList ID="DataList2" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DataKeyField="ID" DataSourceID="SqlDataSource2" 
            GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <%# Eval("CharacName") %>
                <br />
                <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                <br />
                Rating: <%# Eval("AverageRating") %>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT [ID], [CharacName], [Picture], [AverageRating] FROM [TopRatedCMCharacter]">
        </asp:SqlDataSource></td>
    </p>
    </tr>
    </table><br /><p class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TOP RATED IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOP RATED CUSTOM MADE IMAGE</p><br />
    <table width="95%">
    <tr>
    <p class="style5"> <td>
        <asp:DataList ID="DataList3" runat="server" DataKeyField="ID" 
            DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingItemStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
            <ItemTemplate>
                <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                <br />
                Rating: <%# Eval("AverageRating") %>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [ID], [Picture], [AverageRating] FROM [TopRatedPicture]">
        </asp:SqlDataSource></td>
    </p>
    <p class="style5"> <td>
        <asp:DataList ID="DataList4" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DataKeyField="ID" DataSourceID="SqlDataSource4" 
            GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <img src='<%# Eval("Picture") %>' height="200px" width="200px" />
                <br />
                Rating: <%# Eval("AverageRating") %>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ExistingConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ExistingConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT [ID], [Picture], [AverageRating] FROM [TopRatedCMPicture]">
        </asp:SqlDataSource></td>
        </tr>
        </table>
    </p>
    </asp:Content>
