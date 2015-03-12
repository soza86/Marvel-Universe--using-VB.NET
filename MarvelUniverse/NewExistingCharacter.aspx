<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewExistingCharacter.aspx.vb" Inherits="MarvelUniverse.NewExistingHero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style4
        {
            font-family: "Segoe UI";
            font-weight: bold;
        }
        .style2
        {
            font-weight: 400;
            color: #000000;
        }
        .style6
        {
            text-align: justify;
            font-family: Andalus;
            font-style: italic;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
        .style9
        {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: small;
            color: #000000;
        }
        .style10
        {
            font-size: small;
            color: #000000;
        }
        .newStyle1
        {
            background-color: #00FF00;
        }
        .style11
        {
            font-family: Nyala;
            font-size: x-large;
            color: #0000FF;
            font-weight: bold;
            text-decoration: underline;
        }
        .style12
        {
            font-family: Papyrus;
            font-weight: bold;
            font-size: medium;
            color: #000000;
        }
        .style13
        {
            font-family: Papyrus;
            font-weight: bold;
            font-size: medium;
        }
        .style14
        {
            color: #000000;
        }
        .style15
        {
            font-family: Papyrus;
            font-weight: bold;
        }
        .style16
        {
            font-size: medium;
            color: #000000;
        }
        .style17
    {
        font-family: Papyrus;
        font-size: large;
        color: #FF0000;
    }
    .style19
    {
        font-family: Papyrus;
        font-size: large;
        color: #000000;
    }
        </style>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="style6">
        Here you can add a character that exists in the marvel universe,&nbsp; either 
        being a hero or a villain!!! You can add information about him/her such as 
        abilities, background story and more!!!</p>
    <p class="style11">
        Name(s) for the character</p>
    <p>
        <br />
        <span class="style12">Enter character&#39;s name:</span>&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="tb_CharacName" runat="server" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p>
        <span class="style12">Enter alter ego&#39;s name:&nbsp;</span><span class="style9">&nbsp;&nbsp; </span>
        &nbsp;<asp:TextBox ID="tb_AlterEgoName" runat="server" Height="30px" 
            Width="150px"></asp:TextBox>
    </p>
    <p class="style11">
        Abilities</p>
    <p class="style12">
        Enter character&#39;s abilities:</p>
    <p>
        &nbsp;<asp:TextBox ID="tb_Abilities" runat="server" TextMode="MultiLine" 
            Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p class="style12">
        Enter Alter Ego&#39;s abilities:</p>
    <p>
        &nbsp;<asp:TextBox ID="tb_AlterEgoAbilities" runat="server" 
            TextMode="MultiLine" Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p class="style11">
        Other information</p>
    <p class="style12">
        Enter the background story of the 
        character:</p>
    <p>
        <span class="style2"> &nbsp;</span><asp:TextBox ID="tb_BackgroundStory" 
            runat="server" CssClass="style2" 
            TextMode="MultiLine" Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p>
        <span class="style14"><span class="style13">Enter the name(s) of the creator of 
        the character:&nbsp;&nbsp;</span></span><span class="style10"><span class="style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span class="style2"> &nbsp;</span><asp:TextBox 
            ID="tb_CreatedBy" runat="server" CssClass="style2" Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p>
        <span class="style14"><span class="style13">Enter the comic where the character 
        first appeared:&nbsp;&nbsp;</span></span><span class="style10"><span class="style4">&nbsp;&nbsp;&nbsp; </span></span><span class="style2"> &nbsp;</span><asp:TextBox 
            ID="tb_FirstAppearance" runat="server" CssClass="style2" Height="30px" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        <span class="style16"><span class="style15">Enter the name of notable enemies of 
        the character: </span></span><span class="style2"> &nbsp;&nbsp;&nbsp; </span>
        <asp:TextBox ID="tb_NotableEnemies" runat="server" CssClass="style2" 
            Height="30px" Width="150px"></asp:TextBox>
    </p>
    <p class="style11">
        Picture</p><span class="style17">(Upload .jpg images </span>
<span class="style19"><strong>ONLY</strong></span><span class="style17"> , other extensions are not supported)</span><br />
    <p class="style12">
        Upload a picture of the character:</p>
    <p>
        <span 
            class="style2"> &nbsp;</span><asp:FileUpload ID="fu_Picture" runat="server" />
    </p>
    <p class="style11">
        &nbsp;Choose if the character is a hero or a villain</p>
    <p>
        <asp:RadioButtonList ID="rbl_status" runat="server" 
            RepeatDirection="Horizontal" ForeColor="Black">
            <asp:ListItem Value="True">Hero</asp:ListItem>
            <asp:ListItem Value="False">Villain</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p class="style11">
        Submit</p>
    <p>
        <span class="style12">Submit the character:</span>&nbsp;&nbsp;
        <asp:Button ID="btn_Submit" runat="server" Text="Submit" Height="30px" 
            Width="100px" />
    </p>
</asp:Content>
