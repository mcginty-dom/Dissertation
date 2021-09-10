<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SQLHelp.aspx.cs" Inherits="WebApplication6.SQLHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQL Help Page</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="/HardSQL.aspx">Hard SQL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/SecureSQL.aspx">Secure SQL</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>SQL Help</u></a>
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
                <h1 class="display-4">SQL Help Page</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Detect</h2>
                    <p class="">
                        To first perform SQL Injection you must detect whether the website is vulnerable to it, to do this type: <b class="hidden">NULL' OR 1=1--</b> This will break out of the intended
                        input and create a tautology so all the data will be displayed. Note you can do this with other forms of tautology making this non-trivial to solve from the website owner's point
                        of view. Example: <b class="hidden">NULL' OR 'a'='a'--</b>
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/detect.png" alt="Detect Image" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h2>Exploit</h2>
                    <p class="">
                        Now that you know the website is vulnerable, in order to get access to data you wouldn't normally be allowed to read you must follow these steps.  
                    </p>
                    <p class="">
                        1. Firstly, you must find out what tables exist in the database, so you can choose which table that you want to extract data from. To do this type: 
                            <b class="hidden">NULL' UNION (SELECT TABLE_NAME,TABLE_SCHEMA,NULL FROM INFORMATION_SCHEMA.TABLES)--</b> this will break out of the SQL statement and append a second
                            query of your making to the SqlCommand allowing you to locate all the tables in the database. 
                            Note: To use the <b class="hidden">UNION</b> keyword both queries must have the same number of selects or it will fail.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/exploit1.png" alt="Find Tables" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <p class="">
                        2. Next pick a table you want to data from, so you have to first know what columns are in this table and to do this 
                            type: <b class="hidden">NULL' UNION (SELECT COLUMN_NAME,NULL,NULL FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Accounts')--</b> this will search for all the columns
                            inside a specified table and in this example we now know all the columns present in the Accounts table.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/exploit2.png" alt="Find Columns" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <p class="">
                        3. Finally, choose what rows of data you want to see and then type them into the 3 respective places in the <b class="hidden">SELECT</b> statement. Here is an example of
                            a query that would receive every account's email, password and mobile number <b class="hidden">NULL' UNION (SELECT EMAIL,PASSWORD,MOBILE_NUMBER FROM ACCOUNTS)--</b>.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/exploit3.png" alt="Get Rows" />
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <h2>Hard</h2>
                    <p class="">
                        To complete the hard difficulty, I recommend for you to install Burpsuite <a class="" href="https://portswigger.net/burp/communitydownload">[link]</a> in order to intercept the 
                        post request sent to the server. By intercepting this message, you are able to write anything you want into the input instead of the list of options provided to you, bypassing 
                        this server's validation.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/hard.png" alt="BurpSuite Example" />
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/hard2.png" alt="Hard Example" />
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <h2>Secure</h2>
                    <p class="">
                        The reason for why this SQL query is secure is because of parameterized values within the query which html encodes the input of the user, this ensures that no matter what the user
                        types, that it will not be mistreated as code that the server has to run. If you don't believe me, try and break into it yourself!
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/secure.png" alt="Secure SQL Code" />
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/secure2.png" alt="Secure Example" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

