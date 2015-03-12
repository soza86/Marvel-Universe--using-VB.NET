<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomMadeConfirmation.aspx.vb" Inherits="MarvelUniverse.CustomMadeConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Vrinda;
            font-size: x-large;
            color: #000000;
        }
        .style2
        {
            width: 761px;
            height: 1051px;
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
    <br /><br /> <p class="style3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Go back to heroes list:
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/CustomMadeHeroes.aspx">Heroes List</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style3">
        Go back to villains list:
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/CustomMadeVillains.aspx">Vilains List</asp:HyperLink>
        </span>
        </p>
    <p class="style1">
        <img alt="" class="style2" src="Images/CMconfirmationImage.jpg" /></p>
</asp:Content>
