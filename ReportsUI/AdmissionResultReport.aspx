﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
         CodeFile="AdmissionResultReport.aspx.cs" Inherits="ReportsUI_AdmissionResultReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
             Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset class="reportPage">
        <legend>
            <h1>
                Admission Test Result</h1>
        </legend>
        <table class="needBlock">
            <tr>
                <td>
                    <b>Session: </b>
                    <asp:DropDownList ID="sessionDropDownList" runat="server" DataSourceID="getSession"
                                      DataTextField="VarSessionName" DataValueField="VarSessionId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getSession" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                       SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionId] DESC">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <b>Class: </b>
                    <asp:DropDownList ID="classDropDownList" runat="server" AppendDataBoundItems="True"
                                      DataSourceID="getAllClass" DataTextField="VarClassName" 
                        DataValueField="VarClassID">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getAllClass" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                       SelectCommand="SELECT [VarClassID], [VarClassName] FROM [Class]"></asp:SqlDataSource>
                </td>
                <td>
                    <b>Date:
                        <asp:TextBox ID="dateTextBox" runat="server"></asp:TextBox></b>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="dateTextBox"
                                          Format="dd-MMMM-yyyy"></cc1:CalendarExtender>
                </td>
                <td>
                    <asp:Button ID="showButton" runat="server" Text="Show" 
                                onclick="showButton_Click" /></td>
            </tr>
            <tr>
                 <td colspan="3">
                <span class="label label-warning" style="background-color: #f0ad4e; float: left;
                    font-size: 20px; position: relative;" id="failStatusLabel" runat="server"></span>
                <span class="label label-success" style="background-color: #5cb85c; float: left;
                    font-size: 20px; position: relative;" id="successStatusLabel" runat="server">
                </span>
                <br />
                
            </td>
            </tr>
        </table>
        <CR:CrystalReportViewer ID="AdmissionResult" runat="server" AutoDataBind="true" 
                                EnableParameterPrompt="False" ToolPanelView="None" />
    </fieldset>
</asp:Content>