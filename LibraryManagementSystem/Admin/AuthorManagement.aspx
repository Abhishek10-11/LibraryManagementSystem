<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AuthorManagement.aspx.cs" Inherits="LibraryManagementSystem.Admin.AuthorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
    <br />
   
        <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../img/user.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TxtAuthID" runat="server" CssClass="form-control"
                                        placeholder="Enter ID..."></asp:TextBox>
                                    <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="btnGo_Click"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Author Name:</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtAuthName" runat="server" CssClass="form-control"
                                       placeholder="Author Name..."></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-success" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-lg btn-block btn-warning" OnClick="btnupdate_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-lg btn-block btn-danger" OnClick="btndelete_Click"/>
                            </div>

                        </div>
                    </div>

                </div>
                     <a href="AdminHomePage.aspx"> << Back to Home...</a>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Author Details</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridAutherInfo" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AM_LibraryConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
               
        </div>
    </div>
        </div>
</asp:Content>
