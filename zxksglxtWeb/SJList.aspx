<%@ Page Title=" Exam Paper List" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SJList.aspx.cs" Inherits="zxksglxtWeb.SJList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
    <style>
        .panel-body-scroll{
            overflow:auto;
        }
        table{
            width:100%;
            /*min-width:1980px;*/
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
                            <label for="title" class="col-sm-1 control-label">Paper</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Please enter the exam paper name"></asp:TextBox>
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddSJ.aspx" CssClass="btn btn-default">Add New</asp:HyperLink>
                            </div>
                          </div>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No data found">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="220">
                                        <ItemTemplate>                                            
                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%#"ImportTK.aspx?id="+Eval("id") %>' CssClass="btn btn-sm btn-info">Import</asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"EditSJ.aspx?id="+Eval("id") %>' CssClass="btn btn-sm btn-primary">Edit</asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#"SJList.aspx?action=del&id="+Eval("id") %>' onclick="return confirm('Confirm deletion？')" CssClass="btn btn-sm btn-danger">Delete</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Paper Name" />
                                    <asp:BoundField DataField="score" HeaderText=" Score per Question" />
                                    <asp:BoundField DataField="tk_sl" HeaderText="Number of Questions" />
                                    <asp:BoundField DataField="jgx" HeaderText=" Passing Score" />
                                    <asp:BoundField DataField="memo" HeaderText="Remarks" />
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
