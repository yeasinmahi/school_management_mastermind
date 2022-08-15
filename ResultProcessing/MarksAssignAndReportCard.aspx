<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MarksAssignAndReportCard.aspx.cs" Inherits="ResultProcessing_MarksAssignAndReportCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                BOARD EXAM RESULT
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>
                            SESSION:</label><br />
                        <asp:DropDownList ID="sessionDropDownList" runat="server" DataSourceID="SqlDataSource1"
                            AppendDataBoundItems="True" DataTextField="VarSessionName" DataValueField="VarSessionId"
                            CssClass="form-control">
                            <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                            SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionId] DESC">
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                        <label>
                            EXAM SESSION:</label><br />
                        <asp:DropDownList ID="examNameDropDownList" runat="server" DataSourceID="getExamName"
                                      DataTextField="ExamName" DataValueField="ExamCode">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getExamName" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                       SelectCommand="SELECT [ExamCode], [ExamName] FROM [tbl_ExamName]"></asp:SqlDataSource>
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
                    <%--<div class="col-sm-12 form-group" style="margin-top: 10px">
                        <div class="col-sm-3">
                        </div>
                        <div class="col-sm-2">
                            <asp:Button ID="fullResultButton" runat="server" Text="FULL RESULT" CssClass="btn btn-info"
                                OnClick="fullResultButton_Click" />
                        </div>
                        <div class="col-sm-2">
                            <asp:Button ID="topTenButton" runat="server" Text="TOP 10" CssClass="btn btn-warning"
                                OnClick="topTenButton_Click" />
                        </div>
                        <div class="col-sm-2">
                            <asp:Button ID="totalGradeButton" runat="server" Text="OBTAIN GRADE SUMMARY" CssClass="btn btn-yahoo"
                                OnClick="totalGradeButton_Click" />
                        </div>
                        <div class="col-sm-3">
                        </div>
                    </div>
                    <div class="col-sm-12 form-group" style="">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="subCountButton" runat="server" Text="RESULT WITH SUBJECT COUNT" CssClass="btn btn-success"
                                OnClick="subCountButton_Click" />
                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="awardStdButton" runat="server" Text="AWARD LIST" CssClass="btn btn-primary"
                                OnClick="awardStdButton_Click" />
                        </div>
                        <div class="col-sm-2">
                        </div>
                    </div>--%>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
