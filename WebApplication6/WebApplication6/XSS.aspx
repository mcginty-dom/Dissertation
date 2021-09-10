<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XSS.aspx.cs" Inherits="WebApplication6.XSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" ValidateRequestMode="Disabled" runat="server">
        What is your favourite colour:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
