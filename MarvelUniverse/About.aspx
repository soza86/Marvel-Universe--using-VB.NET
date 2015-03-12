<%@ Page Title="About Us" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="About.aspx.vb" Inherits="MarvelUniverse.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            font-style: italic;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
        .style2
        {
            text-align: justify;
        }
        .style3
        {
            font-family: Nyala;
            font-style: italic;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p class="style2">
        <br />
        <span class="style1">THIS SITE IS DEDICATED TO THE MARVEL UNIVERSE. IT IS MY 
        FIRST TRY USING ASP.NET VB AND I WANTED IT TO MAKE IT AS FUNCTIONAL AND 
        USER-FRIENDLY I COULD.</span></p>
    <p class="style3">
        IT IS 2.0 USER CONTENT GENERATED WEBSITE AND, THUS, USERS ARE ENCOURAGED TO ADD 
        THEIR CONTENT TO THE SITE AND CONTRIBUTE TO THE SPREAD OF THE KNOWLEDGE OF THE 
        MARVEL UNIVERSE
    </p>
    <p class="style3">
        BEST VIEWED WITH GOOGLE CHROME!!!</p>
    </asp:Content>
