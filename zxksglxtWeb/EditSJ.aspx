<%@ Page Title="Edit Exam Pape" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditSJ.aspx.cs" Inherits="zxksglxtWeb.EditSJ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
    <li>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SJList.aspx">Exam Paper List</asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <%=Page.Title %>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" runat="server">
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Code</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="name" runat="server" required="required" CssClass="form-control" placeholder="Please enter the code"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage=" Code cannot be empty"
                                ControlToValidate="name" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label"> Score per Question</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="score" runat="server" required="required" type="number" CssClass="form-control" placeholder="Please enter the score per question"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Score per question cannot be empty"
                                ControlToValidate="score" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Passing Score</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="jgx" runat="server" required="required" type="number" CssClass="form-control" placeholder="Please enter the passing score"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="Passing score cannot be empty"
                                ControlToValidate="jgx" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>

                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Remarks</label>
                        <div class="col-sm-10">

                            <asp:TextBox ID="memo" TextMode="MultiLine" Rows="5" runat="server" required="required" CssClass="form-control" placeholder=" Please enter remarks"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Remarks cannot be empty"
                                ControlToValidate="memo" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>

                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Button1_Click" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" DisplayMode="List" style="padding-top:10px;"/>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script>
        
    </script>
</asp:Content>
