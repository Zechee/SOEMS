<%@ Page Title=" Exam List" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KsxxList.aspx.cs" Inherits="zxksglxtWeb.KsxxList" %>
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
                            <label for="u_name" class="col-sm-1 control-label">Candidate</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="u_name" runat="server" CssClass="form-control" placeholder="Please enter the candidate's name"></asp:TextBox>
                            </div>
                            <label for="sj_name" class="col-sm-1 control-label">Paper</label>
                            <div class="col-sm-3">
                                <asp:TextBox ID="sj_name" runat="server" CssClass="form-control" placeholder="Please enter the exam paper name"></asp:TextBox>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="ks_zt" class="col-sm-1 control-label">Status</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ks_zt" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">--Please select the exam status--</asp:ListItem>
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                </asp:DropDownList> 
                            </div>
                            <label for="ks_jgzt" class="col-sm-1 control-label">Pass</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ks_jgzt" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">--Please select pass status--</asp:ListItem>
                                    <asp:ListItem Value="Fail">Fail</asp:ListItem>
                                    <asp:ListItem Value="Pass">Pass</asp:ListItem>
                                </asp:DropDownList> 
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click" />       
                                <%if (Session["login_role"]!=null&&Session["login_role"].ToString() == "Administrator") { %>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddKsxx.aspx" CssClass="btn btn-default">Add New</asp:HyperLink>
                                <%} %>
                            </div>
                          </div>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No data found">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="70">
                                        <ItemTemplate>  
                                            <%if (Session["login_role"]!=null&&Session["login_role"].ToString() == "Candidate") { %>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#"KsOnline.aspx?id="+Eval("ks_id").ToString() %>' CssClass="btn btn-sm btn-primary" Visible='<%#Eval("ks_zt").ToString()!="Completed"?true:false %>'>Exam</asp:HyperLink>
                                            <%} %>
                                            <%if (Session["login_role"]!=null&&Session["login_role"].ToString() == "Administrator") { %>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"KsxxList.aspx?action=del&id="+Eval("ks_id") %>' CssClass="btn btn-sm btn-danger">Delete</asp:HyperLink>
                                            <%} %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pass Status">
                                        <ItemTemplate>
                                            <asp:Panel ID="Panel1" runat="server" Visible='<%#Eval("ks_zt") != null && Eval("ks_zt").ToString() == "Completed"?true:false %>'>
                                                <div class='alert <%#Eval("ks_jgzt")!=null&&Eval("ks_jgzt").ToString()=="Fail"?"alert-danger":"alert-success" %> text-center' style='margin:0;padding:5px;'>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("ks_jgzt") %>'></asp:Label>
                                                </div>
                                            </asp:Panel>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="u_code" HeaderText="Candidate Account" />
                                    <asp:BoundField DataField="u_name" HeaderText="Candidate Name" />
                                    <asp:BoundField DataField="sj_name" HeaderText="Exam Paper Taken" />
                                    
                                    <asp:TemplateField HeaderText="Exam Status">
                                        <ItemTemplate>
                                            <div class='alert <%#Eval("ks_zt")!=null&&Eval("ks_zt").ToString()=="Completed"?"alert-success":Eval("ks_zt")!=null&&Eval("ks_zt").ToString()=="Pending"?"alert-info":"alert-warning" %> text-center' style="margin:0;padding:5px;">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("ks_zt") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="u_sex" HeaderText="Candidate Gender" />
                                    <asp:BoundField DataField="ks_score" HeaderText="Exam Score" />
                                    <asp:BoundField DataField="sj_jgx" HeaderText="Passing Score" />
                                    <asp:BoundField DataField="ks_kssj" HeaderText="Start Time" />
                                    <asp:BoundField DataField="ks_jssj" HeaderText="End Time" />
                                    <asp:BoundField DataField="u_cardno" HeaderText=" Student ID" />
                                    <asp:BoundField DataField="u_phone" HeaderText=" Email Address" />
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
