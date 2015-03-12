<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditProfile.aspx.vb" Inherits="MarvelUniverse.EditProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
            text-decoration: underline;
        }
        .style2
        {
            font-family: Nyala;
            font-weight: bold;
            font-size: x-large;
            color: #000000;
            text-decoration: underline;
            text-align: justify;
        }
        .style3
        {
            font-family: Papyrus;
            font-size: medium;
            color: #000000;
            font-weight: bold;
        }
        .style4
        {
            font-family: Papyrus;
            font-size: large;
            color: #FF0000;
        }
        .style5
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <span class="style1">INFORMATION ABOUT YOU</span><br />
        </p>
    <p>
        <span class="style3">Enter your first and last name:</span>  <asp:TextBox ID="tb_FLName" runat="server" 
            Height="29px" Width="168px"></asp:TextBox>
    </p>
    <p class="style3">
        Choose your date of birth:</p>
    <p>
        <asp:TextBox ID="DOBCalendar" runat="server"></asp:TextBox>
        <asp:CalendarExtender ID="DOBCalendar_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="DOBCalendar">
        </asp:CalendarExtender>
    </p>
    <p>
        <span class="style3">Choose your gender:&nbsp;</span>
        <asp:CheckBoxList ID="cbl_Gender" runat="server" RepeatDirection="Horizontal" 
            ForeColor="Black">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:CheckBoxList>
    </p>
    <p>
        <span class="style3">Enter your country:</span>&nbsp;
        <asp:TextBox ID="tb_Country" runat="server" Height="25px" 
            style="margin-top: 0px" Width="128px"></asp:TextBox>
    </p>
    <p class="style3">
        Write anything about your self....</p>
    <p>
        <asp:TextBox ID="tb_AboutMe" runat="server" Height="120px" TextMode="MultiLine" 
            Width="300px"></asp:TextBox>
    </p>
    <p>
        <span class="style3">Enter your name in facebook:</span>&nbsp;
        <asp:TextBox ID="tb_FacebookLink" runat="server" Height="25px" 
            style="margin-top: 0px" Width="128px"></asp:TextBox>
    </p>
    <p class="style2">
        INFORMATION ABOUT YOUR FAVORITE CHARACTERS AND COMICS OF THE MARVEL UNIVERSE</p>
    <p>
        <span class="style3">Enter your favourite character(s):</span>&nbsp;
        <asp:TextBox ID="tb_FavouriteCharacter" runat="server" Height="28px" 
            style="margin-top: 0px" Width="166px"></asp:TextBox>
    </p>
    <p>
        <span class="style3">Enter your favourite comic book:&nbsp; </span>&nbsp;<asp:TextBox ID="tb_FavouriteComic" runat="server" Height="30px" Width="171px"></asp:TextBox>
    </p>
    <p class="style1">
        PICTURE</p><span class="style4">(Upload .jpg images <strong>ONLY</strong><strong 
        class="style5">
    </strong>, other extensions are not supported)</span><br />
    <p>
        <span class="style3">Upload a profile picture of you:</span>&nbsp;
        <asp:FileUpload ID="fu_ProfilePicture" runat="server" />
    &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btn_SubmitProfile" runat="server" Text="Save your profile" />
    </p>
    <p>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    </p>
    </asp:Content>
