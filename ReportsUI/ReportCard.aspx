<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ReportCard.aspx.cs" Inherits="ReportsUI_ReportCard" %>
<%@ Register TagPrefix="CR" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset>
        <legend>
            <h1>
                Report Card Generator</h1>
        </legend>
        <table>
            <tr>
                <td>
                    <b>Session</b><br />
                    <asp:DropDownList ID="sessionDropDownList" runat="server" DataSourceID="getSession"
                        DataTextField="VarSessionName" DataValueField="VarSessionId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getSession" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                        SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionId] DESC">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <b>Student ID</b><br />
                    <asp:TextBox ID="studentIdTextBox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <b>Exam Name:</b>
                    <br />
                    <asp:DropDownList ID="examNameDropDownList" runat="server" DataSourceID="getExamName"
                                      DataTextField="ExamName" DataValueField="ExamCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getExamName" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                       SelectCommand="SELECT [ExamCode], [ExamName] FROM [tbl_ExamName]"></asp:SqlDataSource>
                </td>
                <td><br />
                    <asp:Button ID="ShowButton" runat="server" Text="Show" 
                        onclick="ShowButton_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <span class="label label-warning" style="background-color: #f0ad4e; float: left;
                        font-size: 20px; position: relative;" id="failStatusLabel" runat="server"></span>
                    <span class="label label-success" style="background-color: #5cb85c; float: left;
                        font-size: 20px; position: relative;" id="successStatusLabel" runat="server">
                    </span>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <cr:crystalreportviewer id="ReportCardGenerator" runat="server" autodatabind="true"
            enabledatabaselogonprompt="False" toolpanelview="None" />
    </fieldset>
</asp:Content>
