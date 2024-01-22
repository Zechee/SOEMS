<%@ Page Title="Question Bank List" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TKList.aspx.cs" Inherits="zxksglxtWeb.TKList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
    <style>
        .panel-body-scroll{
            overflow:auto;
        }
        table{
            width:100%;
            min-width:1980px;
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
                            <label for="title" class="col-sm-1 control-label">Question</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="title" runat="server" CssClass="form-control" placeholder=" Please enter the question"></asp:TextBox>
                            </div>
                            <label for="title" class="col-sm-1 control-label">Type</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="tklx" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">-- Please select a question type--</asp:ListItem>
                                    <asp:ListItem Value="1">Single Choice Question</asp:ListItem>
                                    <asp:ListItem Value="2">Multiple Choice Question</asp:ListItem>
                                    <asp:ListItem Value="3">True/False Question</asp:ListItem>
                                </asp:DropDownList>   
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddTK.aspx" CssClass="btn btn-default">Add New</asp:HyperLink>
                            </div>
                          </div>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No data found">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="140">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"EditTK.aspx?id="+Eval("id") %>' CssClass="btn btn-sm btn-primary">Edit</asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%#"TKList.aspx?action=del&id="+Eval("id") %>' onclick="return confirm('Confirm Deletion？')" CssClass="btn btn-sm btn-danger">Delete</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="title" HeaderText="Question" />
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("tklx").ToString()=="1"?"Single Choice Question":Eval("tklx").ToString()=="2"?"Multiple Choice Question":"True/False Question" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option A">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("tka").ToString()=="无"&&Eval("tklx").ToString()=="3"?"":Eval("tka").ToString() %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Option B">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("tkb").ToString()=="无"&&Eval("tklx").ToString()=="3"?"":Eval("tkb").ToString() %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Option C">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("tkc").ToString()=="无"&&Eval("tklx").ToString()=="3"?"":Eval("tkc").ToString() %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Option D">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("tkd").ToString()=="无"&&Eval("tklx").ToString()=="3"?"":Eval("tkd").ToString() %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option A" ItemStyle-Width="140">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("cka").ToString()=="1"?"√":"" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option B" ItemStyle-Width="140">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("ckb").ToString()=="1"?"√":"" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option C" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("ckc").ToString()=="1"?"√":"" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option D" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("ckd").ToString()=="1"?"√":"" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
