<%@ Page Title="User List" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="YhxxList.aspx.cs" Inherits="zxksglxtWeb.YhxxList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
    <style>
        .panel-body-scroll{
            overflow:auto;
        }
        table{
            width:100%;
            min-width:1366px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <form class="form-horizontal" runat="server">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <%=Page.Title %>
                    </div>
                    <div class="panel-body">
                          <div class="form-group">
                            <label for="code" class="col-sm-1 control-label">Username</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="code" runat="server" CssClass="form-control" placeholder="Please enter the username"></asp:TextBox>
                            </div>
                            <label for="name" class="col-sm-1 control-label">Name</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Please enter the name"></asp:TextBox>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="role" class="col-sm-1 control-label">Role</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="role" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">--Please select a role--</asp:ListItem>
                                    <asp:ListItem Value="Candidate">Candidate</asp:ListItem>
                                    <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                                </asp:DropDownList>                         
                            </div>
                            <label for="cardno" class="col-sm-1 control-label">Student ID</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="cardno" runat="server" CssClass="form-control" placeholder="Please enter the student ID"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddYhxx.aspx" CssClass="btn btn-default">Add</asp:HyperLink>
                            </div>
                          </div>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No data found">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="140">
                                        <ItemTemplate>                                            
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"EditYhxx.aspx?code="+Eval("code") %>' CssClass="btn btn-sm btn-primary">Edit</asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#"YhxxList.aspx?action=del&code="+Eval("code") %>' onclick="return confirm('Confirm Deletion？')" CssClass="btn btn-sm btn-danger">Delete</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="role" HeaderText="User Type" />
                                    <asp:BoundField DataField="code" HeaderText="Username" />
                                    <asp:BoundField DataField="name" HeaderText="Name" />
                                    <asp:BoundField DataField="sex" HeaderText="Gender" />
                                    <asp:BoundField DataField="birth" HeaderText="Date of Birth" />
                                    <asp:BoundField DataField="cardno" HeaderText="Student ID" />
                                    <asp:BoundField DataField="phone" HeaderText="Email Address" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
