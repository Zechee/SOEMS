<%@ Page Title="User Login" Language="C#" MasterPageFile="~/LoginSite1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="zxksglxtWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
    <style>
        #bg_container{
            position:absolute;
            left:0;
            right:0;
            top:0;
            bottom:0;
            z-index:0;
            background-image:url(images/bg.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div id="bg_container">
    </div>
    <div class="row">
        <div class="col-sm-4 col-sm-offset-4" style="margin-top:50px;z-index:999;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <%=Page.Title %>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" runat="server">
                      <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="code" runat="server" required="required" CssClass="form-control" placeholder="Please enter your username"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Username cannot be empty"
                                ControlToValidate="code" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                            
                      <div class="form-group">
                        <label for="pwd" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="pwd" runat="server" type="password" required="required" CssClass="form-control" placeholder=" Please enter your password"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Password cannot be empty"
                            ControlToValidate="pwd" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage=""
                            ControlToValidate="pwd" CssClass="text-danger" Display="None"></asp:CustomValidator>
                      </div>
                      <div class="form-group">
                        <label for="role" class="col-sm-2 control-label"> UserType</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="role" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Value="">--Please select a user type--</asp:ListItem>
                                <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                                <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                            </asp:DropDownList>      
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="User type cannot be empty"
                                ControlToValidate="role" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>                      
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Button1_Click" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" DisplayMode="List" style="padding-top:10px;"/>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
