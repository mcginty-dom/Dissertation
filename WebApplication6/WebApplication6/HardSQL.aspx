<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HardSQL.aspx.cs" Inherits="WebApplication6.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Hard SQL Injection
    </title>
    <link href="/VulnWeb.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="vulnbg">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/Home.aspx">VulnWeb</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/EasySQL.aspx">Easy SQL</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>Hard SQL</u></a>
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
                <h1 class="display-4">Hard SQL Injection</h1>
                <h4 class="text-danger"><asp:Label ID="Info_Label" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container border border-dark rounded">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="">Search for a Product:</h3>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [Products]"></asp:SqlDataSource>
                    <asp:RadioButtonList ID="Products" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" OnSelectedIndexChanged="Products_SelectedIndexChanged" CellPadding="5" CellSpacing="5" Font-Size="Medium" Font-Underline="True" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </div>
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="5" CellSpacing="5" Font-Size="X-Large"></asp:GridView>
                    <asp:TextBox ID="Input" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
