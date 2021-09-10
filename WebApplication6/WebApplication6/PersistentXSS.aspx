<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersistentXSS.aspx.cs" Inherits="WebApplication6.PersistentXSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<<head runat="server">
    <title>Persistent Cross-site Scripting</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>Persistent XSS</u></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ReflectedXSS.aspx">Reflected XSS </a>
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
                <h1 class="display-4">Persistent Cross-site Scripting</h1>
                <h4 class="text-danger">
                    <asp:Label ID="Info_Label" runat="server" Text="Label" Visible="False"></asp:Label>
                </h4>
            </div>
        </div>
        <div class="container border border-dark rounded">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="">Easy</h2>
                    <h3 class="">Create a new product entry:</h3>
                    <p class="">
                        Name: <asp:TextBox ID="Name_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Price: <asp:TextBox ID="Price_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Quantity: <asp:TextBox ID="Quantity_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        <asp:Button ID="Easy_Button" runat="server" Text="Submit" OnClick="Easy_Button_Click" />
                    </p>
                </div>
                <div class="col-md-6">
                    <h2 class="">Hard</h2>
                    <h3 class="">Create a new product entry:</h3>
                    <p class="">
                        Name: <asp:TextBox ID="Name_TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Price: <asp:TextBox ID="Price_TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Quantity: <asp:TextBox ID="Quantity_TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        <asp:Button ID="Hard_Button" runat="server" Text="Submit" OnClick="Hard_Button_Click" />
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="5" CellSpacing="5" Font-Size="X-Large"></asp:GridView>
                </div>
                <div class="col-md-3">

                </div>
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
