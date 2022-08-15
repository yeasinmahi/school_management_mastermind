<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="BoardExamResultEntry.aspx.cs" Inherits="BoardExam.BoardExamBoardExamResultEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .test {
            float: left;
        }
        .col-sm-2 {
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <fieldset>
        <legend>
            <h3>
                Board Exam Result</h3>
        </legend>
        <div class="col-sm-12">
            <span class="label label-warning" style="background-color: #f0ad4e; float: left;
                                          font-size: 20px; position: relative;" id="failStatusLabel" runat="server"></span>
            <span class="label label-success" style="background-color: #5cb85c; float: left;
                                                                                                                      font-size: 20px; position: relative;" id="successStatusLabel" runat="server">
            </span>
        </div>
        <div class="col-sm-12">
            <div class="col-sm-2">
                <label>
                    <b>Session</b></label>
                <asp:DropDownList ID="sessionDropDownList" runat="server" DataSourceID="SqlDataSource1"
                    AppendDataBoundItems="True" DataTextField="VarSessionName" DataValueField="VarSessionId"
                    OnSelectedIndexChanged="sessionDropDownList_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                    SelectCommand="SELECT [VarSessionId], [VarSessionName] FROM [SessionInfo] ORDER BY [VarSessionId] DESC">
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-2">
                <label>
                    <b>Exam Session</b><br />
                </label>
                <asp:DropDownList ID="examSessionDropDownList" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-sm-3">
                <label><b>Student ID</b></label>
                <div>
                    <asp:TextBox ID="branchInitialTextBox" runat="server" CssClass="form-control test" Width="25%"></asp:TextBox>
                <asp:TextBox ID="txtStdId" runat="server" CssClass="form-control test" Width="70%"></asp:TextBox>
                </div>
                    
                    
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtStdId"
                        ErrorMessage="Please Insert Student ID" ForeColor="red"></asp:RequiredFieldValidator>
                
            </div>
            <div class="col-sm-2">
                <label><b>Class</b></label>
                <asp:DropDownList ID="levelDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="O-LEVEL">O-LEVEL</asp:ListItem>
                        <asp:ListItem Value="A-LEVEL">A-LEVEL</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-sm-2">
                <label><b>Board</b></label>
                <asp:DropDownList ID="boardDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="EDEXCEL">EDEXCEL</asp:ListItem>
                        <asp:ListItem Value="CAMBRIDGE">CAMBRIDGE</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-sm-1"><br/>
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" CssClass="btn btn-info"/>
            </div>
        </div>
        <div class="col-sm-12">
            <asp:Label ID="studentNameLabel" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
        </div>
        <div class="col-sm-12">
        <asp:GridView ID="resultEntryGridView" runat="server" CellPadding="4" AutoGenerateColumns="False"
                        ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-responsive">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="SUBJECT CODE" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="subjectCodeLabel" runat="server" Text='<%# Eval("SubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SUBJECT">
                                <ItemTemplate>
                                    <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GRADE">
                                <ItemTemplate>
                                    <asp:TextBox ID="gradeTextBox" runat="server" Text='<%#Eval("Grade") %>' Width="50px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView></div>
                    <div class="col-sm-12" style="margin-top: 10px">
                        <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" CssClass="btn btn-yahoo"/>
                    </div>
       
    </fieldset>
</asp:Content>
