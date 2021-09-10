<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" CodeBehind="ReflectedXSS.aspx.cs" Inherits="WebApplication6.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reflected Cross-site Scripting</title>
    <link href="/VulnWeb.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="vulnbg">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/Home.aspx">VulnWeb </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/EasySQL.aspx">Easy SQL </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/HardSQL.aspx">Hard SQL
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SecureSQL.aspx">Secure SQL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SQLHelp.aspx">SQL Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/PersistentXSS.aspx">Persistent XSS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>Reflected XSS</u></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/DOMXSS.aspx">DOM-based XSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SecureXSS.aspx">Secure XSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/XSSHelp.aspx">XSS Help</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="jumbotron bg-dark text-light">
            <div class="container">
                <h1 class="display-4">Reflected Cross-site Scripting</h1>
                <h4 class="text-danger"><asp:Label ID="Info" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container border border-dark rounded">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="">Easy</h2>
                    <h4 class="">What is your name?</h4>
                    <div class="row">
                        <asp:TextBox ID="Easy_TextBox" runat="server" validateRequest="false"></asp:TextBox>
                        <asp:Button ID="Easy_Button" runat="server" Text="Submit" OnClick="Easy_Button_Click" />
                    </div>
                </div>
                <div class="col-md-6">
                    <h2 class="">Hard</h2>
                    <h4 class="">What is your name?</h4>
                    <div class="row">
                        <asp:TextBox ID="Hard_TextBox" runat="server" validateRequest="false"></asp:TextBox>
                        <asp:Button ID="Hard_Button" runat="server" Text="Submit" OnClick="Hard_Button_Click" />
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="Name_Label" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
