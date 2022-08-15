<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PreviousStudentReport.aspx.cs" Inherits="ReportsUI_PreviousStudentReport" %>
<%@ Register TagPrefix="CR" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/AdminLTE.min.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .panel-primary > .panel-heading
        {
            color: #ffffff;
            background-color: #428bca;
            border-color: #428bca;
            text-align: center;
        }
        
        .page
        {
            min-height: 700px !important;
        }
        #MainContent_saveButton
        {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                PREVIOUS STUDENT REPORT
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>
                            SESSION:</label><br />
                        <asp:DropDownList ID="sessionDropDownList" runat="server" DataSourceID="SqlDataSource1"
                            AppendDataBoundItems="True" DataTextField="VarSessionName" DataValueField="VarSessionId" CssClass="form-control">
                            <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                            SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionId] DESC">
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                       
                        <label>
                            CLASS:</label><br />
                            <asp:DropDownList ID="classDropDownList" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSource2" DataTextField="VarClassName" DataValueField="VarClassID"
                                AutoPostBack="True" >
                                <asp:ListItem Selected="True" Value="0">--Class--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                SelectCommand="SELECT [VarClassID], [VarClassName] FROM [Class]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                        <label>
                            SECTION:</label><br />
                       
                            <asp:DropDownList ID="sectionDropDownList" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSource3" DataTextField="varSectionName" DataValueField="SectionId">
                                <asp:ListItem Value="0">--All--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                SelectCommand="SELECT [SectionId], [varSectionName], [ClassID] FROM [tblSection] WHERE ([ClassID] = @ClassID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="classDropDownList" Name="ClassID" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                        <label>
                            LEVEL:</label><br />
                        <asp:DropDownList ID="levelDropDownList" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">--All--</asp:ListItem>
                            <asp:ListItem>O-LEVEL</asp:ListItem>
                            <asp:ListItem>A-LEVEL</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-3">
                        <label>
                            BOARD:</label><br />
                        <asp:DropDownList ID="boardDropDownList" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">--All--</asp:ListItem>
                            <asp:ListItem>EDEXCEL</asp:ListItem>
                            <asp:ListItem>CAMBRIDGE</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-12 form-group" style="margin-top: 10px">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-2">
                            <asp:Button ID="fullResultButton" runat="server" Text="FULL RESULT" 
                                CssClass="btn btn-info" />
                        </div>
                        <div class="col-sm-2">
                            <asp:Button ID="topTenButton" runat="server" Text="TOP 10" 
                                CssClass="btn btn-warning" />
                        </div>
                        <div class="col-sm-2">
                            <asp:Button ID="totalGradeButton" runat="server" Text="OBTAIN GRADE SUMMARY" 
                                CssClass="btn btn-yahoo" />
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <div class="col-sm-12 form-group" style="">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <asp:Button ID="subCountButton" runat="server" Text="RESULT WITH SUBJECT COUNT" 
                                CssClass="btn btn-success"   />
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="awardStdButton" runat="server" Text="AWARD LIST" 
                                CssClass="btn btn-primary" />
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <div class="col-sm-12">
                        <CR:CrystalReportViewer ID="PreviousStudentReport" runat="server" 
                                AutoDataBind="true" EnableParameterPrompt="False" ToolPanelView="None" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

