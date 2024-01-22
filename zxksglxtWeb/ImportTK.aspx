<%@ Page Title=" Import Question Bank" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ImportTK.aspx.cs" Inherits="zxksglxtWeb.ImportTK" %>
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
    <li>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SJList.aspx"> Exam Paper List</asp:HyperLink>
    </li>
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
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="" />
                                <asp:TextBox ID="tkids" runat="server" hidden="hidden"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" Text="Import" CssClass="btn btn-default" OnClick="Button2_Click" ValidationGroup="import" />
                            </div>
                          </div>
                    </div>
                    <div class="panel-body">
                        <div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="import"
                                ErrorMessage="Please select the question bank to import"
                                ControlToValidate="tkids" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="panel-body-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No data found">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox Checked='<%#Eval("sel").ToString()=="0"?false:true %>' tag='<%#Eval("id") %>' runat="server" onchange='changeData(this)'/>
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
                                    <asp:TemplateField HeaderText="Option A(Correct)" ItemStyle-Width="140">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Eval("cka").ToString()=="1"?"√":"" %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Option B(Incorrect)" ItemStyle-Width="140">
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
    <script>
        
        function changeData(obj, id) {
            console.log(obj);
            console.log(id);
            var checked = obj.getElementsByTagName("input").item(0).checked;
            var tag = obj.attributes["tag"].value;
            var input_tkids = document.getElementById('<%=tkids.ClientID %>');

            if (checked) {
                if (input_tkids.value == undefined || input_tkids.value == "") {
                    input_tkids.value = tag;
                } else {
                    input_tkids.value += "," + tag;
                }
            }
            else {
                var tmp = input_tkids.value.split(',');
                input_tkids.value = "";
                for (var i = 0; i < tmp.length; i++) {
                    if (tmp[i] == tag) {
                    }
                    else {
                        if (input_tkids.value == undefined || input_tkids.value == "") {
                            input_tkids.value = tmp[i];
                        } else {
                            input_tkids.value += "," + tmp[i];
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
