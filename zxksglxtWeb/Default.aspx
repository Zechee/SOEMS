<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="zxksglxtWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <%=Page.Title %>
        </div>
        <div class="panel-body">
            <h2 class="text-center">Welcome to the Online Exam System</h2>
            <hr />
        </div>
        <div class="panel-body">
            <div class="row">
                <%if (Session["login_role"] != null && Session["login_role"].ToString() == "Administrator") {  %>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-star" style="color:#19ad0c"></i>
                        </div>
                        <div class="caption text-center"><a href="TKList.aspx">Question Bank：<%=NUM_1 %></a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-asterisk" style="color:#19ad0c"></i>
                        </div>
                        <div class="caption text-center"><a href="SJList.aspx"> Exam Papers：<%=NUM_2 %></a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-user" style="color:#155fdf"></i>
                        </div>
                        <div class="caption text-center"><a href="YhxxList.aspx">Users：<%=NUM_3 %></a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-user" style="color:#ff0000"></i>
                        </div>
                        <div class="caption text-center"><a href="KsxxList.aspx">Fail：<%=NUM_4 %></a></div>
                    </div>
                </div>
                <%} %>
                <%if (Session["login_role"] != null && Session["login_role"].ToString() == "Candidate") {  %>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-asterisk" style="color:#19ad0c"></i>
                        </div>
                        <div class="caption text-center"><a href="KsxxList.aspx">Exam Papers：<%=NUM_1 %></a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-user" style="color:#155fdf"></i>
                        </div>
                        <div class="caption text-center"><a href="KsxxList.aspx">Pass：<%=NUM_2 %></a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <div style="font-size:30pt;text-align:center;">
                            <i class="glyphicon glyphicon-user" style="color:#ff0000"></i>
                        </div>
                        <div class="caption text-center"><a href="KsxxList.aspx">Fail：<%=NUM_3 %></a></div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
