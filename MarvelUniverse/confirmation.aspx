<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Confirmation.aspx.vb" Inherits="MarvelUniverse.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 730px;
            height: 1320px;
        }
        .style3
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /></br><p>
        <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Go back to 
        heroes list:</span>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HeroesList.aspx">Heroes List</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp; <span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Go back to villains list:</span>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/VillainsList.aspx">Villains List</asp:HyperLink>
    </p>
    <p>
        <img alt="" class="style1" src="Images/ConfirmationPicture.jpg" /></p>
</asp:Content>
