<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FSCN.Admin.Login" %>


<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        .login-container { width: 300px; margin: 100px auto; padding: 20px; border: 1px solid #ccc; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; }
        .btn { padding: 10px 15px; background: #007bff; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Login</h2>
            <div class="form-group">
                <label>Username:</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>