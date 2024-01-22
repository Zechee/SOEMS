<%@ Page Title="Edit Question Bank" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditTK.aspx.cs" Inherits="zxksglxtWeb.EditTK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="style" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" runat="server">
    <li>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/TKList.aspx">Question Bank List</asp:HyperLink>
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
                        <label for="title" class="col-sm-2 control-label">Question</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="title" runat="server" required="required" CssClass="form-control" placeholder="Please enter the question"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="Question cannot be empty"
                                ControlToValidate="title" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="tklx" runat="server" CssClass="form-control" required="required" OnSelectedIndexChanged="tklx_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="">-- Please select a question type--</asp:ListItem>
                                <asp:ListItem Value="1">Single Choice Question</asp:ListItem>
                                <asp:ListItem Value="2">Multiple Choice Question</asp:ListItem>
                                <asp:ListItem Value="3">True/False Question</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Question cannot be empty"
                                ControlToValidate="tklx" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div class="form-group">
                        <label for="tka1" class="col-sm-2 control-label">Option A</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tka1" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option A"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage=" Option A content cannot be empty"
                                ControlToValidate="tka1" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>  
                      <div class="form-group">
                        <label for="tkb1" class="col-sm-2 control-label">Option B</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkb1" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option B"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage=" Option B content cannot be empty"
                                ControlToValidate="tkb1" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="tkc1" class="col-sm-2 control-label">Option C</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkc1" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option C"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage=" Option C content cannot be empty"
                                ControlToValidate="tkc1" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="tkd1" class="col-sm-2 control-label">Option D</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkd1" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option D"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage=" Option D content cannot be empty"
                                ControlToValidate="tkd1" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="cka1" class="col-sm-2 control-label">Answer</label>
                        <div class="col-sm-10">
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="cka1" GroupName="ck1" runat="server" /> Option A
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="ckb1" GroupName="ck1" runat="server" /> Option B
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="ckc1" GroupName="ck1" runat="server" /> Option C
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="ckd1" GroupName="ck1" runat="server" /> Option D
                                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                    ErrorMessage="Answer cannot be empty" CssClass="text-danger" Display="None"
                                    ClientValidationFunction="checkCheckedIfNull1"></asp:CustomValidator>
                            </label>
                          </div>
                        </div>
                      </div>


                        </asp:Panel>

                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                            
                      <div class="form-group">
                        <label for="tka2" class="col-sm-2 control-label">Option A</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tka2" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option A"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage=" Option A content cannot be empty"
                                ControlToValidate="tka2" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div>  
                      <div class="form-group">
                        <label for="tkb2" class="col-sm-2 control-label">Option B</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkb2" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option B"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage=" Option B content cannot be empty"
                                ControlToValidate="tkb2" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="tkc2" class="col-sm-2 control-label">Option C</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkc2" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option C"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage=" Option C content cannot be empty"
                                ControlToValidate="tkc2" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="tkd2" class="col-sm-2 control-label">Option D</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tkd2" runat="server" required="required" CssClass="form-control" placeholder="Please enter Option D"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="Option D content cannot be empty"
                                ControlToValidate="tkd2" CssClass="text-danger" Display="None"></asp:RequiredFieldValidator>
                      </div> 
                      <div class="form-group">
                        <label for="cka2" class="col-sm-2 control-label">Answer</label>
                        <div class="col-sm-10">
                          <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="cka2" runat="server" /> Option A
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="ckb2" runat="server" /> Option B
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="ckc2" runat="server" /> Option C
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="ckd2" runat="server" /> Option D
                                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                    ErrorMessage="Answer cannot be empty" CssClass="text-danger" Display="None"
                                    ClientValidationFunction="checkCheckedIfNull2"></asp:CustomValidator>
                            </label>
                          </div>
                        </div>
                      </div>
                        </asp:Panel>
                      <asp:Panel ID="Panel3" runat="server" Visible="false">
                         
                      <div class="form-group">
                        <label for="cka3" class="col-sm-2 control-label">Answer</label>
                        <div class="col-sm-10">
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="cka3" GroupName="ck3" runat="server" /> Correct
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                                <asp:RadioButton ID="ckb3" GroupName="ck3" runat="server" /> Incorrect
                                <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                    ErrorMessage="Answer cannot be empty" CssClass="text-danger" Display="None"
                                    ClientValidationFunction="checkCheckedIfNull1"></asp:CustomValidator>
                            </label>
                          </div>
                        </div>
                      </div>


                        </asp:Panel>
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
        function checkCheckedIfNull1(source, args) {
            var cka = document.getElementById('<%= cka1.ClientID %>');
            var ckb = document.getElementById('<%= ckb1.ClientID %>');
            var ckc = document.getElementById('<%= ckc1.ClientID %>');
            var ckd = document.getElementById('<%= ckd1.ClientID %>');
            if (cka.checked) {
                args.IsValid = true; return;
            }
            if (ckb.checked) {
                args.IsValid = true; return;
            }
            if (ckc.checked) {
                args.IsValid = true; return;
            }
            if (ckd.checked) {
                args.IsValid = true; return;
            }
            args.IsValid = false;
        }
        function checkCheckedIfNull2(source,args) {
            var cka = document.getElementById('<%= cka2.ClientID %>');
            var ckb = document.getElementById('<%= ckb2.ClientID %>');
            var ckc = document.getElementById('<%= ckc2.ClientID %>');
            var ckd = document.getElementById('<%= ckd2.ClientID %>');
            if (cka.checked) {
                args.IsValid = true; return;
            }
            if (ckb.checked) {
                args.IsValid = true; return;
            }
            if (ckc.checked) {
                args.IsValid = true; return;
            }
            if (ckd.checked) {
                args.IsValid = true; return;
            }
            args.IsValid = false;
        }
        
    </script>
</asp:Content>
