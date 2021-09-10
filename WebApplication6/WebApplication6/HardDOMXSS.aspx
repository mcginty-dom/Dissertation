<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HardDOMXSS.aspx.cs" Inherits="WebApplication6.HardDOMXSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hard DOM Cross-site Scripting</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>DOM-based XSS</u></a>
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
                <h1 class="display-4">Hard DOM XSS</h1>
                <h4 class="text-danger"><asp:Label ID="Info" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container border border-bottom-0 border-dark">
            <div class="row">
                <div class="col-md-6">
                    <h2 class=""><asp:Label ID="Label1" runat="server" Text="Hard"></asp:Label></h2>
                </div>
                <div class="col-md-6">
                    <h2 class=""><asp:Label ID="Label2" runat="server" Text="Difficulties"></asp:Label></h2>
                    <asp:Button ID="Easy_Button" runat="server" Text="Switch to Easy" OnClick="Easy_Button_Click" />
                </div>
            </div>
        </div>
    </form>
    <div class="container border border-top-0 border-dark">
        <div class="row">
            <div class="col-md-6">
                <h4 class="">Select a house:</h4>
	            <form name="HardDOMXSS" method="GET">
		            <select name="house">
			            <script>
                            var a = [
                                'indexOf',
                                '</option>',
                                'search',
                                '#7171e1',
                                'Slytherin',
                                'background',
                                'location',
                                'write',
                                'Hufflepuff',
                                'style',
                                'href',
                                '?house=',
                                '<option\x20value=\x27',
                                'body',
                                'Gryffindor',
                                'length',
                                '#e1e34d',
                                '#cb3030',
                                '#359c35',
                                'Ravenclaw'
                            ];
                            (function (b, c) {
                                var d = function (e) {
                                    while (--e) {
                                        b['push'](b['shift']());
                                    }
                                };
                                d(++c);
                            }(a, 0x1c6));
                            var b = function (c, d) {
                                c = c - 0x0;
                                var e = a[c];
                                return e;
                            };
                            function c(h) {
                                new_option = b('0x12') + h + '\x27>' + decodeURI(h) + b('0x7');
                                return new_option;
                            }
                            function d(h) {
                                if (h === b('0x0')) {
                                    document[b('0x13')][b('0xf')][b('0xb')] = b('0x3');
                                } else if (h === 'Hufflepuff') {
                                    document[b('0x13')]['style']['background'] = b('0x2');
                                } else if (h === b('0x5')) {
                                    document[b('0x13')][b('0xf')][b('0xb')] = b('0x9');
                                } else if (h === b('0xa')) {
                                    document['body'][b('0xf')][b('0xb')] = b('0x4');
                                }
                            }
                            function e(h) {
                                if (h != b('0x0')) {
                                    document[b('0xd')](c(b('0x0')));
                                }
                                if (h != b('0xe')) {
                                    document[b('0xd')](c(b('0xe')));
                                }
                                if (h != b('0x5')) {
                                    document[b('0xd')](c(b('0x5')));
                                }
                                if (h != b('0xa')) {
                                    document['write'](c(b('0xa')));
                                }
                            }
                            if (window[b('0xc')][b('0x8')]['length'] != 0x0) {
                                var f = b('0x11')[b('0x1')];
                                var g = window[b('0xc')][b('0x10')]['substring'](window[b('0xc')][b('0x10')][b('0x6')](window[b('0xc')][b('0x8')]) + f, window[b('0xc')][b('0x10')][b('0x1')]);
                                document['write'](c(g));
                            }
                            d(g);
                            e(g);
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
