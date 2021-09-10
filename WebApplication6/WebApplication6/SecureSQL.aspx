<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureSQL.aspx.cs" Inherits="WebApplication6.SecureSQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search for a product</title>
    <link href="/VulnWeb.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="vulnbg">
    <form id="form2" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/Home.aspx">VulnWeb</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/EasySQL.aspx">Easy SQL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/HardSQL.aspx">Hard SQL </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>Secure SQL</u></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SQLHelp.aspx">SQL Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/PersistentXSS.aspx">Persistent XSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ReflectedXSS.aspx">Reflected XSS</a>
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
                <h1 class="display-4">Secure SQL Injection</h1>
                <h4 class="text-danger"><asp:Label ID="Info_Label" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container border border-dark rounded">
            <div class="row">
                <div class="col-md-3">
                    <h3 class="">Search for a Product:</h3>
                    <asp:TextBox ID="Input" runat="server" AutoPostBack="True" OnTextChanged="Input_TextChanged"></asp:TextBox>
                </div>
                <div class="col-md-9">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="5" CellSpacing="5" Font-Size="X-Large"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
