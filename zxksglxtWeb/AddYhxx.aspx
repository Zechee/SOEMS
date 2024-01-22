<%@ Page Title=" Add User" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddYhxx.aspx.cs" Inherits="zxksglxtWeb.AddYhxx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
    <li>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/YhxxList.aspx"> User List</asp:HyperLink>
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
                        <label for="code" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="code" runat="server" required="required" CssClass="form-control" placeholder="Please enter a username"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Username cannot be empty"
                                ControlToValidate="code" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="pwd" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="pwd" runat="server" type="password" required="required" CssClass="form-control" placeholder=" Please enter a password"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Password cannot be empty"
                                ControlToValidate="pwd" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="role" class="col-sm-2 control-label">User Type</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="role" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Value="">--Please select  a user type--</asp:ListItem>
                                <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                                <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                            </asp:DropDownList>      
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="User type cannot be empty"
                                ControlToValidate="role" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="name" runat="server" required="required" CssClass="form-control" placeholder="Please enter a name"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Name cannot be empty"
                                ControlToValidate="name" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="sex" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Value="">--Please select a gender--</asp:ListItem>
                                <asp:ListItem Value="男">Male</asp:ListItem>
                                <asp:ListItem Value="女">Female</asp:ListItem>
                            </asp:DropDownList>      
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="Gender cannot be empty"
                                ControlToValidate="sex" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      
                      <div class="form-group">
                        <label for="birth" class="col-sm-2 control-label">Date of Birth</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="birth" runat="server" type="date" required="required" CssClass="form-control" placeholder="Please enter the date of birth"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage=" Date of birth cannot be empty"
                                ControlToValidate="birth" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="cardno" class="col-sm-2 control-label">Student ID</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="cardno" runat="server" required="required" CssClass="form-control" placeholder="Please enter the student ID"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage=" Student ID cannot be empty"
                                ControlToValidate="cardno" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                              ErrorMessage="Invalid student ID" ValidationExpression=".*"
                              ControlToValidate="cardno" CssClass="text-danger" Display="None"></asp:RegularExpressionValidator>
                      </div>
                      <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">Email Address</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="phone" runat="server" required="required" CssClass="form-control" placeholder="">Please enter an email address</asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Email address cannot be empty"
                                ControlToValidate="phone" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                              ErrorMessage=" Invalid email address" ValidationExpression=".*"
                              ControlToValidate="phone" CssClass="text-danger" Display="None"></asp:RegularExpressionValidator>
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
