<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Account/login.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<%@ Reference Page="~/BaseUI/Default.aspx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8" />
    <title>Login | MASTERMIND ENGLISH MEDIUM SCHOOL </title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--begin::Web font -->
    <script src="../../../ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: { "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"] },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <!--end::Web font -->
    <!--begin::Base Styles -->
    <link rel="shortcut icon" href="metronic/login_page/img/favicon.png" />
    <link href="metronic/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="metronic/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Base Styles -->
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style>
        body {
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background-image: url('../Image/Low-Classroom_Traditional_Introduction-Banner.jpg');
            background-size: cover;
            background-position: right;
            background-repeat: no-repeat;
        }

        .page {
            width: 40%;
            margin: 0;
            background: transparent;
            box-shadow: none;
            padding: 0;
        }

        .main {
            height: auto;
            margin: 0 auto;
            padding: 0;
        }

        .header {
            height: 123px;
            padding: 0 5%;
            width: 100%;
        }

        .title {
            width: 100%;
        }
        .title img{
            height: 100px;
            width: auto;
            display: block;
            margin: 0 auto;
        }

        .loginDisplay {
            display: none;
        }

        div.hideSkiplink {
            display: none;
        }

        .loginSideBackground {
            width: 100%;
        }

        .loginLeft {
            height: calc(100vh - 123px);
            overflow-y: auto;
            background: #fff;
            background: rgba(255,255,255,0.92);
            padding: 5%;
            text-align: center;
            color: #222;
        }
        

        .table{
            display: block;
            margin: 0 auto;
        }
        .table thead, .table tbody, .table tfoot, .table tr, .table th, .table td {
            max-width: 100%;
            display: block;
        }
        .table.loginOptions{
            max-width: 220px;
            margin: 0 auto;
        }
        .table.loginOptions td{
            display: block;
            text-align: left;
        }
        .table.loginOptions input, .table.loginOptions label{
            width: 100%;
        }
        .table.loginOptions label{
            font-weight: bold;
            font-size: 14px;
            padding-left: 5px;
            color: #555;
        }
        .table.loginOptions input{
            height: 25px;
            font-size: 15px;
            padding-left: 10px;
            width: calc(100% - 12px);
            border: 1px solid #4b6c9e;
        }
        .table.loginOptions input[type="submit"]{
            margin-top: 17px;
            width: 100%;
            height: auto;
            padding: 7px 10px;
            cursor: pointer;
            border-radius: 25px;
            border: 1px solid #fff;
            background: #4b6c9e;
            color: #fff;
            font-weight: bold;
            transition: all 0.3s;
        }
        .table.loginOptions input[type="submit"]:hover{
            box-shadow: 0 0 10px 1px #c1c1c1;
            background: #4bac00;
            transition: all 0.3s;
        }
    </style>

    <div class="loginLeft">
        <h2>Log In
        </h2>
        <br />
        <br />
        <p style="display: none;">
            Please enter your username and password.
         <asp:LinkButton ID="linkGoSomewhere" runat="server"
             Click="linkGoSomewhere_Click" Text="Register" OnClick="linkGoSomewhere_Click" />
            if you don't have an account.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="False">Register</asp:HyperLink> 
        </p>
        <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;" class="table">
            <tr>
                <td>
                    <table cellpadding="0" class="table loginOptions">
                        <%--<tr>
                            <td align="center" colspan="2">Log In</td>
                        </tr>--%>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                    ControlToValidate="UserName" ErrorMessage="User Name is required."
                                    ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server"
                                    ControlToValidate="Password" ErrorMessage="Password is required."
                                    ToolTip="Password is required." ValidationGroup="Login1" ForeColor="red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td colspan="2">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Label ID="lbllogin" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In"
                                    ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>
                        <asp:Label ID="Label1" runat="server"
                            Text=""
                            ForeColor="Red" Width="662px" Font-Bold="True"></asp:Label>
                    </h3>
                </td>
            </tr>
        </table>

    </div>
    <div  class="loginRight">
        <%--<img src="../Image/kids_grade_school.jpg" class="loginSideBackground" alt="Classroom" />--%>
    </div>
</asp:Content>
