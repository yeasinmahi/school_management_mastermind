<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="SystemSettings.aspx.cs" Inherits="BaseUI_SystemSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <fieldset>
        <legend>System Information</legend>
         <table>
        <tr>
            <td colspan="3">
                <span class="label label-warning" style="background-color: #EA4335; float: left;
                    font-size: 20px; position: relative;" id="failStatusLabel" runat="server"></span>
               <br/>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 120px">
                <b>Product Key: </b>
            </td>
            <td>
                <asp:TextBox ID="keyTextBox" runat="server" CssClass="form-control input-lg"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="btn btn-info" 
                    onclick="saveButton_Click"/>
            </td>
        </tr>
    </table>
    </fieldset>
   
</asp:Content>
