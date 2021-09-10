<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XSSHelp.aspx.cs" Inherits="WebApplication6.XSSHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>XSS Help Page</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><u>XSS Help</u></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="jumbotron bg-dark text-light">
            <div class="container">
                <h1 class="display-4">XSS Help Page</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Detect</h2>
                    <p class="">
                        In order to steal user's cookies or redirect them to another site through XSS, you must check if it is vulnerable. You can do this by seeing if the input accepts HTML tags such as 
                        <b class="hidden">&lt;b&gt;, &lt;i&gt; or &lt;u&gt;</b> especially tags like <b class="hidden">&lt;script&gt;, &lt;img src=example.png&gt; and &lt;body&gt;</b> that allow you to exploit 
                        the fact that a user's input has not been HTML encoded.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/XSSDetect.png" alt="XSS Detect" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h2>Exploit</h2>
                    <p class="">
                        Now that you know that the website is vulnerable to XSS, you can utilize these permitted HTML tags to steal a user's cookie. Example: 
                        <b class="hidden">&lt;script&gt;alert(document.cookie)&lt;/script&gt;</b>
                        By stealing a user's cookie you are able to impersonate that user on that website, this is also known as session hijacking. Alternatively, you can redirect a user to another website
                        through this exploit. Example: <b class="hidden">&lt;script&gt;window.location.replace(&quot;https://youtu.be/dQw4w9WgXcQ&quot;)&lt;/script&gt;</b>
                        Now that you are able to redirect any user that runs this malicious JavaScript, you can redirect them to a phishing website to trick them into sending you sensitive information like
                        their passwords or bank details. This exploit also lets you inject a keylogger into the user's webpage as well as capture information they post to the server but that will not be covered here.
                    </p>
                </div>
                <div class="col-md-6">
                    <img class="blur" src="/Content/Images/XSSExploit.png" alt="XSS Exploit" />
                </div>
            </div>
           
            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSP1.png" alt="XSS Persistent Easy" />
                </div>
                <div class="col-md-4">
                    <h2>Persistent</h2>
                    <h4>Easy</h4>
                    <p class="">
                        For the easy difficulty, there is no validation of the user's input whatsoever, allowing for any of the HTML tags to be entered into the database. Because, the webpage's method to HTML
                        encode user input has been disabled whenever a user visits the infected webpage, the data entry in the database is treated as JavaScript code instead of text and is ran by the client's browser. <br />
                        This can be done with any of the tags mentioned above, here is an example malicious entry for session hijacking: <b class="hidden">Name: &lt;script&gt;alert(document.cookie)&lt;/script&gt;</b> 
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSP2.png" alt="XSS Persistent Hard" />
                </div>
                <div class="col-md-4">
                    <h4>Hard</h4>
                    <p class="">
                        In the hard difficulty, the website's owner has attempted to add validation to prevent XSS but has failed to cover all scenarios. The <b class="hidden">&lt;script&gt;</b> tag is now filtered out from
                        the user's input including it in lower, upper and mixed case. To circumvent this, use the <b class="hidden">&lt;img src=example.png&gt;,&lt;body&gt; or anything other than the &lt;script&gt;</b> tag
                        as the website's owner has not thought of this other dangerous HTML tags.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSP3.png" alt="XSS Persistent Secure" />
                </div>
                <div class="col-md-4">
                    <h4>Secure</h4>
                    <p class="">
                        To secure against this vulnerability, the solution is to HTML encode any user input incase they attempt to input these dangerous HTML tags as it is non-trivial to think of all the possible tags 
                        to validate for.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <h2>Reflected</h2>
                    <h4>Easy</h4>
                    <p class="">
                        For non-persistent XSS also known as reflected XSS, the URL contains a query parameter which stores a value to be used server-side to do something. In this case, it is to output a welcome message
                        to the user whenever the page is loaded. However, there is no validation in place to ensure that there is not dangerous HTML tags present and because the user's input is not HTML encoded, they
                        are able to replace the query parameter with <b class="hidden">&lt;script&gt;alert(&quot;example&quot;)&lt;/script&gt;</b> to enact XSS. 
                </div>
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSR1.png" alt="XSS Reflected Easy" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <h4>Hard</h4>
                    <p class="">
                         In this scenario, the website's owner has added validation to remove the <b class="hidden">&lt;script&gt;</b> tag from the input of the user but they have not removed all the possible
                         dangerous HTML tags like <b class="hidden">&lt;body onload=alert(&quot;example&quot;)&gt;</b> seen in the exmaple to the left.
                    </p>
                </div>
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSR2.png" alt="XSS Reflected Hard" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <h4>Secure</h4>
                    <p class="">
                        To secure from reflected XSS attacks, the solution is to HTML encode any and all user input. An example of how to do HTML encode user input can be seen to the left which is a screenshot of the
                        code used in this website to patch the vulnerability.
                    </p>
                </div>
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSR3.png" alt="XSS Reflected Secure" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSD1.png" alt="XSS DOM Easy" />
                </div>
                <div class="col-md-4">
                    <h2>DOM-based</h2>
                    <h4>Easy</h4>
                    <p class="">
                        Finally, we reach the third and final type of XSS, which is arguably the most dangerous of the three because this vulnerability is entirely client-side and it cannot be logged in the server.
                        Therefore, you would not know about this vulnerability until it has already been exploited. How it works is similar to reflected XSS by creating an infected link for a user to enter, but
                        instead of the server handling this query parameter it is used by the client-side JavaScript. Example: <b class="hidden">https://localhost:44374/DOMXSS.aspx?house=%3Cscript%3Ealert()%3C/script%3E</b>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSD2.png" alt="XSS DOM Hard" />
                </div>
                <div class="col-md-4">
                    <h4>Hard</h4>
                    <p class="">
                        For the hard difficulty, there has been added server-side validation to only accept valid house choices otherwise to default to Gryffindor. But this can be easily circumvented by 
                        <b class="hidden">appending to the URL a # or a &amp;</b> followed by your malicious JavaScript code to exploit this vulnerability. As an added security layer, the client-side JavaScript code
                        has been obfuscated to deter user's from trying to find this vulnerability but given time the code can be reversed back to it's original state.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <img class="blur" src="/Content/Images/XSSD3.png" alt="XSS Persistent" />
                </div>
                <div class="col-md-4">
                    <h4>Secure</h4>
                    <p class="">
                        To secure against this type of XSS can be quite difficult because the user's input has to be both HTML encoded and JavaScript encoded for it to be considered secure. To the left is a snippet of the
                        code used to secure from DOM-based XSS.
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
