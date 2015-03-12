<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewCustomMadeCharacter.aspx.vb" Inherits="MarvelUniverse.CustomMadeCharacter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            text-align: justify;
            font-family: Andalus;
            font-style: italic;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
        }
        .style3
        {
            font-family: "Segoe UI Semibold";
            font-size: large;
            color: #000000;
            font-weight: bold;
            text-decoration: underline;
        }
        .style9
        {
            font-family: "Segoe UI";
            font-weight: bold;
            font-size: small;
            color: #000000;
        }
        .style11
        {
            font-family: "Segoe UI";
            font-size: small;
            color: #000000;
            font-weight: bold;
            text-decoration: underline;
        }
        .style13
        {
            font-family: "Segoe UI Semibold";
            font-size: large;
            color: #000000;
            font-weight: bold;
        }
        .style14
        {
            font-family: Nyala;
            font-size: x-large;
            color: #0000FF;
            font-weight: bold;
            text-decoration: underline;
        }
        .style15
        {
            font-family: Papyrus;
            font-size: medium;
        }
        .style16
        {
            font-family: Papyrus;
            font-weight: bold;
            font-size: medium;
            color: #000000;
        }
        .style4
        {
            font-family: Papyrus;
            font-size: large;
            color: #FF0000;
        }
    .style17
    {
        font-weight: normal;
    }
    .style18
    {
        font-family: Papyrus;
        font-size: large;
        color: #000000;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="style2">
        Here you can add your own creation!!! You can add different information about 
        your character such as abilities, background story, choose its gender and status 
        (hero or villain) and upload your artwork!!!</p>
    <p class="style14">
        Name(s) for the character</p>
    <p class="style9">
        <span class="style15">Enter your character&#39;s name:&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="tb_CharacName" runat="server" Height="30px" Width="150px"></asp:TextBox>
        </p>
    <p class="style9">
        <span class="style15">Enter your character&#39;s alter ego name: </span>&nbsp;
        <asp:TextBox ID="tb_AlterEgoName" runat="server" Height="30px" Width="150px"></asp:TextBox>
        </p>
    <p class="style14">
        Abilities</p>
    <p class="style16">
        Enter your character&#39;s abilities:</p>
    <p class="style3">
        <asp:TextBox ID="tb_Abilities" runat="server" TextMode="MultiLine" 
            Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p class="style16">
        Enter your character&#39;s alter ego abilities:</p>
    <p class="style3">
        <asp:TextBox ID="tb_AlterEgoAbilities" runat="server" TextMode="MultiLine" 
            Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p class="style14">
        Other information</p>
    <p class="style16">
        Enter the background story of your character:</p>
    <p class="style3">
        <asp:TextBox ID="tb_BackgroundStory" runat="server" TextMode="MultiLine" 
            Height="115px" Width="410px"></asp:TextBox>
    </p>
    <p class="style9">
        <span class="style15">Choose your character&#39;s gender:</span>
        <asp:RadioButtonList ID="rbl_Gender" runat="server" 
            RepeatDirection="Horizontal" ForeColor="#CC0000">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p class="style16">
        Choose if your character is a hero or a villain:</p>
    <p class="style11">
        <asp:RadioButtonList ID="rbl_Status" runat="server" 
            RepeatDirection="Horizontal" ForeColor="Red">
            <asp:ListItem Value="True">Hero</asp:ListItem>
            <asp:ListItem Value="False">Villain</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p class="style14">
        Picture</p><span class="style4">(Upload .jpg images </span> <strong>
<span class="style18">ONLY</span></strong><span class="style4"><strong 
    class="style17">
    </strong>, other extensions are not supported)</span><br />
    <p class="style16">
        Upload a picture of your character:</p>
    <p class="style3">
        <asp:FileUpload ID="fu_Picture" runat="server" />
    </p>
    <p class="style14">
        Submit</p>
    <p class="style13">
        <span class="style16">Submit the character:</span>&nbsp; <span class="style3">
        <asp:Button ID="btn_Submit" runat="server" Text="Submit" Height="30px" 
            Width="100px" />
        </span></p>
</asp:Content>
