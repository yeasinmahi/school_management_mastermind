<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SectionPaperNew.aspx.cs" Inherits="ReportsUI_SectionPaperNew" %>
<%@ Register TagPrefix="CR" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">


        function Radio_Click() {
            var radio1 = document.getElementById("<%=sradio1.ClientID %>");
            var studentIdTextBox = document.getElementById("<%=studentIdTextBox.ClientID %>");
            
            studentIdTextBox.disabled = !radio1.checked;
            
            studentIdTextBox.focus();
        }
        function Radio1_Click() {
            var radio1 = document.getElementById("<%=sradio2.ClientID %>");
            var studentIdTextBox = document.getElementById("<%=studentIdTextBox.ClientID %>");
            
            studentIdTextBox.disabled = radio1.checked;
            studentIdTextBox.value = '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <fieldset>
        <legend><h1>Section Paper</h1></legend>
        <table>
            <tr>
                <td><b>Session</b>
                    <br/>
                    <asp:DropDownList ID="sessionDropDownList" runat="server" 
                                      DataSourceID="SqlDataSource1" DataTextField="VarSessionName" 
                                      DataValueField="VarSessionId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>" 
                                       SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionName] DESC">
                    </asp:SqlDataSource>
                </td>
                <td><b>Student ID</b><br/>
                    <asp:TextBox ID="studentIdTextBox" runat="server"></asp:TextBox>
                </td>
                <td><br/>
                    <asp:RadioButton ID="sradio1" runat="server" Text="Student Wise" GroupName="genderG" Checked="True" onclick="Radio_Click()" />
                    <asp:RadioButton ID="sradio2" runat="server" Text="Class Wise" GroupName="genderG" onclick="Radio1_Click()" />
                </td>
            </tr>
            <tr>
              <%-- AutoPostBack="True" onselectedindexchanged="classDropDownList_SelectedIndexChanged"--%> 
                <td>
                    <b>Class</b><br/>
                    <asp:DropDownList ID="classDropDownList" runat="server" AppendDataBoundItems="True" 
                                      DataSourceID="SqlDataSource2" DataTextField="VarClassName" 
                                      DataValueField="VarClassID">
                        <asp:ListItem Selected="True" Value="0">--Class--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>" 
                                       
                        SelectCommand="SELECT [VarClassID], [VarClassName] FROM [Class] WHERE ([VarClassID] &gt; @VarClassID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="125" Name="VarClassID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <%--<td>
                    <b>Section</b>
                    <br/>
                    <asp:DropDownList ID="sectionDropDownList" runat="server" AppendDataBoundItems="True"
                                      DataSourceID="SqlDataSource3" DataTextField="varSectionName" 
                                      DataValueField="SectionId">
                        <asp:ListItem Value="0">--All--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>" 
                                       SelectCommand="SELECT [SectionId], [varSectionName], [ClassID] FROM [tblSection] WHERE ([ClassID] = @ClassID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="classDropDownList" Name="ClassID" 
                                                  PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>--%>
                <%--<td>Shift:
                    <br/>
                    <asp:DropDownList ID="shiftDropDownList" runat="server" DataSourceID="getShift" DataTextField="VarShiftName" DataValueField="VarShiftCode" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getShift" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>" SelectCommand="SELECT [VarShiftCode], [VarShiftName] FROM [ShiftInfo]"></asp:SqlDataSource>
                </td>--%>
                <td><br/>
                    <asp:Button ID="ShowButton" runat="server" Text="Show" 
                                onclick="ShowButton_Click" /></td>
            </tr>
        </table>
        <CR:CrystalReportViewer ID="sectionPaperReport" runat="server" AutoDataBind="true" 
                                EnableDatabaseLogonPrompt="False" ToolPanelView="None" />
    </fieldset>
</asp:Content>

