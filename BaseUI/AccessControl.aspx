<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AccessControl.aspx.cs" Inherits="BaseUI_AccessControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .panel-primary > .panel-heading
        {
            color: #ffffff;
            background-color: #428bca;
            border-color: #428bca;
            text-align: center;
        }
        .subMenuCheckBoxListHolder {
            max-height: 250px;
            overflow: auto;
        }
        .page {
            min-height: 700px !important;
        }
        #MainContent_saveButton {
            margin-top: 10px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="col-sm-12">
        <div class="col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Access Control
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="col-lg-12">
                            <label>
                                Select User:</label><br />
                            <asp:DropDownList ID="userDropDownList" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-12">
                            <label>
                                Select Main Menu:</label><br />
                            <asp:DropDownList ID="mainMenuDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="mainMenuDropDownList_SelectedIndexChanged"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-12">
                            <label>
                                Sub-Menu:</label><br />
                            <div class="subMenuCheckBoxListHolder">
                                <asp:CheckBoxList ID="subMenuCheckBoxList" runat="server" CssClass="table table-bordered">
                            </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" CssClass="btn btn-primary"/></div>
                    </div>
                   
                </div>
            </div>
        </div>
       <%-- <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Access List
                </div>
                <div class="panel-body">
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
