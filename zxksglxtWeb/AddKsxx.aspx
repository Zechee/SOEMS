<%@ Page Title="Add Exam" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddKsxx.aspx.cs" Inherits="zxksglxtWeb.AddKsxx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
    <li>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/KsxxList.aspx">Exam List</asp:HyperLink>
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
                        <label for="u_code" class="col-sm-2 control-label">Candidate</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="u_code" runat="server" CssClass="form-control" required="required">
                            </asp:DropDownList>   
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Candidate cannot be empty"
                                ControlToValidate="u_code" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      
                      <div class="form-group">
                        <label for="sj_id" class="col-sm-2 control-label">Paper</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="sj_id" runat="server" CssClass="form-control" required="required">
                            </asp:DropDownList>   
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Exam paper cannot be empty"
                                ControlToValidate="sj_id" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
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
