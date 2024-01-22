<%@ Page Title=" Online Exam" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KsOnline.aspx.cs" Inherits="zxksglxtWeb.KsOnline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
    <li>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/KsxxList.aspx">Exam List</asp:HyperLink>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <%=Page.Title %>
        </div>
        <div class="panel-body">
            <form runat="server">
                <h4>Single Choice Question</h4>
                <hr />
                <%int c1 = 1; %>
                <%if (tableTK != null) { %>
                <%foreach (System.Data.DataRow row in tableTK.Rows) { %>
                <%if (row["tklx"].ToString() == "1") {  %>
                <h6><%=c1 %>.<%=row["title"] %></h6>
                <div class="form-group">
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tka1_" + row["id"] %>" type="radio" name="<%="tk1_" + row["id"] %>" value="a"/><%=row["tka"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tkb1_" + row["id"] %>" type="radio" name="<%="tk1_" + row["id"] %>" value="b"/><%=row["tkb"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tkc1_" + row["id"] %>" type="radio" name="<%="tk1_" + row["id"] %>" value="c"/><%=row["tkc"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tkd1_" + row["id"] %>" type="radio" name="<%="tk1_" + row["id"] %>" value="d"/><%=row["tkd"] %>
                            </label>
                        </div>
                    </div>
                </div>
                <%c1++; } }  %>


                <h4>Multiple Choice Question</h4>
                <hr />
                <%int c2 = 1; %>
                <%foreach (System.Data.DataRow row in tableTK.Rows) { %>
                <%if (row["tklx"].ToString() == "2") {  %>
                <h6><%=c1 %>.<%=row["title"] %></h6>
                <div class="form-group">
                    <div class="col-sm-6">
                        <div class="checkbox">
                            <label>
                                <input id="<%="tka2_" + row["id"] %>" type="checkbox" name="<%="tka2_" + row["id"] %>"/><%=row["tka"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="checkbox">
                            <label>
                                <input id="<%="tkb2_" + row["id"] %>" type="checkbox" name="<%="tkb2_" + row["id"] %>"/><%=row["tkb"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="checkbox">
                            <label>
                                <input id="<%="tkc2_" + row["id"] %>" type="checkbox" name="<%="tkc2_" + row["id"] %>"/><%=row["tkc"] %>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="checkbox">
                            <label>
                                <input id="<%="tkd2_" + row["id"] %>" type="checkbox" name="<%="tkd2_" + row["id"] %>"/><%=row["tkd"] %>
                            </label>
                        </div>
                    </div>
                </div>
                <%c2++; } } %>


                <h4>True/False Question</h4>
                <hr />
                <%int c3 = 1; %>
                <%foreach (System.Data.DataRow row in tableTK.Rows) { %>
                <%if (row["tklx"].ToString() == "3") {  %>
                <h6><%=c1 %>.<%=row["title"] %></h6>
                <div class="form-group">
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tka3_" + row["id"] %>" type="radio" name="<%="tk3_" + row["id"] %>" value="a"/>√
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="radio">
                            <label>
                                <input id="<%="tkb3_" + row["id"] %>" type="radio" name="<%="tk3_" + row["id"] %>" value="b"/>×
                            </label>
                        </div>
                    </div>
                    
                </div>
                <%c3++; } } }%>

                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Submit Exam Paper" CssClass="btn btn-primary" OnClientClick="return confirm('Confirm Submission of Exam Paper？')" OnClick="Button1_Click" />
                </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
