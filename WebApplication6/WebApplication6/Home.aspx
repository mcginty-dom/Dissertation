<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication6.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="/VulnWeb.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="vulnbg">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div>
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>VulnWeb</u></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/EasySQL.aspx">Easy SQL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/HardSQL.aspx">Hard SQL</a>
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
        <div class="jumbotron bg-dark">
            <div class="container">
            <h1 class="display-2 text-light">Welcome to VulnWeb</h1>
            <p class="text-light">
                Hello and welcome to my 3rd year project, creating a vulnerable web application! The goal of this project is to provide a tutorial for you to learn how to detect and exploit security 
                vulnerabilities within some web applications online as well as understand the damage they can do. Specifically, this tutorial is aimed at teaching beginners about SQL Injection and 
                Cross site Scripting (XSS) by providing a step-by-step guide to provide assistance if you are stuck. I hope you enjoy!
            </p>
            <asp:Button ID="ResetDB_Button" runat="server" Text="Create/Reset Database" OnClick="ResetDB_Button_Click" />
            <h4 class="text-danger"><asp:Label ID="Info_Label" runat="server" Text="" Visible="False"></asp:Label></h4>
            </div>
        </div>
        <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>SQL Injection</h2>
            <p>
                Ranked #1 in the OWASP Top 10, this vulnerability allows a user to send unverified code to the web application, causing the execution of said program to be different than intended, 
                this as a result may give unauthorized access to the database which can be catastrophic for the website potentially leading to the loss/compromise of their user's personal data such 
                as their encrypted passwords and more. 
                <br /> <br /> <br /> Further Reading: <br /> 
                <a class="" href="https://owasp.org/www-community/attacks/SQL_Injection">"SQL Injection in Detail"</a> by OWASP <br />
                <a class="" href="http://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet">"MSSQL SQL Injection Cheat Sheet"</a> by PenTestMonkey <br />
                <a class="" href="https://portswigger.net/burp/communitydownload">"BurpSuite, a tool for SQL Injection"</a> by PortSwigger <br />
            </p>
          </div>
          <div class="col-md-6">
            <h2>Cross-Site Scripting (XSS)</h2>
            <p>
                Less severe than SQL Injection but more prevelant online, XSS is a client-side vulnerability in which when the user visits the infected web page; malicious JavaScript will run on the
                user’s browser. This can cause the user to be redirected to a phishing website where it is the appearance is identical to the web page so they are tricked into entering their details, 
                or their cookies can be stolen which allows an attacker to impersonate them online and takeover their account. 
                <br /> <br /> <br />
                <a class="" href="https://excess-xss.com/">"Cross-site Scripting in Detail"</a> by Jakob Kallin and Irene Lobo Valbuena <br />
                <a class="" href="https://owasp.org/www-community/xss-filter-evasion-cheatsheet">"XSS Filter Bypass  Cheat Sheet"</a> by OWASP <br />
                <a class="" href="https://www.cgisecurity.com/xss-faq.html">"Frequently Asked Questions About XSS"</a> by CGISecurity <br />
            </p>
          </div>
        </div>
    </form>
</body>
</html>
