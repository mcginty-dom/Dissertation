<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecureXSS.aspx.cs" Inherits="WebApplication6.SecureXSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Secure Cross-site Scripting</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="/ReflectedXSS.aspx">Reflected XSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/DOMXSS.aspx">DOM-based XSS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>Secure XSS</u></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/XSSHelp.aspx">XSS Help</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="jumbotron bg-dark text-light">
            <div class="container">
                <h1 class="display-4">Secure Cross-site Scripting</h1>
                <h4 class="text-danger"><asp:Label ID="Info_Label" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container border border-bottom-0 border-dark">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="">Secure</h2>
                    <h4 class="">What is your name?</h4>
                    <div class="row">
                        <asp:TextBox ID="UserName_TextBox" runat="server"></asp:TextBox>
                        <asp:Button ID="Reflected_Button" runat="server" Text="Submit" OnClick="Reflected_Button_Click"/>
                    </div>
                    <asp:Label ID="UserName_Label" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
                <div class="col-md-6">
                    <h2 class="">Secure</h2>
                    <h4 class="">Create a new product entry:</h4>
                    <p class="">
                        Name: <asp:TextBox ID="ProductName_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Price: <asp:TextBox ID="Price_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        Quantity: <asp:TextBox ID="Quantity_TextBox" runat="server"></asp:TextBox>
                    </p>
                    <p class="">
                        <asp:Button ID="Persistent_Button" runat="server" Text="Submit" OnClick="Persistent_Button_Click"/>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="5" CellSpacing="5" Font-Size="X-Large"></asp:GridView>
                </div>
            </div>
        </div>
    </form>
    <div class="container border border-top-0 border-dark">
        <div class="row">
            <div class="col-md-6">
                <h4 class="">Select a house:</h4>
	            <form name="SecureDOMXSS" method="GET">
		            <select name="house">
			            <script>
                            function createOption(input) {
                                new_option = "<option value='" + input + "'>" + input + "</option>";
                                return new_option;
                            }

                            function setBackgroundColour(user_input) {
                                if (user_input === "Gryffindor") {
                                    document.body.style.background = "#cb3030";
                                } else if (user_input === "Hufflepuff") {
                                    document.body.style.background = "#e1e34d";
                                } else if (user_input === "Ravenclaw") {
                                    document.body.style.background = "#7171e1";
                                } else if (user_input === "Slytherin") {
                                    document.body.style.background = "#359c35";
                                }
                            }

                            function writeOptions(user_input) {
                                if (user_input != "Gryffindor") {
                                    document.write(createOption("Gryffindor"));
                                }
                                if (user_input != "Hufflepuff") {
                                    document.write(createOption("Hufflepuff"));
                                }
                                if (user_input != "Ravenclaw") {
                                    document.write(createOption("Ravenclaw"));
                                }
                                if (user_input != "Slytherin") {
                                    document.write(createOption("Slytherin"));
                                }
                            }

                            //If there is a query in the URI
                            if (window.location.search.length != 0) {
                                //Retrieve user's house by extracting the substring beginning at the parameter value to the end of the URI
                                var offset = "?house=".length;
                                var user_input = window.location.href.substring(window.location.href.indexOf(window.location.search) + offset, window.location.href.length);
                                //Writes current selection
                                document.write(createOption(user_input));
                            }
                            //Set background colour based on user's house
                            setBackgroundColour(user_input);
                            //Writes all options except current selection
                            writeOptions(user_input);
			            </script>
		            </select>
		            <input type="submit" value="Submit" />
	            </form>
            </div>
            <div class="col-md-6">

            </div>
        </div>
    </div>
    
</body>
</html>
