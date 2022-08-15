<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentSMSNumberUpdate.aspx.cs" Inherits="Student_Info_Search_and_update_StudentSMSNumberUpdate" %>

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
                STUDENT SMS NUMBER UPDATE
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
                                DataSourceID="SqlDataSource2" DataTextField="VarClassName" 
                            DataValueField="VarClassID" CssClass="form-control"
                                AutoPostBack="True" 
                            onselectedindexchanged="classDropDownList_SelectedIndexChanged1">
                                <asp:ListItem Selected="True" Value="0">--Class--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                SelectCommand="SELECT [VarClassID], [VarClassName] FROM [Class]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3">
                        <label>
                            SECTION:</label><br />
                         <asp:DropDownList ID="sectionDropDownList" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSource3" DataTextField="varSectionName" DataValueField="SectionId" CssClass="form-control">
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
                            SHIFT:</label><br />
                       <asp:DropDownList ID="shiftDropDownList" runat="server" DataSourceID="getShift" DataTextField="VarShiftName" CssClass="form-control"
                                DataValueField="VarShiftCode" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="getShift" runat="server" ConnectionString="<%$ ConnectionStrings:SWISConnectionString %>"
                                SelectCommand="SELECT [VarShiftCode], [VarShiftName] FROM [ShiftInfo]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-12 form-group" style="margin-top: 10px">
                        
                        <div class="col-sm-12">
                            <asp:Button ID="searchButton" runat="server" Text="SEARCH" 
                                CssClass="btn btn-info" onclick="searchButton_Click"/>
                        </div>
                        
                       
                    </div>
                   
                    <div class="col-sm-12">
                        <div style="border: 1px solid #ededed; padding: 5px; height: 310px; overflow-y: auto;">
                                    <asp:GridView ID="searchResultGridView" runat="server" CellPadding="2" AutoGenerateColumns="False"
                                        CssClass="table table-striped table-bordered table-hover" 
                                        ForeColor="#333333" GridLines="Both" Width="100%"
                                        HorizontalAlign="Center" ShowHeaderWhenEmpty="true">
                                        <AlternatingRowStyle BackColor="White" />

                                        <Columns>
                                            <asp:TemplateField HeaderText="SR#">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="2%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="STUDENT ID" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="studentIdLabel" runat="server" Text='<%# Eval("VarStudentID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="STUDENT NAME" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("FullNAme") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ROLL" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="rollLabel" runat="server" Text='<% # Eval("StudentRoll")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="SMS NUMBER">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="smsNumberTextBox" runat="server" Text='<% # Eval("VarStudenHomeCell")%>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="GridviewScrollHeader" />
                                        <RowStyle CssClass="GridviewScrollItem" />
                                        <PagerStyle CssClass="GridviewScrollPager" />
                                        <%-- <EditRowStyle BackColor="#7C6F57" />
                                            <FooterStyle BackColor="#858285" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#858285" Font-Bold="True" ForeColor="White" />
                                            <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#E3EAEB" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />--%>
                                    </asp:GridView>
                                </div>
                    </div>
                    <div class="col-sm-12">
                        <asp:Button ID="saveButton" runat="server" Text="SAVE" 
                                CssClass="btn btn-linkedin" onclick="saveButton_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

